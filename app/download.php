<?php
declare(strict_types=1);
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/functions.php';

// A real attachment, generated from the current database. No JavaScript or server file writes.
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1]]);
if ($id === false || $id === null) {
    http_response_code(404);
    header('Content-Type: text/plain; charset=utf-8');
    exit('Không tìm thấy công thức.');
}
try {
    $query = $pdo->prepare('SELECT r.*, c.name AS category_name FROM recipes r JOIN categories c ON c.id = r.category_id WHERE r.id = :id');
    $query->execute(['id' => $id]);
    $recipe = $query->fetch();
    if ($recipe === false) {
        http_response_code(404);
        header('Content-Type: text/plain; charset=utf-8');
        exit('Không tìm thấy công thức.');
    }
    $query = $pdo->prepare('SELECT i.name, ri.quantity, ri.unit FROM recipe_ingredients ri JOIN ingredients i ON i.id = ri.ingredient_id WHERE ri.recipe_id = :id ORDER BY i.name');
    $query->execute(['id' => $id]);
    $ingredients = $query->fetchAll();
    $notes = [];
    $tips = [];
    $timeNote = '';
    try {
        $query = $pdo->prepare('SELECT ingredient_notes, tips, time_note FROM recipe_details WHERE recipe_id = :id');
        $query->execute(['id' => $id]);
        if ($detail = $query->fetch()) {
            $decoded = json_decode($detail['ingredient_notes'], true);
            $notes = is_array($decoded) ? $decoded : [];
            $tips = array_values(array_filter(array_map('trim', explode("\n", $detail['tips']))));
            $timeNote = $detail['time_note'];
        }
    } catch (PDOException $e) {
        error_log('Optional PDF recipe details unavailable: ' . $e->getMessage());
    }

    // Supports the project's existing PHP image even when mbstring is not installed.
    require_once __DIR__ . '/lib/polyfill-mbstring/Mbstring.php';
    require_once __DIR__ . '/lib/polyfill-mbstring/bootstrap.php';
    require_once __DIR__ . '/lib/tfpdf/font/unifont/ttfonts.php';
    require_once __DIR__ . '/lib/tfpdf/tfpdf.php';
    define('_SYSTEM_TTFONTS', __DIR__ . '/assets/fonts/');

    class RecipePDF extends tFPDF
    {
        public function Header()
        {
            $this->SetFont('Noto', '', 11);
            $this->SetTextColor(35, 85, 60);
            $this->Cell(0, 6, 'BẾP NHÀ  /  CÔNG THỨC NẤU ĂN');
            $this->Ln(8);
            $this->SetDrawColor(204, 219, 207);
            $this->Line(16, $this->GetY(), 194, $this->GetY());
            $this->Ln(5);
        }
        public function Footer()
        {
            $this->SetY(-13);
            $this->SetFont('Noto', '', 8);
            $this->SetTextColor(100, 110, 103);
            $this->Cell(0, 5, 'Bếp Nhà - Trang ' . $this->PageNo(), 0, 0, 'R');
        }
        public function section(string $title): void
        {
            if ($this->GetY() > 247) $this->AddPage();
            $this->Ln(3);
            $this->SetFont('Noto', '', 14);
            $this->SetTextColor(35, 85, 60);
            $this->MultiCell(0, 7, $title);
            $this->Ln(1);
        }
        public function paragraph(string $text, float $size = 10): void
        {
            $this->SetFont('Noto', '', $size);
            $this->SetTextColor(42, 48, 44);
            $this->MultiCell(0, 5.3, $text);
            $this->Ln(1.5);
        }
    }

    $pdf = new RecipePDF('P', 'mm', 'A4');
    $pdf->SetMargins(16, 12, 16);
    $pdf->SetAutoPageBreak(true, 19);
    $pdf->AddFont('Noto', '', 'noto-serif-regular.ttf', true);
    $pdf->SetTitle($recipe['title'] . ' - Bếp Nhà', true);
    $pdf->SetAuthor('Bếp Nhà', true);
    $pdf->AddPage();
    $pdf->SetFont('Noto', '', 22);
    $pdf->SetTextColor(30, 65, 46);
    $pdf->MultiCell(0, 10, $recipe['title']);
    $pdf->Ln(3);
    $pdf->paragraph($recipe['category_name'] . '  |  ' . (int) $recipe['prep_time_minutes'] . ' phút  |  ' . (int) $recipe['servings'] . ' người');
    $pdf->paragraph((string) ($recipe['description'] ?? ''));
    if ($timeNote !== '') $pdf->paragraph($timeNote, 9);

    $pdf->section('Nguyên liệu');
    $pdf->paragraph('Lượng cho ' . (int) $recipe['servings'] . ' người. Muỗng đong gạt ngang: 1 muỗng cà phê = 5 ml; 1 muỗng canh = 15 ml.', 9);
    foreach ($ingredients as $ingredient) {
        if ($pdf->GetY() > 253) $pdf->AddPage();
        $line = '- ' . $ingredient['name'] . ': ' . quantity_label((float) $ingredient['quantity']) . ' ' . $ingredient['unit'];
        $note = $notes[$ingredient['name']] ?? '';
        if (is_string($note) && $note !== '') $line .= '. ' . $note;
        $pdf->paragraph($line, 9.5);
    }
    if ($ingredients === []) $pdf->paragraph('Chưa có thông tin nguyên liệu.');

    $pdf->section('Cách thực hiện');
    $stepNumber = 0;
    foreach (preg_split('/\r\n|\r|\n/', $recipe['instructions']) as $line) {
        $line = trim($line);
        if ($line === '') continue;
        $stepNumber++;
        $line = preg_replace('/^\d+\.\s*/u', '', $line);
        $parts = explode(' | ', $line, 2);
        if ($pdf->GetY() > 245) $pdf->AddPage();
        $heading = 'Bước ' . $stepNumber . (count($parts) === 2 ? ': ' . $parts[0] : '');
        $pdf->SetFont('Noto', '', 11);
        $pdf->SetTextColor(35, 85, 60);
        $pdf->MultiCell(0, 6.5, $heading);
        $pdf->paragraph(count($parts) === 2 ? $parts[1] : $line);
        $pdf->Ln(1);
    }
    if ($stepNumber === 0) $pdf->paragraph('Chưa có hướng dẫn thực hiện.');
    if ($tips !== []) {
        $pdf->section('Mẹo nhỏ khi nấu');
        foreach ($tips as $tip) $pdf->paragraph('- ' . $tip, 9.5);
    }
    $pdf->paragraph('Thời gian là ước tính; độ dày nguyên liệu và mức nhiệt bếp có thể làm thời gian thay đổi.', 8.5);
    $content = $pdf->Output('S');
    header('Content-Type: application/pdf');
    header('Content-Disposition: attachment; filename="cong-thuc-' . (int) $recipe['id'] . '.pdf"');
    header('Content-Length: ' . strlen($content));
    header('Cache-Control: private, no-store');
    header('X-Content-Type-Options: nosniff');
    echo $content;
} catch (Throwable $e) {
    error_log('Recipe PDF download failed: ' . $e->getMessage());
    http_response_code(500);
    header('Content-Type: text/plain; charset=utf-8');
    exit('Chưa tạo được PDF. Vui lòng kiểm tra đã chép đầy đủ thư mục app của bản cập nhật, rồi thử lại.');
}
