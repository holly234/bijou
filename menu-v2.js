/**
 * BIJOU – Card/Banner Mobile Menu (V2 Prototype)
 * Connects to Supabase, maps categories to rich food photography banners,
 * and enables smooth category navigation + live instant search.
 */

(function () {
  const SUPABASE_URL  = 'https://mwcegvrxwvtpdlyorhpr.supabase.co';
  const SUPABASE_ANON = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13Y2VndnJ4d3Z0cGRseW9yaHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTA0NzU3MDgsImV4cCI6MjEwNjA1MTcwOH0.zRg_eEGHPVXXke13TYNYb6NmpoZc7LgYpzZM1z24HF8';

  const section = document.body.dataset.section || 'restaurant';

  // DOM Elements
  const searchInput       = document.getElementById('v2SearchInput');
  const categoryListView  = document.getElementById('v2CategoryList');
  const detailView        = document.getElementById('v2DetailView');
  const searchResultsView = document.getElementById('v2SearchResults');
  const backBtn           = document.getElementById('v2BackBtn');
  const currentCatTitle   = document.getElementById('v2CurrentCatTitle');
  const detailItemsList   = document.getElementById('v2DetailItemsList');
  const searchItemsList   = document.getElementById('v2SearchItemsList');
  const searchMeta        = document.getElementById('v2SearchMeta');

  // Curated category banner photos
  const CATEGORY_IMAGES = {
    // Restaurant
    'Charcoal Grill & BBQ': 'https://images.unsplash.com/photo-1544025162-d76694265947?w=800&auto=format&fit=crop&q=80',
    'Rice & Porridge':      'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800&auto=format&fit=crop&q=80',
    'Ofada Dishes':         'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&auto=format&fit=crop&q=80',
    'Swallow Combos':       'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?w=800&auto=format&fit=crop&q=80',
    'Swallow':              'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?w=800&auto=format&fit=crop&q=80',
    'Beans':                'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=800&auto=format&fit=crop&q=80',
    'Pasta & Noodles':      'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=800&auto=format&fit=crop&q=80',
    'Pasta':                'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=800&auto=format&fit=crop&q=80',
    'Pepper Soups':         'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&auto=format&fit=crop&q=80',
    'Signature Platters':   'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800&auto=format&fit=crop&q=80',
    '1911 Special Platter': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800&auto=format&fit=crop&q=80',
    'Salads':               'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&auto=format&fit=crop&q=80',
    'Gourmet Soups':        'https://images.unsplash.com/photo-1541832676-9b763b0239ab?w=800&auto=format&fit=crop&q=80',
    'Soups & Stews':        'https://images.unsplash.com/photo-1541832676-9b763b0239ab?w=800&auto=format&fit=crop&q=80',
    'Soup Varieties':       'https://images.unsplash.com/photo-1541832676-9b763b0239ab?w=800&auto=format&fit=crop&q=80',
    'Soups by the Litre':   'https://images.unsplash.com/photo-1505253758473-96b3d5eb926f?w=800&auto=format&fit=crop&q=80',
    'Sauces & Stews':       'https://images.unsplash.com/photo-1574484284002-952d92456975?w=800&auto=format&fit=crop&q=80',
    'Sauces':               'https://images.unsplash.com/photo-1574484284002-952d92456975?w=800&auto=format&fit=crop&q=80',
    'Sauce':                'https://images.unsplash.com/photo-1574484284002-952d92456975?w=800&auto=format&fit=crop&q=80',
    'Seafood Special':      'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=800&auto=format&fit=crop&q=80',
    'Proteins':             'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=800&auto=format&fit=crop&q=80',
    'Extra Sides':          'https://images.unsplash.com/photo-1576107232684-1279f3908594?w=800&auto=format&fit=crop&q=80',
    'Extra':                'https://images.unsplash.com/photo-1576107232684-1279f3908594?w=800&auto=format&fit=crop&q=80',
    'Swallows Extra':       'https://images.unsplash.com/photo-1627308595229-7830a5c91f9f?w=800&auto=format&fit=crop&q=80',

    // Lounge
    'Soft Drinks & Yoghurt':'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=800&auto=format&fit=crop&q=80',
    'Cognac Drink':         'https://images.unsplash.com/photo-1527061011665-3652c757a4d4?w=800&auto=format&fit=crop&q=80',
    'Juice':                'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800&auto=format&fit=crop&q=80',
    'Can Drink':            'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=800&auto=format&fit=crop&q=80',
    'Beer':                 'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=800&auto=format&fit=crop&q=80',
    'Gin':                  'https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=800&auto=format&fit=crop&q=80',
    'Wine':                 'https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=800&auto=format&fit=crop&q=80',
    'Vodka':                'https://images.unsplash.com/photo-1560512823-829485b8bf24?w=800&auto=format&fit=crop&q=80',
    'Champagne':            'https://images.unsplash.com/photo-1569919659476-f0852f6834b7?w=800&auto=format&fit=crop&q=80',
    'Tequila':              'https://images.unsplash.com/photo-1549416878-b9ca35c2d47b?w=800&auto=format&fit=crop&q=80',
    'Mocktails':            'https://images.unsplash.com/photo-1536935338788-846bb9981813?w=800&auto=format&fit=crop&q=80',
    'Cocktails':            'https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=800&auto=format&fit=crop&q=80',
    'Bitters Drink':        'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=800&auto=format&fit=crop&q=80',
    'Sparkling Wine':       'https://images.unsplash.com/photo-1584225065152-4a1454aa3d4e?w=800&auto=format&fit=crop&q=80',
    'Energy Drinks':        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=800&auto=format&fit=crop&q=80',
    'Whisky Drinks':        'https://images.unsplash.com/photo-1527061011665-3652c757a4d4?w=800&auto=format&fit=crop&q=80'
  };

  const DEFAULT_IMAGE = 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800&auto=format&fit=crop&q=80';

  let rawItems = [];
  let categorized = {};

  // Helpers
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

  function haptic() {
    if ('vibrate' in navigator) { try { navigator.vibrate(10); } catch (e) {} }
  }

  // Render Category Cards List
  function renderCategoryList() {
    const cats = Object.keys(categorized);
    if (cats.length === 0) {
      categoryListView.innerHTML = `<div class="v2-state-box">No categories found.</div>`;
      return;
    }

    categoryListView.innerHTML = cats.map(cat => {
      const img = CATEGORY_IMAGES[cat] || DEFAULT_IMAGE;
      const count = categorized[cat].length;
      return `
        <button type="button" class="v2-category-card" data-cat="${esc(cat)}">
          <img src="${esc(img)}" alt="${esc(cat)}" class="v2-category-bg" loading="lazy">
          <div class="v2-category-overlay">
            <span class="v2-category-name">${esc(cat)}</span>
            <span class="v2-category-count">${count} Item${count !== 1 ? 's' : ''}</span>
          </div>
        </button>
      `;
    }).join('');

    // Attach click events
    categoryListView.querySelectorAll('.v2-category-card').forEach(btn => {
      btn.addEventListener('click', () => {
        haptic();
        openCategory(btn.dataset.cat);
      });
    });
  }

  // Open Category Detail View
  function openCategory(cat) {
    const items = categorized[cat] || [];
    currentCatTitle.textContent = cat;

    detailItemsList.innerHTML = items.map(item => `
      <div class="v2-item-card">
        <div class="v2-item-top">
          <span class="v2-item-name">${esc(item.name)}</span>
          <div class="v2-item-dots"></div>
          <span class="v2-item-price">${esc(formatPrice(item.price))}</span>
        </div>
        ${item.notes ? `<p class="v2-item-desc">${esc(item.notes)}</p>` : ''}
      </div>
    `).join('');

    categoryListView.style.display = 'none';
    searchResultsView.classList.remove('active');
    detailView.classList.add('active');
    window.scrollTo({ top: 120, behavior: 'smooth' });
  }

  // Return to Category List
  function closeCategory() {
    detailView.classList.remove('active');
    categoryListView.style.display = 'flex';
  }

  // Instant Live Search
  function handleSearch(query) {
    const q = (query || '').trim().toLowerCase();
    if (!q) {
      searchResultsView.classList.remove('active');
      if (!detailView.classList.contains('active')) {
        categoryListView.style.display = 'flex';
      }
      return;
    }

    // Hide other views while searching
    categoryListView.style.display = 'none';
    detailView.classList.remove('active');
    searchResultsView.classList.add('active');

    const matches = rawItems.filter(item => {
      const name = (item.name || '').toLowerCase();
      const cat  = (item.category || '').toLowerCase();
      const notes= (item.notes || '').toLowerCase();
      return name.includes(q) || cat.includes(q) || notes.includes(q);
    });

    searchMeta.textContent = `${matches.length} result${matches.length !== 1 ? 's' : ''} found for "${query}"`;

    if (matches.length === 0) {
      searchItemsList.innerHTML = `<div class="v2-state-box">No matching items found. Try another search.</div>`;
      return;
    }

    searchItemsList.innerHTML = matches.map(item => `
      <div class="v2-item-card">
        <div class="v2-item-top">
          <span class="v2-item-name">${esc(item.name)}</span>
          <div class="v2-item-dots"></div>
          <span class="v2-item-price">${esc(formatPrice(item.price))}</span>
        </div>
        ${item.notes ? `<p class="v2-item-desc">${esc(item.notes)}</p>` : ''}
        <span style="font-size:0.72rem;color:var(--gold-dark);font-weight:600;">Category: ${esc(item.category || 'General')}</span>
      </div>
    `).join('');
  }

  // Event Listeners
  if (backBtn) {
    backBtn.addEventListener('click', () => {
      haptic();
      closeCategory();
    });
  }

  if (searchInput) {
    searchInput.addEventListener('input', (e) => {
      handleSearch(e.target.value);
    });
  }

  // Load from Supabase
  async function loadData() {
    try {
      const { createClient } = window.supabase;
      const db = createClient(SUPABASE_URL, SUPABASE_ANON);

      const { data, error } = await db
        .from('inventory')
        .select('*')
        .eq('section', section)
        .eq('available', true)
        .order('sort_order', { ascending: true })
        .order('name',       { ascending: true });

      if (error) throw error;

      rawItems = data || [];

      // Group by category preserving sort order
      categorized = {};
      rawItems.forEach(item => {
        const cat = item.category || 'Specialties';
        if (!categorized[cat]) categorized[cat] = [];
        categorized[cat].push(item);
      });

      renderCategoryList();
    } catch (err) {
      console.error('[Menu V2] Load error:', err);
      categoryListView.innerHTML = `
        <div class="v2-state-box">
          <p>⚠️ Unable to load menu right now.</p>
          <p style="margin-top:0.4rem;font-size:0.75rem;">Please check your connection and refresh.</p>
        </div>
      `;
    }
  }

  loadData();
})();
