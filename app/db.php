<?php
declare(strict_types=1);

// Docker Compose will pass these settings to the PHP container.
$host = getenv('DB_HOST') ?: 'db';
$database = getenv('DB_NAME') ?: 'recipe_db';
$username = getenv('DB_USER') ?: 'recipe_user';
$password = getenv('DB_PASSWORD');

try {
    if ($password === false || $password === '') {
        throw new RuntimeException('DB_PASSWORD is missing');
    }

    $pdo = new PDO(
        "mysql:host={$host};port=3306;dbname={$database};charset=utf8mb4",
        $username,
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ]
    );
} catch (PDOException | RuntimeException $e) {
    error_log('Database connection failed: ' . $e->getMessage());
    http_response_code(500);
    header('Content-Type: text/plain; charset=utf-8');
    exit('Không thể kết nối cơ sở dữ liệu. Vui lòng kiểm tra cấu hình và nhật ký ứng dụng.');
}
