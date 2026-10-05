'use strict';
const surprise = document.getElementById('surprise');
surprise?.addEventListener('click', () => {
    const recipes = [...document.querySelectorAll('#suggestions a')];
    const output = document.getElementById('surprise-result');
    if (!recipes.length) { output.textContent = 'Chưa có món để gợi ý.'; return; }
    const chosen = recipes[Math.floor(Math.random() * recipes.length)];
    output.replaceChildren(document.createTextNode('Thử nấu: '), chosen.cloneNode(true));
});
// The main print link opens server-rendered content even when JavaScript is blocked.
const printNow = () => window.print();
document.querySelectorAll('[data-print-trigger]').forEach(button => {
    button.addEventListener('click', printNow);
});
if ('IntersectionObserver' in window && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => { if (entry.isIntersecting) { entry.target.classList.add('visible'); observer.unobserve(entry.target); } });
    }, { threshold: 0.08 });
    document.querySelectorAll('.reveal').forEach(card => observer.observe(card));
}
