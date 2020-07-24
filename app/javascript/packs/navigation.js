window.addEventListener('load', () => {
  const btn = document.getElementById('menu_button');
  const menu = document.getElementById('menu');

  if (btn && menu) btn.addEventListener('click', () => {
    menu.classList.toggle('block');
    menu.classList.toggle('hidden');
  });
})