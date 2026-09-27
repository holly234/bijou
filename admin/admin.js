// ================================================================
// BIJOU Admin – Inventory Manager
// Supabase-backed CRUD for Restaurant & Lounge sections
// ================================================================

const SUPABASE_URL  = 'https://mwcegvrxwvtpdlyorhpr.supabase.co';
const SUPABASE_ANON = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13Y2VndnJ4d3Z0cGRseW9yaHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTA0NzU3MDgsImV4cCI6MjEwNjA1MTcwOH0.zRg_eEGHPVXXke13TYNYb6NmpoZc7LgYpzZM1z24HF8';

// ----------------------------------------------------------------
// Initialise Supabase client (CDN global: window.supabase)
// ----------------------------------------------------------------
const { createClient } = window.supabase;
const db = createClient(SUPABASE_URL, SUPABASE_ANON);

// ─── DOM References ─────────────────────────────────────────────
const statusDot    = document.getElementById('statusDot');
const statusText   = document.getElementById('statusText');
const toast        = document.getElementById('toast');
const itemDialog   = document.getElementById('itemDialog');
const confirmDialog= document.getElementById('confirmDialog');
const itemForm     = document.getElementById('itemForm');
const dialogTitle  = document.getElementById('dialogTitle');
const saveBtn      = document.getElementById('saveBtn');
const cancelBtn    = document.getElementById('cancelBtn');
const dialogClose  = document.getElementById('dialogClose');
const confirmCancel= document.getElementById('confirmCancel');
const confirmDelete= document.getElementById('confirmDelete');
const confirmText  = document.getElementById('confirmText');

// Form fields
const fieldId       = document.getElementById('itemId');
const fieldSection  = document.getElementById('itemSection');
const fieldName     = document.getElementById('fieldName');
const fieldCategory = document.getElementById('fieldCategory');
const fieldPrice    = document.getElementById('fieldPrice');
const fieldNotes    = document.getElementById('fieldNotes');

// Inventory panels
const panels = {
  restaurant: {
    body:   document.getElementById('restaurantBody'),
    search: document.getElementById('searchRestaurant'),
    addBtn: document.getElementById('addRestaurantBtn'),
  },
  lounge: {
    body:   document.getElementById('loungeBody'),
    search: document.getElementById('searchLounge'),
    addBtn: document.getElementById('addLoungeBtn'),
  },
};

// In-memory cache  { section: Item[] }
const cache = { restaurant: [], lounge: [] };

// Pending delete state
let pendingDeleteId = null;

// ─── Utility: Toast ──────────────────────────────────────────────
let toastTimer = null;
function showToast(msg, type = 'success') {
  toast.textContent = msg;
  toast.className = `toast ${type} show`;
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => { toast.className = 'toast'; }, 3000);
}

// ─── Utility: Connection indicator ──────────────────────────────
function setStatus(connected) {
  statusDot.className = `status-dot ${connected ? 'connected' : 'error'}`;
  statusText.textContent = connected ? 'Connected' : 'Offline';
}

// ─── Escape HTML ─────────────────────────────────────────────────
function escHtml(str) {
  return String(str ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}

// ─── Render table for a section ─────────────────────────────────
function renderTable(section, query = '') {
  const { body } = panels[section];
  const q = query.toLowerCase().trim();
  const items = cache[section].filter(item =>
    !q ||
    item.name.toLowerCase().includes(q) ||
    (item.category || '').toLowerCase().includes(q)
  );

  if (items.length === 0) {
    body.innerHTML = `
      <tr class="empty-row">
        <td colspan="5">${q ? 'No items match your search.' : 'No items yet — add your first item!'}</td>
      </tr>`;
    return;
  }

  body.innerHTML = items.map(item => {
    const isAvailable = item.available !== false;
    const price = item.price != null
      ? `₦${Number(item.price).toLocaleString('en-NG', { minimumFractionDigits: 0 })}`
      : '—';
    return `
    <tr data-id="${item.id}" class="${isAvailable ? '' : 'row-unavailable'}">
      <td>${escHtml(item.name)}</td>
      <td><span class="chip">${escHtml(item.category || '—')}</span></td>
      <td class="col-avail">
        <label class="avail-toggle" title="${isAvailable ? 'Click to mark unavailable' : 'Click to mark available'}">
          <input type="checkbox" class="avail-checkbox"
                 data-id="${item.id}" data-section="${section}"
                 ${isAvailable ? 'checked' : ''}
                 aria-label="Toggle availability for ${escHtml(item.name)}">
          <span class="avail-pill ${isAvailable ? 'avail-yes' : 'avail-no'}">
            ${isAvailable ? '✓ Yes' : '✕ No'}
          </span>
        </label>
      </td>
      <td class="col-price">${price}</td>
      <td class="col-actions">
        <div class="action-cell">
          <button class="btn-edit" data-action="edit" data-id="${item.id}" aria-label="Edit ${escHtml(item.name)}">Edit</button>
          <button class="btn-delete" data-action="delete" data-id="${item.id}" aria-label="Delete ${escHtml(item.name)}">✕</button>
        </div>
      </td>
    </tr>`;
  }).join('');
}

// ─── Fetch all items for a section ──────────────────────────────
async function fetchSection(section) {
  const { data, error } = await db
    .from('inventory')
    .select('*')
    .eq('section', section)
    .order('category', { ascending: true })
    .order('name', { ascending: true });

  if (error) {
    console.error(`[Bijou Admin] fetch ${section}:`, error);
    setStatus(false);
    panels[section].body.innerHTML = `<tr class="empty-row"><td colspan="5">⚠️ Failed to load items.</td></tr>`;
    return;
  }

  cache[section] = data ?? [];
  setStatus(true);
  renderTable(section);
}

// ─── Toggle availability (instant, no save button needed) ────────
async function toggleAvailable(id, section, newValue) {
  // Optimistic UI
  const item = cache[section].find(i => i.id === id);
  if (!item) return;
  item.available = newValue;
  renderTable(section, panels[section].search.value);

  const { error } = await db
    .from('inventory')
    .update({ available: newValue, updated_at: new Date().toISOString() })
    .eq('id', id);

  if (error) {
    showToast('Failed to update availability.', 'error');
    item.available = !newValue; // revert
    renderTable(section, panels[section].search.value);
  } else {
    showToast(newValue ? 'Item is now available.' : 'Item hidden from menu.');
  }
}

// ─── Open Add dialog ─────────────────────────────────────────────
function openAddDialog(section) {
  itemForm.reset();
  fieldId.value = '';
  fieldSection.value = section;
  dialogTitle.textContent = `Add ${section === 'restaurant' ? 'Dish' : 'Drink / Spirit'}`;
  clearFormErrors();
  itemDialog.showModal();
  fieldName.focus();
}

// ─── Open Edit dialog ────────────────────────────────────────────
function openEditDialog(id, section) {
  const item = cache[section].find(i => i.id === id);
  if (!item) return;
  itemForm.reset();
  fieldId.value      = item.id;
  fieldSection.value = section;
  fieldName.value    = item.name;
  fieldCategory.value= item.category || '';
  fieldPrice.value   = item.price ?? '';
  fieldNotes.value   = item.notes || '';
  dialogTitle.textContent = 'Edit Item';
  clearFormErrors();
  itemDialog.showModal();
  fieldName.focus();
}

// ─── Form validation ─────────────────────────────────────────────
function validateForm() {
  let valid = true;
  clearFormErrors();
  if (!fieldName.value.trim()) {
    document.getElementById('errorName').textContent = 'Name is required.';
    fieldName.classList.add('invalid');
    valid = false;
  }
  if (!fieldCategory.value.trim()) {
    document.getElementById('errorCategory').textContent = 'Category is required.';
    fieldCategory.classList.add('invalid');
    valid = false;
  }
  return valid;
}

function clearFormErrors() {
  document.getElementById('errorName').textContent = '';
  document.getElementById('errorCategory').textContent = '';
  fieldName.classList.remove('invalid');
  fieldCategory.classList.remove('invalid');
}

// ─── Save (create or update) ─────────────────────────────────────
itemForm.addEventListener('submit', async (e) => {
  e.preventDefault();
  if (!validateForm()) return;

  saveBtn.disabled = true;
  saveBtn.textContent = 'Saving…';

  const section = fieldSection.value;
  const id      = fieldId.value;
  const payload = {
    name:       fieldName.value.trim(),
    category:   fieldCategory.value.trim(),
    price:      fieldPrice.value !== '' ? parseFloat(fieldPrice.value) : null,
    notes:      fieldNotes.value.trim() || null,
    section,
    updated_at: new Date().toISOString(),
  };

  let error;
  if (id) {
    ({ error } = await db.from('inventory').update(payload).eq('id', id));
  } else {
    payload.available  = true;
    payload.created_at = new Date().toISOString();
    ({ error } = await db.from('inventory').insert(payload));
  }

  saveBtn.disabled = false;
  saveBtn.textContent = 'Save Item';

  if (error) {
    showToast('Save failed. Please try again.', 'error');
    return;
  }

  itemDialog.close();
  showToast(id ? 'Item updated!' : 'Item added!');
  await fetchSection(section);
});

// ─── Delete flow ─────────────────────────────────────────────────
function openDeleteConfirm(id, section) {
  const item = cache[section].find(i => i.id === id);
  pendingDeleteId = { id, section };
  confirmText.textContent = item
    ? `Remove "${item.name}" from ${section} inventory?`
    : 'Are you sure you want to remove this item?';
  confirmDialog.showModal();
}

confirmDelete.addEventListener('click', async () => {
  if (!pendingDeleteId) return;
  const { id, section } = pendingDeleteId;

  confirmDelete.disabled = true;
  confirmDelete.textContent = 'Removing…';

  const { error } = await db.from('inventory').delete().eq('id', id);

  confirmDelete.disabled = false;
  confirmDelete.textContent = 'Yes, Remove';
  confirmDialog.close();
  pendingDeleteId = null;

  if (error) { showToast('Delete failed.', 'error'); return; }
  showToast('Item removed.');
  await fetchSection(section);
});

// ─── Dialog close helpers ────────────────────────────────────────
[dialogClose, cancelBtn].forEach(btn => {
  btn.addEventListener('click', () => itemDialog.close());
});
confirmCancel.addEventListener('click', () => confirmDialog.close());
[itemDialog, confirmDialog].forEach(dlg => {
  dlg.addEventListener('click', (e) => { if (e.target === dlg) dlg.close(); });
});

// ─── Tab switching ─────────────────────────────────────────────
let activeSection = 'restaurant';
document.querySelectorAll('.tab-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const section = btn.dataset.section;
    if (section === activeSection) return;
    activeSection = section;
    document.querySelectorAll('.tab-btn').forEach(b => {
      b.classList.toggle('active', b.dataset.section === section);
      b.setAttribute('aria-selected', b.dataset.section === section ? 'true' : 'false');
    });
    document.querySelectorAll('.tab-panel').forEach(panel => {
      const isActive = panel.id === `panel-${section}`;
      panel.classList.toggle('active', isActive);
      panel.hidden = !isActive;
    });
  });
});

// ─── Add buttons ─────────────────────────────────────────────────
panels.restaurant.addBtn.addEventListener('click', () => openAddDialog('restaurant'));
panels.lounge.addBtn.addEventListener('click',    () => openAddDialog('lounge'));

// ─── Table action delegation (edit / delete / availability) ──────
document.querySelectorAll('.inventory-table').forEach(table => {
  const section = table.id === 'restaurantTable' ? 'restaurant' : 'lounge';

  // Edit / Delete buttons
  table.addEventListener('click', (e) => {
    const btn = e.target.closest('[data-action]');
    if (!btn) return;
    const { action, id } = btn.dataset;
    if (action === 'edit')   openEditDialog(id, section);
    if (action === 'delete') openDeleteConfirm(id, section);
  });

  // Availability checkboxes
  table.addEventListener('change', (e) => {
    const checkbox = e.target.closest('.avail-checkbox');
    if (!checkbox) return;
    toggleAvailable(checkbox.dataset.id, checkbox.dataset.section, checkbox.checked);
  });
});

// ─── Live search ─────────────────────────────────────────────────
panels.restaurant.search.addEventListener('input', (e) => renderTable('restaurant', e.target.value));
panels.lounge.search.addEventListener('input',    (e) => renderTable('lounge',     e.target.value));

// ─── Real-time subscriptions ──────────────────────────────────────
function subscribeRealtime(section) {
  db.channel(`inventory:${section}`)
    .on('postgres_changes', {
      event: '*', schema: 'public', table: 'inventory',
      filter: `section=eq.${section}`,
    }, () => fetchSection(section))
    .subscribe();
}

// ─── Bootstrap ───────────────────────────────────────────────────
async function init() {
  await Promise.all([fetchSection('restaurant'), fetchSection('lounge')]);
  subscribeRealtime('restaurant');
  subscribeRealtime('lounge');
}

init();
