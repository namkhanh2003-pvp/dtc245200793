<?php
declare(strict_types=1);
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/functions.php';
header('Content-Type: text/html; charset=utf-8');

$search = isset($_GET['q']) && is_string($_GET['q']) ? trim($_GET['q']) : '';
$timeOptions = [
    '0' => ['Mọi thời gian', 0, 0],
    '15' => ['1–15 phút', 1, 15],
    '30' => ['16–30 phút', 16, 30],
    '45' => ['31–45 phút', 31, 45],
    '60' => ['46–60 phút', 46, 60],
    '90' => ['61–90 phút', 61, 90],
    'long' => ['Trên 90 phút', 91, 0],
    'exact-15' => ['Đúng 15 phút', 15, 15],
    'exact-30' => ['Đúng 30 phút', 30, 30],
    'exact-45' => ['Đúng 45 phút', 45, 45],
    'exact-60' => ['Đúng 60 phút', 60, 60],
    'exact-90' => ['Đúng 90 phút', 90, 90],
];
$timeFilter = isset($_GET['time']) && is_string($_GET['time']) ? $_GET['time'] : '0';
$timeFilter = array_key_exists($timeFilter, $timeOptions) ? $timeFilter : '0';
[$timeLabel, $minMinutes, $maxMinutes] = $timeOptions[$timeFilter];
$sort = isset($_GET['sort']) && is_string($_GET['sort']) ? $_GET['sort'] : 'newest';
$sort = in_array($sort, ['newest', 'quick', 'name'], true) ? $sort : 'newest';
$page = max(1, (int) (filter_input(INPUT_GET, 'page', FILTER_VALIDATE_INT) ?: 1));
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
    if ($minMinutes > 0) {
        $sql .= ' AND r.prep_time_minutes >= :min_time';
        $params['min_time'] = $minMinutes;
    }
    if ($maxMinutes > 0) {
        $sql .= ' AND r.prep_time_minutes <= :max_time';
        $params['max_time'] = $maxMinutes;
    }
    $sql .= match ($sort) {
        'quick' => ' ORDER BY r.prep_time_minutes, r.id',
        'name' => ' ORDER BY r.title, r.id',
        default => ' ORDER BY r.created_at DESC, r.id DESC',
    };
    $statement = $pdo->prepare($sql);
    $statement->execute($params);
    $allRecipes = $statement->fetchAll();
    $resultCount = count($allRecipes);
    $pages = max(1, (int) ceil($resultCount / 12));
    $page = min($page, $pages);
    $recipes = array_slice($allRecipes, ($page - 1) * 12, 12);
    $suggestions = $pdo->query('SELECT id, title FROM recipes ORDER BY id')->fetchAll();
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
    <link rel="preload" as="image" href="assets/backgrounds/kitchen.jpg">
    <link rel="stylesheet" href="style.css?v=9">
    <script src="app.js?v=9" defer></script>
</head>
<body>
<a class="skip-link" href="#main">Đến nội dung chính</a>
<div class="kitchen-background" aria-hidden="true"></div>
<div class="site-shell">
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
    <div class="season-strip"><span>✦ Mỗi ngày một hương vị mới</span><span>Gợi ý dễ nấu · Nguyên liệu gần gũi</span></div>
    <section class="container hero">
        <div class="hero-copy">
            <p class="eyebrow"><span></span> MỘT GÓC BẾP, NGÀN YÊU THƯƠNG</p>
            <h1>Món ngon mỗi ngày.<br><em>Ấm lòng mỗi bữa.</em></h1>
            <p class="hero-description">Từ bữa sáng nhanh gọn đến mâm cơm sum vầy. Khám phá những hương vị mới và tìm món ngon hợp với ngày của bạn.</p>
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

    <section class="container inspiration" aria-label="Gợi ý hôm nay">
        <div><p class="eyebrow">MỘT CHÚT BẤT NGỜ CHO CĂN BẾP</p><h2>Hôm nay ăn gì?</h2><p>Để Bếp Nhà chọn giúp bạn một món trong kho công thức.</p></div>
        <div class="surprise-box"><button class="button" type="button" id="surprise">Chọn món ngẫu nhiên ✦</button><p id="surprise-result" aria-live="polite"></p></div>
        <div id="suggestions" hidden><?php foreach ($suggestions as $suggestion): ?><a href="recipe.php?id=<?= (int) $suggestion['id'] ?>"><?= h($suggestion['title']) ?></a><?php endforeach; ?></div>
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
            <span class="result-count"><?= $resultCount ?> công thức dành cho bạn</span>
        </div>
        <form class="search-form" action="index.php#recipes" method="get">
            <div class="search-field"><?= icon('search') ?><label class="sr-only" for="q">Tìm theo tên món</label><input id="q" type="search" name="q" value="<?= h($search) ?>" placeholder="Tìm món ăn bạn muốn nấu..." maxlength="200"></div>
            <div class="select-field"><label class="sr-only" for="category">Danh mục món ăn</label><select id="category" name="category">
                <option value="0">Tất cả danh mục</option>
                <?php foreach ($categories as $category): ?>
                    <option value="<?= (int) $category['id'] ?>" <?= $categoryId === (int) $category['id'] ? 'selected' : '' ?>><?= h($category['name']) ?></option>
                <?php endforeach; ?>
            </select></div>
            <div class="select-field"><label class="sr-only" for="time">Thời gian nấu</label><select id="time" name="time"><?php foreach ($timeOptions as $value => $option): ?><option value="<?= h((string) $value) ?>" <?= $timeFilter === (string) $value ? 'selected' : '' ?>><?= h($option[0]) ?></option><?php endforeach; ?></select></div>
            <div class="select-field"><label class="sr-only" for="sort">Sắp xếp</label><select id="sort" name="sort"><?php foreach (['newest'=>'Mới nhất', 'quick'=>'Nhanh nhất', 'name'=>'Tên món A–Z'] as $value=>$label): ?><option value="<?= $value ?>" <?= $sort === $value ? 'selected' : '' ?>><?= $label ?></option><?php endforeach; ?></select></div>
            <button class="button" type="submit">Tìm công thức</button>
        </form>
        <?php if ($search !== '' || $categoryId > 0 || $timeFilter !== '0'): ?><p class="filter-summary">Kết quả theo lựa chọn của bạn<?= $timeFilter !== '0' ? ' · ' . h($timeLabel) : '' ?>. <a href="index.php#recipes">Xóa bộ lọc</a></p><?php endif; ?>

        <?php if ($recipes === []): ?>
            <div class="empty-state"><?= icon('search') ?><h3>Chưa tìm thấy món phù hợp</h3><p>Bạn thử tên món hoặc danh mục khác nhé.</p><a class="button" href="index.php#recipes">Xem tất cả món ăn</a></div>
        <?php else: ?>
            <div class="recipe-grid">
                <?php foreach ($recipes as $recipe): ?>
                    <?php $image = recipe_image($recipe); ?>
                    <article class="recipe-card reveal">
                        <a class="card-image-link" href="recipe.php?id=<?= (int) $recipe['id'] ?>" tabindex="-1" aria-hidden="true">
                            <?php if ($image !== null): ?><img class="card-image" src="<?= h($image) ?>" alt="" width="1536" height="1024" loading="lazy"><?php else: ?><span class="image-placeholder"><?= icon('bowl') ?></span><?php endif; ?>
                            <span class="category-tag"><?= h($recipe['category_name']) ?></span>
                        </a>
                        <div class="card-body"><span class="time-badge"><?= (int) $recipe['prep_time_minutes'] <= 20 ? '⚡ Nhanh gọn' : '✦ Thử món mới' ?></span>
                            <h3><a href="recipe.php?id=<?= (int) $recipe['id'] ?>"><?= h($recipe['title']) ?></a></h3>
                            <p><?= h($recipe['description'] ?? '') ?></p>
                            <div class="recipe-meta"><span><?= icon('clock') ?> <?= (int) $recipe['prep_time_minutes'] ?> phút</span><span><?= icon('users') ?> <?= (int) $recipe['servings'] ?> người</span></div>
                            <a class="card-action" href="recipe.php?id=<?= (int) $recipe['id'] ?>">Xem công thức <?= icon('arrow') ?></a>
                        </div>
                    </article>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
        <?php if ($pages > 1): ?><nav class="pagination" aria-label="Trang công thức"><?php for ($i = 1; $i <= $pages; $i++): ?><a <?= $page === $i ? 'aria-current="page"' : '' ?> href="index.php?<?= h(http_build_query(['q'=>$search,'category'=>$categoryId,'time'=>$timeFilter,'sort'=>$sort,'page'=>$i])) ?>#recipes"><?= $i ?></a><?php endfor; ?></nav><?php endif; ?>
    </section>

    <section class="container kitchen-banner">
        <div class="banner-mark"><?= icon('bowl') ?></div>
        <div><p class="eyebrow">NIỀM VUI TỪ CĂN BẾP NHỎ</p><h2>Không cần cầu kỳ.<br>Chỉ cần nấu bằng cả trái tim.</h2><p>Một công thức dễ làm, một bữa ăn đầy yêu thương.</p></div>
        <a class="button button-light" href="index.php#recipes">Chọn món để nấu <?= icon('arrow') ?></a>
    </section>
</main>
<footer class="site-footer">
    <div class="container footer-inner"><a class="brand" href="index.php"><span class="brand-mark"><?= icon('bowl') ?></span>Bếp Nhà<span class="brand-dot">.</span></a><p>Công thức quen thuộc. Bữa cơm đong đầy. Ảnh món ăn là ảnh minh họa AI.</p><a href="#main">Về đầu trang ↑</a></div>
</footer>
</div>
</body>
</html>
