/**
 * BIJOU – Card/Banner Mobile Menu (V2 Prototype)
 * Connects to Supabase, maps categories to authentic food photography banners,
 * and enables smooth category navigation + live instant search.
 */

(function () {
  const SUPABASE_URL  = 'https://mwcegvrxwvtpdlyorhpr.supabase.co';
  const SUPABASE_ANON = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13Y2VndnJ4d3Z0cGRseW9yaHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTA0NzU3MDgsImV4cCI6MjEwNjA1MTcwOH0.zRg_eEGHPVXXke13TYNYb6NmpoZc7LgYpzZM1z24HF8';

  const section = document.body.dataset.section || 'restaurant';

  // DOM Elements
  const cardHeader        = document.getElementById('v2CardHeader');
  const searchWrap        = document.getElementById('v2SearchWrap');
  const searchInput       = document.getElementById('v2SearchInput');
  const categoryListView  = document.getElementById('v2CategoryList');
  const detailView        = document.getElementById('v2DetailView');
  const searchResultsView = document.getElementById('v2SearchResults');
  const backBtn           = document.getElementById('v2BackBtn');
  const detailBannerImg   = document.getElementById('v2DetailBannerImg');
  const currentCatTitle   = document.getElementById('v2CurrentCatTitle');
  const currentCatCount   = document.getElementById('v2CurrentCatCount');
  const detailItemsList   = document.getElementById('v2DetailItemsList');
  const searchItemsList   = document.getElementById('v2SearchItemsList');
  const searchMeta        = document.getElementById('v2SearchMeta');

  // Curated category banner photos (Authentic and food-accurate local assets)
  const CATEGORY_IMAGES = {
    // ── Restaurant ──
    'Charcoal Grill & BBQ': 'assets/thumbs/bbq_charcoal_chicken.jpg',
    'Rice & Porridge':      'assets/categories/jollof.jpg',
    'Ofada Dishes':         'assets/categories/ofada.jpg',
    'Swallow Combos':       'assets/categories/swallow.jpg',
    'Swallow':              'assets/categories/swallow.jpg',
    'Beans':                'assets/thumbs/beans_stew.jpg',
    'Pasta & Noodles':      'assets/thumbs/pasta.jpg',
    'Pasta':                'assets/thumbs/pasta.jpg',
    'Pepper Soups':         'assets/thumbs/peppersoup_fish.jpg',
    'Signature Platters':   'assets/thumbs/platter.jpg',
    '1911 Special Platter': 'assets/thumbs/platter.jpg',
    'Salads':               'assets/thumbs/caesar.jpg',
    'Gourmet Soups':        'assets/categories/swallow.jpg',
    'Soups & Stews':        'assets/thumbs/red_stew.jpg',
    'Soup Varieties':       'assets/thumbs/red_stew.jpg',
    'Soups by the Litre':   'assets/thumbs/red_stew.jpg',
    'Sauces & Stews':       'assets/thumbs/red_stew.jpg',
    'Sauces':               'assets/thumbs/red_stew.jpg',
    'Sauce':                'assets/thumbs/red_stew.jpg',
    'Seafood Special':      'assets/thumbs/cajun_boil.jpg',
    'Proteins':             'assets/thumbs/proteins.jpg',
    'Extra Sides':          'assets/thumbs/fried_plantains.jpg',
    'Extra':                'assets/thumbs/fried_plantains.jpg',
    'Swallows Extra':       'assets/categories/swallow.jpg',

    // ── Lounge ──
    'Soft Drinks & Yoghurt':'assets/thumbs/soda.jpg',
    'Cognac Drink':         'assets/thumbs/cognac_snifter.jpg',
    'Juice':                'assets/thumbs/juice.jpg',
    'Can Drink':            'assets/thumbs/cans.jpg',
    'Beer':                 'assets/thumbs/beer.jpg',
    'Gin':                  'assets/thumbs/gin_tonic.jpg',
    'Wine':                 'assets/thumbs/wine.jpg',
    'Vodka':                'assets/thumbs/vodka.jpg',
    'Champagne':            'assets/thumbs/test_champagne.jpg',
    'Tequila':              'assets/thumbs/test_tequila.jpg',
    'Mocktails':            'assets/thumbs/mocktail.jpg',
    'Cocktails':            'assets/thumbs/cocktail.jpg',
    'Bitters Drink':        'assets/thumbs/bitters.jpg',
    'Sparkling Wine':       'assets/thumbs/sparkling.jpg',
    'Energy Drinks':        'assets/thumbs/energy.jpg',
    'Whisky Drinks':        'assets/thumbs/whisky_glass.jpg'
  };

  const DEFAULT_IMAGE = 'assets/thumbs/platter.jpg';

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
    if (n == null || Number(n) === 0) return null;
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
    const img = CATEGORY_IMAGES[cat] || DEFAULT_IMAGE;

    // Set banner image, title & count
    if (detailBannerImg) detailBannerImg.src = img;
    if (currentCatTitle) currentCatTitle.textContent = cat;
    if (currentCatCount) currentCatCount.textContent = `${items.length} Item${items.length !== 1 ? 's' : ''}`;

    // Render items with clean price handling
    detailItemsList.innerHTML = items.map(item => {
      const formattedPrice = formatPrice(item.price);
      const priceElement = formattedPrice
        ? `<div class="v2-item-dots"></div><span class="v2-item-price">${esc(formattedPrice)}</span>`
        : `<span class="v2-item-price-ask">Price on request</span>`;

      return `
        <div class="v2-item-card">
          <div class="v2-item-top">
            <span class="v2-item-name">${esc(item.name)}</span>
            ${priceElement}
          </div>
          ${item.notes ? `<p class="v2-item-desc">${esc(item.notes)}</p>` : ''}
        </div>
      `;
    }).join('');

    // Toggle views cleanly
    if (cardHeader) cardHeader.style.display = 'none';
    if (searchWrap) searchWrap.style.display = 'none';
    categoryListView.style.display = 'none';
    searchResultsView.classList.remove('active');
    detailView.classList.add('active');

    // Smooth scroll to top of card
    const cardSheet = document.querySelector('.v2-main-card');
    if (cardSheet) cardSheet.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

  // Return to Category List
  function closeCategory() {
    detailView.classList.remove('active');
    if (cardHeader) cardHeader.style.display = 'block';
    if (searchWrap) searchWrap.style.display = 'block';
    categoryListView.style.display = 'flex';
  }

  // Instant Live Search
  function handleSearch(query) {
    const q = (query || '').trim().toLowerCase();
    if (!q) {
      searchResultsView.classList.remove('active');
      if (!detailView.classList.contains('active')) {
        categoryListView.style.display = 'flex';
        if (cardHeader) cardHeader.style.display = 'block';
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

    searchItemsList.innerHTML = matches.map(item => {
      const formattedPrice = formatPrice(item.price);
      const priceElement = formattedPrice
        ? `<div class="v2-item-dots"></div><span class="v2-item-price">${esc(formattedPrice)}</span>`
        : `<span class="v2-item-price-ask">Price on request</span>`;

      return `
        <div class="v2-item-card">
          <div class="v2-item-top">
            <span class="v2-item-name">${esc(item.name)}</span>
            ${priceElement}
          </div>
          ${item.notes ? `<p class="v2-item-desc">${esc(item.notes)}</p>` : ''}
          <span style="font-size:0.72rem;color:var(--gold-dark);font-weight:600;margin-top:2px;">Category: ${esc(item.category || 'General')}</span>
        </div>
      `;
    }).join('');
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
