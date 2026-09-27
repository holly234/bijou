/**
 * BIJOU RESTAURANT & LOUNGE - MENU CATEGORY NAVIGATION LOGIC
 */

document.addEventListener('DOMContentLoaded', () => {
  const catButtons = document.querySelectorAll('.cat-tab-btn');
  const menuGroups = document.querySelectorAll('.menu-group');

  // Haptic Feedback
  const triggerHaptic = (ms = 12) => {
    if ('vibrate' in navigator) {
      try { navigator.vibrate(ms); } catch (e) {}
    }
  };

  // Category Filtering Function
  const applyCategoryFilter = (targetCat, shouldScroll = false) => {
    if (targetCat === 'all') {
      menuGroups.forEach(grp => {
        grp.style.display = 'block';
        const items = grp.querySelectorAll('.menu-item-row');
        items.forEach(item => item.style.display = 'block');
      });
      if (shouldScroll) {
        window.scrollTo({ top: 90, behavior: 'smooth' });
      }
    } else {
      menuGroups.forEach(grp => {
        if (grp.getAttribute('data-group') === targetCat) {
          grp.style.display = 'block';
          const items = grp.querySelectorAll('.menu-item-row');
          items.forEach(item => item.style.display = 'block');
          if (shouldScroll) {
            grp.scrollIntoView({ behavior: 'smooth', block: 'start' });
          }
        } else {
          grp.style.display = 'none';
        }
      });
    }
  };

  // Initialize initial category state based on .active tab in HTML
  const initialActiveBtn = document.querySelector('.cat-tab-btn.active');
  if (initialActiveBtn) {
    applyCategoryFilter(initialActiveBtn.getAttribute('data-category'), false);
  }

  // Category Tab Click Event
  catButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      triggerHaptic(12);
      catButtons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      const targetCat = btn.getAttribute('data-category');
      applyCategoryFilter(targetCat, true);
    });
  });
});
