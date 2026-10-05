<?php
declare(strict_types=1);

function h(string $value): string
{
    return htmlspecialchars($value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

function quantity_label(float $quantity): string
{
    if (abs($quantity - 0.125) < 0.0001) return '1/8';
    if (abs($quantity - 0.25) < 0.0001) return '1/4';
    if (abs($quantity - 0.5) < 0.0001) return '1/2';
    return str_replace('.', ',', rtrim(rtrim(number_format($quantity, 3, '.', ''), '0'), '.'));
}

function recipe_image(array $recipe): ?string
{
    // Photo assets for the expanded collection. Keep custom DB paths as fallback.
    static $photos = [
        'Thịt kho trứng' => 'assets/photos/recipe-01.jpg',
        'Gà kho gừng' => 'assets/photos/recipe-02.jpg',
        'Cá basa kho tiêu' => 'assets/photos/recipe-03.jpg',
        'Tôm rim mặn ngọt' => 'assets/photos/recipe-04.jpg',
        'Bò xào hành tây' => 'assets/photos/recipe-05.jpg',
        'Sườn xào chua ngọt' => 'assets/photos/recipe-06.jpg',
        'Canh bí đỏ thịt băm' => 'assets/photos/recipe-07.jpg',
        'Canh chua cá' => 'assets/photos/recipe-08.jpg',
        'Canh cải đậu hũ' => 'assets/photos/recipe-09.jpg',
        'Canh nấm rau củ' => 'assets/photos/recipe-10.jpg',
        'Rau muống xào tỏi' => 'assets/photos/recipe-11.jpg',
        'Salad dưa chuột cà chua' => 'assets/photos/recipe-12.jpg',
        'Bông cải xào nấm' => 'assets/photos/recipe-13.jpg',
        'Đậu hũ sốt cà chua' => 'assets/photos/recipe-14.jpg',
        'Nấm kho tiêu' => 'assets/photos/recipe-15.jpg',
        'Cà tím áp chảo sốt tương' => 'assets/photos/recipe-16.jpg',
        'Cơm chiên rau củ' => 'assets/photos/recipe-17.jpg',
        'Cơm gà áp chảo' => 'assets/photos/recipe-18.jpg',
        'Cháo gà cà rốt' => 'assets/photos/recipe-19.jpg',
        'Bánh mì trứng' => 'assets/photos/recipe-20.jpg',
        'Bún xào rau củ' => 'assets/photos/recipe-21.jpg',
        'Mì xào bò' => 'assets/photos/recipe-22.jpg',
        'Chè đậu xanh' => 'assets/photos/recipe-23.jpg',
        'Sữa chua trái cây' => 'assets/photos/recipe-24.jpg',
        'Chuối áp chảo mật ong' => 'assets/photos/recipe-25.jpg',
        'Sinh tố xoài' => 'assets/photos/recipe-26.jpg',
        'Trà chanh mật ong' => 'assets/photos/recipe-27.jpg',
        'Gà xào sả ớt' => 'assets/photos/recipe-28.jpg',
        'Cá hồi áp chảo sốt chanh' => 'assets/photos/recipe-29.jpg',
        'Canh khoai tây cà rốt' => 'assets/photos/recipe-30.jpg',
        'Canh mướp nấu tôm' => 'assets/photos/recipe-31.jpg',
        'Đậu hũ kho nấm' => 'assets/photos/recipe-32.jpg',
        'Gỏi cuốn tôm' => 'assets/photos/recipe-33.jpg',
        'Bún thịt xào' => 'assets/photos/recipe-34.jpg',
        'Nui xào trứng' => 'assets/photos/recipe-35.jpg',
        'Bánh pancake chuối' => 'assets/photos/recipe-36.jpg',
        'Chè bắp' => 'assets/photos/recipe-37.jpg',
        'Thịt chó nấu rựa mận' => 'assets/photos/recipe-38.jpg',
        'Thịt chó xào sả ớt' => 'assets/photos/recipe-39.jpg',
        'Bún đậu mắm tôm' => 'assets/photos/recipe-40.jpg',
        'Thịt heo luộc chấm mắm tôm' => 'assets/photos/recipe-41.jpg',
        'Chân giò giả cầy' => 'assets/photos/recipe-42.jpg',
        'Bò kho' => 'assets/photos/recipe-43.jpg',
        'Gà hầm nấm' => 'assets/photos/recipe-44.jpg',
        'Vịt om sấu' => 'assets/photos/recipe-45.jpg',
        'Cá kho tộ' => 'assets/photos/recipe-46.jpg',
        'Cánh gà chiên nước mắm' => 'assets/photos/recipe-47.jpg',
        'Chả lá lốt' => 'assets/photos/recipe-48.jpg',
        'Bún riêu cua' => 'assets/photos/recipe-49.jpg',
        'Phở gà' => 'assets/photos/recipe-50.jpg',
        'Bún bò Huế' => 'assets/photos/recipe-51.jpg',
        'Canh sườn hầm củ sen' => 'assets/photos/recipe-52.jpg',
        'Cơm tấm sườn áp chảo' => 'assets/photos/recipe-53.jpg',
        'Nem rán' => 'assets/photos/recipe-54.jpg',
        'Gỏi gà bắp cải' => 'assets/photos/recipe-55.jpg',
        'Chè khoai dẻo' => 'assets/photos/recipe-56.jpg',
        'Cà phê sữa đá' => 'assets/photos/recipe-57.jpg',
        'Thịt ba chỉ rang cháy cạnh' => 'assets/photos/recipe-58.jpg',
        'Thịt heo xào chua ngọt' => 'assets/photos/recipe-59.jpg',
        'Bò lúc lắc' => 'assets/photos/recipe-60.jpg',
        'Bò cuốn lá lốt' => 'assets/photos/recipe-61.jpg',
        'Gà hấp hành' => 'assets/photos/recipe-62.jpg',
        'Gà sốt cam' => 'assets/photos/recipe-63.jpg',
        'Vịt kho gừng' => 'assets/photos/recipe-64.jpg',
        'Tôm chiên tỏi' => 'assets/photos/recipe-65.jpg',
        'Tôm sốt bơ chanh' => 'assets/photos/recipe-66.jpg',
        'Mực xào cần tỏi' => 'assets/photos/recipe-67.jpg',
        'Mực nhồi thịt sốt cà chua' => 'assets/photos/recipe-68.jpg',
        'Nghêu hấp sả' => 'assets/photos/recipe-69.jpg',
        'Cá diêu hồng hấp gừng' => 'assets/photos/recipe-70.jpg',
        'Cá thu sốt cà chua' => 'assets/photos/recipe-71.jpg',
        'Canh khổ qua nhồi thịt' => 'assets/photos/recipe-72.jpg',
        'Canh cải thảo viên thịt' => 'assets/photos/recipe-73.jpg',
        'Canh rong biển đậu hũ' => 'assets/photos/recipe-74.jpg',
        'Canh chua tôm' => 'assets/photos/recipe-75.jpg',
        'Canh bầu nấu tôm' => 'assets/photos/recipe-76.jpg',
        'Súp bí đỏ' => 'assets/photos/recipe-77.jpg',
        'Cải thìa xào nấm' => 'assets/photos/recipe-78.jpg',
        'Su su xào trứng' => 'assets/photos/recipe-79.jpg',
        'Đậu que xào tỏi' => 'assets/photos/recipe-80.jpg',
        'Salad khoai tây' => 'assets/photos/recipe-81.jpg',
        'Đậu hũ chiên sả' => 'assets/photos/recipe-82.jpg',
        'Đậu hũ hấp nấm' => 'assets/photos/recipe-83.jpg',
        'Cà ri rau củ' => 'assets/photos/recipe-84.jpg',
        'Miến xào nấm' => 'assets/photos/recipe-85.jpg',
        'Xôi gấc' => 'assets/photos/recipe-86.jpg',
        'Cơm cuộn rong biển' => 'assets/photos/recipe-87.jpg',
        'Cháo sườn' => 'assets/photos/recipe-88.jpg',
        'Bún chả' => 'assets/photos/recipe-89.jpg',
        'Bánh cuốn chảo' => 'assets/photos/recipe-90.jpg',
        'Bánh xèo' => 'assets/photos/recipe-91.jpg',
        'Bánh mì xíu mại' => 'assets/photos/recipe-92.jpg',
        'Chè chuối' => 'assets/photos/recipe-93.jpg',
        'Chè đậu đỏ' => 'assets/photos/recipe-94.jpg',
        'Bánh flan hấp' => 'assets/photos/recipe-95.jpg',
        'Sữa bắp' => 'assets/photos/recipe-96.jpg',
        'Nước ép dứa gừng' => 'assets/photos/recipe-97.jpg',
    ];
    $photo = $photos[$recipe['title'] ?? ''] ?? null;
    if ($photo !== null && is_file(__DIR__ . '/' . $photo)) {
        return $photo;
    }

    $path = $recipe['image_url'] ?? '';
    if (is_string($path) && preg_match('#^assets/[a-zA-Z0-9_./-]+$#', $path) && !str_contains($path, '..')) {
        return $path;
    }
    return match ($recipe['title'] ?? '') {
        'Trứng chiên hành lá' => 'assets/egg.png',
        'Canh rau ngót thịt băm' => 'assets/soup.png',
        'Cơm chiên trứng cà rốt' => 'assets/rice.png',
        default => null,
    };
}

function icon(string $name): string
{
    $paths = [
        'bowl' => '<path d="M3 12h18a9 9 0 0 1-18 0Z"/><path d="M7 8c-2-2 2-3 0-5M12 8c-2-2 2-3 0-5M17 8c-2-2 2-3 0-5M8 21h8"/>',
        'search' => '<circle cx="10.5" cy="10.5" r="6.5"/><path d="m16 16 5 5"/>',
        'clock' => '<circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/>',
        'users' => '<circle cx="9" cy="8" r="3"/><path d="M3 21v-3a6 6 0 0 1 12 0v3M16 5a3 3 0 0 1 0 6M21 21v-3a6 6 0 0 0-4-5"/>',
        'arrow' => '<path d="M5 12h14m-6-6 6 6-6 6"/>',
        'leaf' => '<path d="M20 3C10 2 3 6 4 13a6 6 0 0 0 9 5c5-3 6-8 7-15Z"/><path d="M3 21 15 9"/>',
    ];
    return '<svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
        . ($paths[$name] ?? $paths['bowl']) . '</svg>';
}
