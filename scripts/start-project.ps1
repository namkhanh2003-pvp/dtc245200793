# Windows PowerShell 5.1+. Double-click run_project.bat in the project root.
# Starts the existing Compose project; never resets data or rewrites .env.
[CmdletBinding()]
param(
    [ValidateRange(1, 600)]
    [int] $DockerTimeoutSeconds = 180,
    [ValidateRange(1, 600)]
    [int] $WebsiteTimeoutSeconds = 120
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$websiteUrl = 'http://localhost:18080/index.php'
$exitCode = 0

function Get-DockerEngineType {
    # Unavailable Docker is expected while Desktop is still starting.
    # Windows PowerShell treats redirected native stderr differently from PS 7.
    $savedPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $result = & $script:dockerExe info --format '{{.OSType}}' 2>$null
        $nativeExitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $savedPreference
    }
    if ($nativeExitCode -eq 0) {
        return (($result -join "`n").Trim())
    }
    return $null
}

Push-Location -LiteralPath $projectRoot
try {
    Write-Host '============================================================'
    Write-Host '  BEP NHA - WEBSITE CONG THUC NAU AN'
    Write-Host '  Tu khoi dong Docker va mo website'
    Write-Host '============================================================'
    Write-Host ''

    Write-Host '[1/5] Kiem tra thu muc du an ...'
    foreach ($relativePath in @(
        'docker-compose.yml', 'docker-compose.override.yml',
        'Dockerfile', 'app/index.php'
    )) {
        if (-not (Test-Path -LiteralPath (Join-Path $projectRoot $relativePath) -PathType Leaf)) {
            throw "Thieu $relativePath. Hay dat run_project.bat va scripts trong thu muc recipe-website co san ma nguon."
        }
    }
    if (-not (Test-Path -LiteralPath (Join-Path $projectRoot '.env') -PathType Leaf)) {
        throw 'Thieu .env. Hay dung thu muc recipe-website da thiet lap tren may cua ban. Neu la may moi, thiet lap theo README.md truoc.'
    }

    # Windows may expose both docker.exe and an extensionless docker executable.
    # Select one executable before reading Source, never an array of paths.
    $dockerCommand = Get-Command docker.exe -CommandType Application -ErrorAction SilentlyContinue |
        Select-Object -First 1
    if (-not $dockerCommand) {
        $dockerCommand = Get-Command docker -CommandType Application -ErrorAction SilentlyContinue |
            Select-Object -First 1
    }
    $dockerCandidates = @()
    $desktopCandidates = @()
    foreach ($installRoot in @($env:ProgramW6432, $env:ProgramFiles, $env:LOCALAPPDATA)) {
        if (-not [string]::IsNullOrWhiteSpace($installRoot)) {
            $dockerCandidates += Join-Path $installRoot 'Docker/Docker/resources/bin/docker.exe'
            $desktopCandidates += Join-Path $installRoot 'Docker/Docker/Docker Desktop.exe'
        }
    }
    # Docker Desktop also supports a per-user install under Local\Programs.
    if (-not [string]::IsNullOrWhiteSpace($env:LOCALAPPDATA)) {
        $dockerCandidates += Join-Path $env:LOCALAPPDATA 'Programs/DockerDesktop/resources/bin/docker.exe'
        $desktopCandidates += Join-Path $env:LOCALAPPDATA 'Programs/DockerDesktop/Docker Desktop.exe'
    }
    if ($dockerCommand) {
        $script:dockerExe = [string] $dockerCommand.Source
    } else {
        $script:dockerExe = $dockerCandidates |
            Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } |
            Select-Object -First 1
    }
    if (-not $script:dockerExe) {
        throw 'Chua tim thay Docker Desktop. Hay cai Docker Desktop, khoi dong lai may neu duoc yeu cau, roi bam lai run_project.bat.'
    }
    $selectedInstallRoot = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $script:dockerExe))
    if ($selectedInstallRoot) {
        $desktopCandidates = @((Join-Path $selectedInstallRoot 'Docker Desktop.exe')) + $desktopCandidates
    }

    Write-Host '[2/5] Kiem tra Docker Desktop ...'
    $engineType = Get-DockerEngineType
    if (-not $engineType) {
        $desktopExe = $desktopCandidates |
            Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } |
            Select-Object -First 1
        if ($desktopExe) {
            Write-Host '      Dang mo Docker Desktop ...'
            Start-Process -FilePath $desktopExe | Out-Null
        } else {
            Write-Host '      Hay mo Docker Desktop tren may cua ban.'
        }
        Write-Host "      Cho Docker san sang, toi da $DockerTimeoutSeconds giay ..."
        $dockerClock = [System.Diagnostics.Stopwatch]::StartNew()
        while (-not $engineType -and $dockerClock.Elapsed.TotalSeconds -lt $DockerTimeoutSeconds) {
            Start-Sleep -Seconds 3
            $engineType = Get-DockerEngineType
        }
        if (-not $engineType) {
            throw 'Docker Desktop chua san sang. Hay mo Docker Desktop, doi Engine running roi bam lai run_project.bat.'
        }
    }
    if ($engineType -ne 'linux') {
        throw 'Docker dang dung Windows containers. Hay chuyen Docker Desktop sang Linux containers roi chay lai.'
    }
    & $script:dockerExe compose version
    if ($LASTEXITCODE -ne 0) {
        throw 'Chua dung duoc Docker Compose. Hay cap nhat Docker Desktop roi chay lai.'
    }

    # Keep the name used by the existing volumes, containers and monitoring labels.
    # Explicit files/root also protect against a shortcut's different working folder.
    $composeArgs = @(
        'compose', '--project-name', 'recipe-website',
        '--project-directory', $projectRoot,
        '--env-file', (Join-Path $projectRoot '.env'),
        '-f', (Join-Path $projectRoot 'docker-compose.yml'),
        '-f', (Join-Path $projectRoot 'docker-compose.override.yml')
    )

    Write-Host '[3/5] Kiem tra cau hinh ...'
    & $script:dockerExe @composeArgs config --quiet
    if ($LASTEXITCODE -ne 0) {
        throw 'Cau hinh chua hop le. Hay xem thong bao Docker o tren. Neu chua thiet lap giam sat, lam theo README.md truoc.'
    }

    Write-Host '[4/5] Khoi dong website, database, giam sat va logging ...'
    Write-Host '      Lan dau tai image/build co the mat vai phut. Hay giu cua so nay.'
    & $script:dockerExe @composeArgs up -d
    if ($LASTEXITCODE -ne 0) {
        throw 'Khoi dong container that bai. Hay xem loi o tren; kiem tra cong 18080 va trang thai Docker Desktop.'
    }

    Write-Host '[5/5] Doi website san sang ...'
    $webClock = [System.Diagnostics.Stopwatch]::StartNew()
    $websiteReady = $false
    while (-not $websiteReady -and $webClock.Elapsed.TotalSeconds -lt $WebsiteTimeoutSeconds) {
        $response = $null
        try {
            $response = Invoke-WebRequest -Uri $websiteUrl -UseBasicParsing -TimeoutSec 5 -MaximumRedirection 0
        } catch {
            # Connection errors, redirects and non-200 responses are not ready.
        }
        if ($null -ne $response -and [int] $response.StatusCode -eq 200) {
            if ($response.Content -notmatch '<title>\s*Bếp Nhà') {
                throw 'Cong 18080 dang tra ve trang khac, khong phai Bep Nha. Hay kiem tra docker compose ps va chuong trinh dang dung cong nay.'
            }
            $websiteReady = $true
        } else {
            Start-Sleep -Seconds 2
        }
    }
    if (-not $websiteReady) {
        throw 'Website chua tra HTTP 200. Trong CMD tai thu muc du an, chay: docker compose ps va docker compose logs --tail=40 nginx web db.'
    }

    Start-Process -FilePath $websiteUrl | Out-Null
    Write-Host ''
    Write-Host '[THANH CONG] Website da san sang; da gui lenh mo trinh duyet.' -ForegroundColor Green
    Write-Host 'Website   : http://localhost:18080'
    Write-Host 'Grafana   : http://localhost:18083'
    Write-Host 'phpMyAdmin: http://localhost:18081'
    Write-Host 'Dong cua so nay khong dung website. Hay giu Docker Desktop dang chay.'
} catch {
    $exitCode = 1
    Write-Host ''
    Write-Host ('[LOI] ' + $_.Exception.Message) -ForegroundColor Red
} finally {
    Pop-Location
}
exit $exitCode
