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
$ingredientNotes = [];
$tips = [];
$timeNote = '';
$printView = ($_GET['print'] ?? '') === '1';

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
                    $line = preg_replace('/^\d+\.\s*/u', '', $line);
                    $parts = explode(' | ', $line, 2);
                    $steps[] = count($parts) === 2
                        ? ['title' => $parts[0], 'text' => $parts[1]]
                        : ['title' => '', 'text' => $line];
                }
            }
            $statement = $pdo->prepare('SELECT r.id, r.title, r.image_url, r.prep_time_minutes, c.name AS category_name FROM recipes r JOIN categories c ON c.id = r.category_id WHERE r.id <> :id ORDER BY (r.category_id = :category) DESC, r.created_at DESC, r.id DESC LIMIT 3');
            $statement->execute(['id' => $id, 'category' => $recipe['category_id']]);
            $related = $statement->fetchAll();
            // Optional during the brief period between copying the app and importing 04.
            try {
                $detailsStatement = $pdo->prepare('SELECT ingredient_notes, tips, time_note FROM recipe_details WHERE recipe_id = :id');
                $detailsStatement->execute(['id' => $id]);
                $details = $detailsStatement->fetch();
                if ($details !== false) {
                    $decodedNotes = json_decode($details['ingredient_notes'], true);
                    $ingredientNotes = is_array($decodedNotes) ? $decodedNotes : [];
                    $tips = array_values(array_filter(array_map('trim', explode("\n", $details['tips']))));
                    $timeNote = $details['time_note'];
                }
            } catch (PDOException $e) {
                error_log('Optional recipe details unavailable: ' . $e->getMessage());
            }
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
    <link rel="preload" as="image" href="assets/backgrounds/kitchen.jpg">
    <link rel="stylesheet" href="style.css?v=9">
    <script src="app.js?v=9" defer></script>
</head>
<body<?= $printView && $recipe !== false ? ' class="print-view"' : '' ?>>
<a class="skip-link" href="#main">Đến nội dung chính</a>
<div class="kitchen-background" aria-hidden="true"></div>
<div class="site-shell">
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
        <?php if ($printView): ?>
            <aside class="print-toolbar" aria-label="Điều khiển bản in">
                <div><strong>Bản in công thức</strong><p>Bấm Tải PDF để lưu file trực tiếp. Muốn in ra giấy, bấm Mở hộp thoại in hoặc nhấn Ctrl + P.</p></div>
                <div class="print-controls"><a class="button" href="download.php?id=<?= (int) $recipe['id'] ?>">Tải PDF</a><button class="button print-button" type="button" data-print-trigger>Mở hộp thoại in</button><a href="recipe.php?id=<?= (int) $recipe['id'] ?>">Quay lại công thức</a></div>
            </aside>
            <noscript><p>Nút Tải PDF vẫn hoạt động. Nhấn Ctrl + P nếu muốn in ra giấy.</p></noscript>
        <?php endif; ?>
        <section class="recipe-intro">
            <div class="detail-image-wrap"><?php if ($image !== null): ?><img src="<?= h($image) ?>" alt="<?= h($recipe['title']) ?>" width="1536" height="1024" fetchpriority="high"><?php else: ?><span class="image-placeholder"><?= icon('bowl') ?></span><?php endif; ?></div>
            <div class="recipe-intro-copy">
                <a class="detail-category" href="index.php?category=<?= (int) $recipe['category_id'] ?>#recipes"><?= h($recipe['category_name']) ?></a>
                <h1><?= h($recipe['title']) ?></h1>
                <p><?= h($recipe['description'] ?? '') ?></p>
                <div class="detail-facts"><div><?= icon('clock') ?><span>Thời gian<strong><?= (int) $recipe['prep_time_minutes'] ?> phút</strong></span></div><div><?= icon('users') ?><span>Khẩu phần<strong><?= (int) $recipe['servings'] ?> người</strong></span></div></div>
                <?php if ($timeNote !== ''): ?><p class="time-note"><?= h($timeNote) ?></p><?php endif; ?>
                <div class="recipe-actions"><a class="button" href="#cooking">Bắt đầu nấu <?= icon('arrow') ?></a><a class="button print-button" id="print-recipe" href="recipe.php?id=<?= (int) $recipe['id'] ?>&amp;print=1">In công thức</a><a class="button pdf-button" id="download-recipe" href="download.php?id=<?= (int) $recipe['id'] ?>">Tải PDF</a></div>
            </div>
        </section>
        <div id="cooking" class="detail-grid">
            <section class="detail-panel ingredients-panel" aria-labelledby="ingredients-title">
                <p class="eyebrow">CHUẨN BỊ TRƯỚC KHI NẤU</p><h2 id="ingredients-title">Nguyên liệu</h2><p class="panel-note">Lượng cho <?= (int) $recipe['servings'] ?> người. Đánh dấu những nguyên liệu bạn đã chuẩn bị.</p>
                <p class="measure-note">Dùng muỗng đong gạt ngang: 1 muỗng cà phê = 5 ml, 1 muỗng canh = 15 ml. Với rau củ có ghi chú “sau sơ chế”, cân phần ăn được.</p>
                <?php if ($ingredients === []): ?><p>Chưa có thông tin nguyên liệu.</p>
                <?php else: ?>
                    <ul class="ingredient-list">
                        <?php foreach ($ingredients as $ingredient): ?>
                            <?php $quantity = quantity_label((float) $ingredient['quantity']); $note = $ingredientNotes[$ingredient['name']] ?? ''; ?>
                            <li><label><input type="checkbox"><span class="ingredient-copy"><span class="ingredient-name"><?= h($ingredient['name']) ?></span><?php if (is_string($note) && $note !== ''): ?><small><?= h($note) ?></small><?php endif; ?></span><strong><?= h($quantity) ?> <?= h($ingredient['unit']) ?></strong></label></li>
                        <?php endforeach; ?>
                    </ul>
                <?php endif; ?>
            </section>
            <section class="detail-panel" aria-labelledby="steps-title">
                <p class="eyebrow">VÀO BẾP CÙNG NHAU</p><h2 id="steps-title">Cách thực hiện</h2>
                <?php if ($steps === []): ?><p>Chưa có hướng dẫn thực hiện.</p>
                <?php else: ?><p class="panel-note">Làm lần lượt từ sơ chế đến hoàn thành. Bấm vào bước đã làm để đánh dấu.</p><ol class="step-list"><?php foreach ($steps as $step): ?><li><label class="step-check"><input type="checkbox"><span class="step-copy"><?php if ($step['title'] !== ''): ?><strong class="step-heading"><?= h($step['title']) ?></strong><?php endif; ?><span class="step-text"><?= h($step['text']) ?></span></span></label></li><?php endforeach; ?></ol><?php endif; ?>
            </section>
        </div>
        <?php if ($tips !== []): ?><section class="recipe-tips" aria-labelledby="tips-title"><p class="eyebrow">ĐỂ MÓN ĂN NGON HƠN</p><h2 id="tips-title">Mẹo nhỏ khi nấu</h2><ul><?php foreach ($tips as $tip): ?><li><?= h($tip) ?></li><?php endforeach; ?></ul><p class="time-note">Thời gian nấu là ước tính; độ dày nguyên liệu và mức nhiệt của bếp có thể làm thời gian thay đổi.</p></section><?php endif; ?>
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
<footer class="site-footer"><div class="container footer-inner"><a class="brand" href="index.php"><span class="brand-mark"><?= icon('bowl') ?></span>Bếp Nhà<span class="brand-dot">.</span></a><p>Công thức quen thuộc. Bữa cơm đong đầy. Ảnh món ăn là ảnh minh họa AI.</p><a href="index.php#recipes">Khám phá thêm món ngon →</a></div></footer>
</div>
</body>
</html>
