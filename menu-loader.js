/**
 * BIJOU – Dynamic Menu Loader
 * Fetches items from Supabase and renders the menu + category tabs.
 * Used by both restaurant.html and lounge.html.
 *
 * Expects on the page:
 *   - #categoryTabsTrack  (tab buttons container)
 *   - #menuFeed           (main content container)
 *   - data-section attr on <body> → "restaurant" or "lounge"
 */

(function () {
  const SUPABASE_URL  = 'https://mwcegvrxwvtpdlyorhpr.supabase.co';
  const SUPABASE_ANON = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13Y2VndnJ4d3Z0cGRseW9yaHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTA0NzU3MDgsImV4cCI6MjEwNjA1MTcwOH0.zRg_eEGHPVXXke13TYNYb6NmpoZc7LgYpzZM1z24HF8';

  const section    = document.body.dataset.section;   // "restaurant" | "lounge"
  const allLabel   = section === 'restaurant' ? 'All Dishes' : 'All Drinks';
  const tabTrack   = document.getElementById('categoryTabsTrack');
  const feed       = document.getElementById('menuFeed');

  // ── Helpers ──────────────────────────────────────────────────────
  function esc(str) {
    return String(str ?? '')
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  function formatPrice(n) {
    if (n == null) return '';
    return '₦' + Number(n).toLocaleString('en-NG', { minimumFractionDigits: 0 });
  }

  function showError(msg) {
    feed.innerHTML = `
      <div class="menu-load-error">
        <p>⚠️ ${esc(msg)}</p>
        <p>Please try refreshing the page.</p>
      </div>`;
  }

  // ── Category tab filtering ─────────────────────────────────────
  function initTabs() {
    const buttons = tabTrack.querySelectorAll('.cat-tab-btn');
    const groups  = feed.querySelectorAll('.menu-group');

    const haptic = () => {
      if ('vibrate' in navigator) { try { navigator.vibrate(12); } catch (e) {} }
    };

    const applyFilter = (cat) => {
      groups.forEach(g => {
        g.style.display = (cat === 'all' || g.dataset.group === cat) ? 'block' : 'none';
      });
    };

    // Apply initial filter based on which button is .active
    const initial = tabTrack.querySelector('.cat-tab-btn.active');
    if (initial) applyFilter(initial.dataset.category);

    buttons.forEach(btn => {
      btn.addEventListener('click', () => {
        haptic();
        buttons.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        applyFilter(btn.dataset.category);
        if (btn.dataset.category !== 'all') {
          feed.querySelector(`[data-group="${btn.dataset.category}"]`)
            ?.scrollIntoView({ behavior: 'smooth', block: 'start' });
        } else {
          window.scrollTo({ top: 90, behavior: 'smooth' });
        }
      });
    });
  }

  // ── Render ────────────────────────────────────────────────────
  function render(items) {
    // Group by category preserving insertion order
    const groups = {};
    items.forEach(item => {
      const cat = item.category || 'Other';
      if (!groups[cat]) groups[cat] = [];
      groups[cat].push(item);
    });

    const cats = Object.keys(groups);

    // Build tab buttons
    tabTrack.innerHTML =
      `<button type="button" class="cat-tab-btn active" data-category="all">${esc(allLabel)}</button>` +
      cats.map(c =>
        `<button type="button" class="cat-tab-btn" data-category="${esc(c)}">${esc(c)}</button>`
      ).join('');

    // Build menu sections
    feed.innerHTML = cats.map(cat => {
      const rows = groups[cat].map(item => `
        <div class="menu-item-row">
          <div class="item-header-line">
            <span class="item-name">${esc(item.name)}</span>
            <div class="item-dots-spacer"></div>
            <div class="item-price">${esc(formatPrice(item.price))}</div>
          </div>
          ${item.notes ? `<p class="item-desc">${esc(item.notes)}</p>` : ''}
        </div>`).join('');

      return `
        <section class="menu-group" data-group="${esc(cat)}">
          <div class="menu-group-header">
            <h2 class="menu-group-title">${esc(cat)}</h2>
            <span class="menu-group-count">${groups[cat].length} Item${groups[cat].length !== 1 ? 's' : ''}</span>
          </div>
          ${rows}
        </section>`;
    }).join('');

    initTabs();
  }

  // ── Fetch from Supabase ───────────────────────────────────────
  async function loadMenu() {
    try {
      const { createClient } = window.supabase;
      const db = createClient(SUPABASE_URL, SUPABASE_ANON);

      const { data, error } = await db
        .from('inventory')
        .select('name, category, price, notes, sort_order')
        .eq('section', section)
        .eq('available', true)
        .order('sort_order', { ascending: true })
        .order('name',       { ascending: true });

      if (error) throw error;
      if (!data || data.length === 0) {
        feed.innerHTML = `<div class="menu-load-error"><p>No items found yet.</p></div>`;
        return;
      }

      render(data);
    } catch (err) {
      console.error('[Bijou Menu]', err);
      showError('Could not load menu. Please check your connection.');
    }
  }

  // ── Boot ──────────────────────────────────────────────────────
  document.addEventListener('DOMContentLoaded', loadMenu);
})();
