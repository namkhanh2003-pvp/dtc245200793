# Run from CMD: powershell -NoProfile -ExecutionPolicy Bypass -File .\monitoring\setup.ps1
# This is a local setup utility, not a long-running service.
$ErrorActionPreference = "Stop"
$projectRoot = Split-Path -Parent $PSScriptRoot
$envPath = Join-Path $projectRoot ".env"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function New-MonitoringSecret {
    $bytes = New-Object byte[] 32
    $rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()
    try { $rng.GetBytes($bytes) } finally { $rng.Dispose() }
    return (-join ($bytes | ForEach-Object { $_.ToString("x2") }))
}

function Get-OrCreateSecret([string] $key) {
    $pattern = "(?m)^" + [regex]::Escape($key) + "=([^\r\n]*)\r?$"
    $entries = [regex]::Matches($script:envText, $pattern)
    if ($entries.Count -gt 1) { throw "Duplicate monitoring key in .env: $key" }
    if ($entries.Count -eq 1 -and $entries[0].Groups[1].Value -ne "") {
        $value = $entries[0].Groups[1].Value
        if ($value -notmatch "^[0-9a-f]{64}$") {
            throw "$key must use the generated 64-character hexadecimal format."
        }
        return $value
    }
    $value = New-MonitoringSecret
    $line = $key + "=" + $value
    if ($entries.Count -eq 1) {
        $script:envText = [regex]::Replace($script:envText, $pattern, $line)
    } else {
        if ($script:envText.Length -gt 0 -and -not $script:envText.EndsWith("`n")) {
            $script:envText += "`r`n"
        }
        $script:envText += $line + "`r`n"
    }
    return $value
}

Push-Location $projectRoot
try {
    if (-not (Test-Path $envPath -PathType Leaf)) {
        throw "Local .env is missing. Configure MySQL and start the base application first."
    }
    Get-Command docker -ErrorAction Stop | Out-Null
    Get-Command git -ErrorAction Stop | Out-Null
    $trackedEnv = & git ls-files -- .env
    if ($LASTEXITCODE -ne 0 -or $trackedEnv) { throw ".env must not be tracked by Git." }
    & git check-ignore --quiet .env
    if ($LASTEXITCODE -ne 0) { throw ".env must be excluded by .gitignore before setup." }

    # Use the base file explicitly because the override requires the new secrets.
    & docker compose -f docker-compose.yml exec -T db mysqladmin ping --silent
    if ($LASTEXITCODE -ne 0) { throw "MySQL is not ready. Start the base application first." }

    $script:envText = [System.IO.File]::ReadAllText($envPath)
    $grafanaPassword = Get-OrCreateSecret "GRAFANA_ADMIN_PASSWORD"
    $exporterPassword = Get-OrCreateSecret "MYSQL_EXPORTER_PASSWORD"
    [System.IO.File]::WriteAllText($envPath, $script:envText, $utf8NoBom)

    # Only generated hexadecimal text enters SQL. Root's existing password is
    # read inside the database container, not placed in command-line arguments.
    $sql = @"
CREATE USER IF NOT EXISTS 'recipe_exporter'@'%' IDENTIFIED BY '$exporterPassword' WITH MAX_USER_CONNECTIONS 3;
ALTER USER 'recipe_exporter'@'%' IDENTIFIED BY '$exporterPassword' WITH MAX_USER_CONNECTIONS 3;
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'recipe_exporter'@'%';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'recipe_exporter'@'%';
"@
    $shellPrefix = @'
set -eu
export MYSQL_PWD="$MYSQL_ROOT_PASSWORD"
mysql --user=root <<'RECIPE_MONITORING_SQL'
'@
    $payload = $shellPrefix + "`n" + $sql + "`nRECIPE_MONITORING_SQL`n"
    $oldOutputEncoding = $OutputEncoding
    try {
        $OutputEncoding = [System.Text.Encoding]::ASCII
        # Windows PowerShell uses CRLF for native stdin. Remove CR inside Docker.
        $payload | & docker compose -f docker-compose.yml exec -T db bash -c "tr -d '\015' | bash"
        if ($LASTEXITCODE -ne 0) { throw "Could not configure the MySQL monitoring account." }
    } finally {
        $OutputEncoding = $oldOutputEncoding
    }
    Write-Host "Monitoring setup complete." -ForegroundColor Green
    Write-Host "Secrets are saved in your local .env; they are not printed."
    Write-Host "Next: docker compose config --quiet"
    Write-Host "Then: docker compose up -d"
} finally {
    Pop-Location
}
