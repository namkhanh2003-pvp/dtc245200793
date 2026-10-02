<?php
declare(strict_types=1);
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/functions.php';
header('Content-Type: text/html; charset=utf-8');

$search = isset($_GET['q']) && is_string($_GET['q']) ? trim($_GET['q']) : '';
$categoryId = filter_input(INPUT_GET, 'category', FILTER_VALIDATE_INT) ?: 0;

try {
    $categories = $pdo->query('SELECT id, name FROM categories ORDER BY name')->fetchAll();
    $totalRecipes = (int) $pdo->query('SELECT COUNT(*) FROM recipes')->fetchColumn();
    $totalIngredients = (int) $pdo->query('SELECT COUNT(*) FROM ingredients')->fetchColumn();
    $sql = 'SELECT r.id, r.title, r.description, r.image_url, r.prep_time_minutes, r.servings,
                   c.name AS category_name
            FROM recipes r JOIN categories c ON c.id = r.category_id WHERE 1 = 1';
    $params = [];
    if ($search !== '') {
        $sql .= ' AND r.title LIKE :search';
        $params['search'] = '%' . $search . '%';
    }
    if ($categoryId > 0) {
        $sql .= ' AND r.category_id = :category';
        $params['category'] = $categoryId;
    }
    $sql .= ' ORDER BY r.created_at DESC, r.id DESC';
    $statement = $pdo->prepare($sql);
    $statement->execute($params);
    $recipes = $statement->fetchAll();
} catch (PDOException $e) {
    error_log('Recipe list query failed: ' . $e->getMessage());
    http_response_code(500);
    exit('Không thể tải danh sách món ăn. Vui lòng thử lại sau.');
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Cùng Bếp Nhà khám phá công thức, nguyên liệu và cách nấu những món ăn quen thuộc cho bữa cơm gia đình.">
    <title>Bếp Nhà — Mỗi ngày một bữa cơm ngon</title>
    <link rel="icon" href="assets/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="style.css?v=4">
</head>
<body>
<a class="skip-link" href="#main">Đến nội dung chính</a>
<header class="site-header">
    <div class="container header-inner">
        <a class="brand" href="index.php"><span class="brand-mark"><?= icon('bowl') ?></span>Bếp Nhà<span class="brand-dot">.</span></a>
        <nav class="main-nav" aria-label="Điều hướng chính">
            <a class="active" href="#recipes">Công thức</a>
            <a href="#categories">Danh mục</a>
        </nav>
        <a class="button button-small header-cta" href="#recipes">Cùng vào bếp <?= icon('arrow') ?></a>
    </div>
</header>
<main id="main">
    <section class="container hero">
        <div class="hero-copy">
            <p class="eyebrow"><span></span> MỘT GÓC BẾP, NGÀN YÊU THƯƠNG</p>
            <h1>Món ngon mỗi ngày.<br><em>Ấm lòng mỗi bữa.</em></h1>
            <p class="hero-description">Từ những nguyên liệu quen thuộc, cùng nấu nên bữa cơm ngon cho những người bạn yêu thương.</p>
            <a class="button hero-button" href="#recipes">Khám phá công thức <?= icon('arrow') ?></a>
            <div class="hero-stats" aria-label="Thư viện công thức">
                <div><strong><?= $totalRecipes ?></strong><span>Công thức</span></div>
                <div><strong><?= count($categories) ?></strong><span>Danh mục</span></div>
                <div><strong><?= $totalIngredients ?></strong><span>Nguyên liệu</span></div>
            </div>
        </div>
        <div class="hero-visual">
            <div class="hero-image-wrap"><img src="assets/rice.png" alt="Cơm chiên trứng cà rốt" width="1536" height="1024" fetchpriority="high"></div>
            <div class="hero-note"><span class="note-icon"><?= icon('leaf') ?></span><div><strong>Ngon từ điều giản dị</strong><span>Một bữa cơm, một chút yêu thương</span></div></div>
            <span class="hero-stamp"><span>NẤU Ở NHÀ</span><strong>ăn ngon hơn</strong></span>
        </div>
    </section>

    <section id="categories" class="container category-section">
        <div class="category-heading"><span class="eyebrow">CHỌN THEO KHẨU VỊ</span><h2>Bạn thích món gì?</h2></div>
        <div class="category-chips">
            <a class="category-chip <?= $categoryId === 0 ? 'selected' : '' ?>" href="index.php#recipes"><?= icon('bowl') ?> Tất cả món ăn</a>
            <?php foreach ($categories as $category): ?>
                <a class="category-chip <?= $categoryId === (int) $category['id'] ? 'selected' : '' ?>" href="index.php?category=<?= (int) $category['id'] ?>#recipes"><?= h($category['name']) ?></a>
            <?php endforeach; ?>
        </div>
    </section>

    <section id="recipes" class="container recipes-section" aria-labelledby="recipes-title">
        <div class="section-heading">
            <div><p class="eyebrow">CẢM HỨNG CHO BỮA CƠM NHÀ</p><h2 id="recipes-title">Hôm nay, mình nấu gì?</h2></div>
            <span class="result-count"><?= count($recipes) ?> công thức dành cho bạn</span>
        </div>
        <form class="search-form" action="index.php#recipes" method="get">
            <div class="search-field"><?= icon('search') ?><label class="sr-only" for="q">Tìm theo tên món</label><input id="q" type="search" name="q" value="<?= h($search) ?>" placeholder="Tìm món ăn bạn muốn nấu..." maxlength="200"></div>
            <div class="select-field"><label class="sr-only" for="category">Danh mục món ăn</label><select id="category" name="category">
                <option value="0">Tất cả danh mục</option>
                <?php foreach ($categories as $category): ?>
                    <option value="<?= (int) $category['id'] ?>" <?= $categoryId === (int) $category['id'] ? 'selected' : '' ?>><?= h($category['name']) ?></option>
                <?php endforeach; ?>
            </select></div>
            <button class="button" type="submit">Tìm công thức</button>
        </form>
        <?php if ($search !== '' || $categoryId > 0): ?><p class="filter-summary">Kết quả theo lựa chọn của bạn. <a href="index.php#recipes">Xóa bộ lọc</a></p><?php endif; ?>

        <?php if ($recipes === []): ?>
            <div class="empty-state"><?= icon('search') ?><h3>Chưa tìm thấy món phù hợp</h3><p>Bạn thử tên món hoặc danh mục khác nhé.</p><a class="button" href="index.php#recipes">Xem tất cả món ăn</a></div>
        <?php else: ?>
            <div class="recipe-grid">
                <?php foreach ($recipes as $recipe): ?>
                    <?php $image = recipe_image($recipe); ?>
                    <article class="recipe-card">
                        <a class="card-image-link" href="recipe.php?id=<?= (int) $recipe['id'] ?>" tabindex="-1" aria-hidden="true">
                            <?php if ($image !== null): ?><img class="card-image" src="<?= h($image) ?>" alt="" width="1536" height="1024" loading="lazy"><?php else: ?><span class="image-placeholder"><?= icon('bowl') ?></span><?php endif; ?>
                            <span class="category-tag"><?= h($recipe['category_name']) ?></span>
                        </a>
                        <div class="card-body">
                            <h3><a href="recipe.php?id=<?= (int) $recipe['id'] ?>"><?= h($recipe['title']) ?></a></h3>
                            <p><?= h($recipe['description'] ?? '') ?></p>
                            <div class="recipe-meta"><span><?= icon('clock') ?> <?= (int) $recipe['prep_time_minutes'] ?> phút</span><span><?= icon('users') ?> <?= (int) $recipe['servings'] ?> người</span></div>
                            <a class="card-action" href="recipe.php?id=<?= (int) $recipe['id'] ?>">Xem công thức <?= icon('arrow') ?></a>
                        </div>
                    </article>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </section>

    <section class="container kitchen-banner">
        <div class="banner-mark"><?= icon('bowl') ?></div>
        <div><p class="eyebrow">NIỀM VUI TỪ CĂN BẾP NHỎ</p><h2>Không cần cầu kỳ.<br>Chỉ cần nấu bằng cả trái tim.</h2><p>Một công thức dễ làm, một bữa ăn đầy yêu thương.</p></div>
        <a class="button button-light" href="index.php#recipes">Chọn món để nấu <?= icon('arrow') ?></a>
    </section>
</main>
<footer class="site-footer">
    <div class="container footer-inner"><a class="brand" href="index.php"><span class="brand-mark"><?= icon('bowl') ?></span>Bếp Nhà<span class="brand-dot">.</span></a><p>Công thức quen thuộc. Bữa cơm đong đầy.</p><a href="#main">Về đầu trang ↑</a></div>
</footer>
</body>
</html>
