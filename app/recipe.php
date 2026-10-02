<?php
declare(strict_types=1);
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/functions.php';
header('Content-Type: text/html; charset=utf-8');

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1]]);
$recipe = false;
$ingredients = [];
$steps = [];
$related = [];

try {
    if ($id !== false && $id !== null) {
        $statement = $pdo->prepare('SELECT r.*, c.name AS category_name FROM recipes r JOIN categories c ON c.id = r.category_id WHERE r.id = :id');
        $statement->execute(['id' => $id]);
        $recipe = $statement->fetch();
        if ($recipe !== false) {
            $statement = $pdo->prepare('SELECT i.id, i.name, ri.quantity, ri.unit FROM recipe_ingredients ri JOIN ingredients i ON i.id = ri.ingredient_id WHERE ri.recipe_id = :id ORDER BY i.name');
            $statement->execute(['id' => $id]);
            $ingredients = $statement->fetchAll();
            foreach (preg_split('/\r\n|\r|\n/', $recipe['instructions']) as $line) {
                $line = trim($line);
                if ($line !== '') {
                    $steps[] = preg_replace('/^\d+\.\s*/u', '', $line);
                }
            }
            $statement = $pdo->prepare('SELECT r.id, r.title, r.image_url, r.prep_time_minutes, c.name AS category_name FROM recipes r JOIN categories c ON c.id = r.category_id WHERE r.id <> :id ORDER BY r.created_at DESC, r.id DESC LIMIT 3');
            $statement->execute(['id' => $id]);
            $related = $statement->fetchAll();
        }
    }
} catch (PDOException $e) {
    error_log('Recipe detail query failed: ' . $e->getMessage());
    http_response_code(500);
    exit('Không thể tải công thức. Vui lòng thử lại sau.');
}
if ($recipe === false) {
    http_response_code(404);
}
$title = $recipe === false ? 'Không tìm thấy công thức' : $recipe['title'];
$image = $recipe === false ? null : recipe_image($recipe);
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= h($title) ?> — Bếp Nhà</title>
    <link rel="icon" href="assets/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="style.css?v=4">
</head>
<body>
<a class="skip-link" href="#main">Đến nội dung chính</a>
<header class="site-header">
    <div class="container header-inner">
        <a class="brand" href="index.php"><span class="brand-mark"><?= icon('bowl') ?></span>Bếp Nhà<span class="brand-dot">.</span></a>
        <nav class="main-nav" aria-label="Điều hướng chính"><a class="active" href="index.php#recipes">Công thức</a><a href="index.php#categories">Danh mục</a></nav>
        <a class="button button-small header-cta" href="index.php#recipes">Cùng vào bếp <?= icon('arrow') ?></a>
    </div>
</header>
<main id="main" class="container detail-page">
    <nav class="breadcrumbs" aria-label="Đường dẫn"><a href="index.php">Trang chủ</a><span>/</span><a href="index.php#recipes">Công thức</a><span>/</span><span><?= h($title) ?></span></nav>
    <?php if ($recipe === false): ?>
        <section class="empty-state"><?= icon('bowl') ?><h1>Không tìm thấy công thức</h1><p>Công thức này không tồn tại. Bạn chọn một món khác nhé.</p><a class="button" href="index.php">Về Bếp Nhà</a></section>
    <?php else: ?>
        <section class="recipe-intro">
            <div class="detail-image-wrap"><?php if ($image !== null): ?><img src="<?= h($image) ?>" alt="<?= h($recipe['title']) ?>" width="1536" height="1024" fetchpriority="high"><?php else: ?><span class="image-placeholder"><?= icon('bowl') ?></span><?php endif; ?></div>
            <div class="recipe-intro-copy">
                <a class="detail-category" href="index.php?category=<?= (int) $recipe['category_id'] ?>#recipes"><?= h($recipe['category_name']) ?></a>
                <h1><?= h($recipe['title']) ?></h1>
                <p><?= h($recipe['description'] ?? '') ?></p>
                <div class="detail-facts"><div><?= icon('clock') ?><span>Thời gian<strong><?= (int) $recipe['prep_time_minutes'] ?> phút</strong></span></div><div><?= icon('users') ?><span>Khẩu phần<strong><?= (int) $recipe['servings'] ?> người</strong></span></div></div>
                <a class="button" href="#cooking">Bắt đầu nấu <?= icon('arrow') ?></a>
            </div>
        </section>
        <div id="cooking" class="detail-grid">
            <section class="detail-panel ingredients-panel" aria-labelledby="ingredients-title">
                <p class="eyebrow">CHUẨN BỊ TRƯỚC KHI NẤU</p><h2 id="ingredients-title">Nguyên liệu</h2><p class="panel-note">Đánh dấu những nguyên liệu bạn đã chuẩn bị.</p>
                <?php if ($ingredients === []): ?><p>Chưa có thông tin nguyên liệu.</p>
                <?php else: ?>
                    <ul class="ingredient-list">
                        <?php foreach ($ingredients as $ingredient): ?>
                            <?php $quantity = rtrim(rtrim(number_format((float) $ingredient['quantity'], 3, '.', ''), '0'), '.'); ?>
                            <li><label><input type="checkbox"><span class="ingredient-name"><?= h($ingredient['name']) ?></span><strong><?= h($quantity) ?> <?= h($ingredient['unit']) ?></strong></label></li>
                        <?php endforeach; ?>
                    </ul>
                <?php endif; ?>
            </section>
            <section class="detail-panel" aria-labelledby="steps-title">
                <p class="eyebrow">VÀO BẾP CÙNG NHAU</p><h2 id="steps-title">Cách thực hiện</h2>
                <?php if ($steps === []): ?><p>Chưa có hướng dẫn thực hiện.</p>
                <?php else: ?><ol class="step-list"><?php foreach ($steps as $step): ?><li><p><?= h($step) ?></p></li><?php endforeach; ?></ol><?php endif; ?>
            </section>
        </div>
        <?php if ($related !== []): ?>
            <section class="related-section" aria-labelledby="related-title">
                <p class="eyebrow">THÊM MỘT CHÚT CẢM HỨNG</p><h2 id="related-title">Bạn cũng có thể thích</h2>
                <div class="related-grid">
                    <?php foreach ($related as $item): ?><?php $relatedImage = recipe_image($item); ?>
                        <a class="related-card" href="recipe.php?id=<?= (int) $item['id'] ?>"><?php if ($relatedImage !== null): ?><img src="<?= h($relatedImage) ?>" alt="" width="1536" height="1024" loading="lazy"><?php else: ?><span class="image-placeholder"><?= icon('bowl') ?></span><?php endif; ?><div><span><?= h($item['category_name']) ?></span><h3><?= h($item['title']) ?></h3><p><?= icon('clock') ?> <?= (int) $item['prep_time_minutes'] ?> phút</p></div><?= icon('arrow') ?></a>
                    <?php endforeach; ?>
                </div>
            </section>
        <?php endif; ?>
    <?php endif; ?>
</main>
<footer class="site-footer"><div class="container footer-inner"><a class="brand" href="index.php"><span class="brand-mark"><?= icon('bowl') ?></span>Bếp Nhà<span class="brand-dot">.</span></a><p>Công thức quen thuộc. Bữa cơm đong đầy.</p><a href="index.php#recipes">Khám phá thêm món ngon →</a></div></footer>
</body>
</html>
