<?php
declare(strict_types=1);

function h(string $value): string
{
    return htmlspecialchars($value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

function recipe_image(array $recipe): ?string
{
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
