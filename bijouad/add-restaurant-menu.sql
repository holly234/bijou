-- ============================================================
-- Bijou Restaurant Menu — Clean, Unified Categorization
-- Paste into Supabase → SQL Editor → Run
-- ============================================================

-- Ensure sort_order column exists
alter table public.inventory add column if not exists sort_order integer not null default 99;

-- 1. Wipe previous restaurant items to eliminate duplicates
delete from public.inventory where section = 'restaurant';

-- 2. Insert clean, unified menu in logical dining order
insert into public.inventory (section, name, category, quantity, unit, price, notes, available, sort_order) values

-- ── 1. CHARCOAL GRILL & BBQ ──────────────────────────────────
('restaurant', 'Catfish Barbecue',      'Charcoal Grill & BBQ', 99, 'portions', null,  'Seasoned and Charcoal Grilled, Served with Tila Special Sauce.', true, 1),
('restaurant', 'Chicken Barbecue',      'Charcoal Grill & BBQ', 99, 'portions', null,  'Seasoned and Charcoal Grilled, Served with Tila Special Sauce.', true, 1),
('restaurant', 'Croaker Fish',          'Charcoal Grill & BBQ', 99, 'portions', null,  'Seasoned and Charcoal Grilled, Served with Tila Special Sauce.', true, 1),
('restaurant', 'Tilapia Fish Barbecue', 'Charcoal Grill & BBQ', 99, 'portions', null,  'Seasoned and Charcoal Grilled, Served with Tila Special Sauce.', true, 1),
('restaurant', 'Turkey Barbecue',       'Charcoal Grill & BBQ', 99, 'portions', null,  'Seasoned and Charcoal Grilled, Served with Tila Special Sauce.', true, 1),

-- ── 2. RICE & PORRIDGE ───────────────────────────────────────
('restaurant', 'Firewood Delight',       'Rice & Porridge', 99, 'portions', 9750,  'Smokey Jollof, Moi-Moi, Plantain (1 portion), 2 Beef & 1 Bottle Water.', true, 2),
('restaurant', 'Jollof Reloaded',        'Rice & Porridge', 99, 'portions', 14250, 'Smokey Jollof, Coleslaw, Moi-Moi, Plantain (1 Portion), 1 Hake or Panla Fish, 2 Beef & 1 Bottle Water.', true, 2),
('restaurant', 'Hot Pot Jollof',         'Rice & Porridge', 99, 'portions', 18750, 'Smokey Jollof, Coleslaw, Moi-Moi, Plantain, 1 Turkey, 1 Hake or Panla Fish, 1 Soft Drink & 1 Bottle Water.', true, 2),
('restaurant', 'Royal Jollof',           'Rice & Porridge', 99, 'portions', 28750, 'Smokey Jollof, Coleslaw, Moi-Moi, Plantain, 1 Turkey, 1 Hake or Panla Fish, 1 Chicken, 1 Beef, 1 Ponmo, 2 Soft Drinks & 2 Bottle Water.', true, 2),
('restaurant', 'Fried Rice Combo',       'Rice & Porridge', 99, 'portions', 11750, 'Fried Rice, Plantain, Moi-Moi, 2 Beef, 1 Coleslaw & 1 Bottle Water.', true, 2),
('restaurant', 'Coconut Rice Combo',     'Rice & Porridge', 99, 'portions', 16750, 'Coconut Rice with Sauce, 1 Egg, 1 Beef, 1 Ponmo, Panla Fish & 1 Bottle Water.', true, 2),
('restaurant', '1911 Special Signature', 'Rice & Porridge', 99, 'portions', 28250, 'Made with Basmati rice, Prawn, Vegetables, with Plantain, Turkey or Chicken or Fish.', true, 2),
('restaurant', 'Native Rice',            'Rice & Porridge', 99, 'portions', 14700, 'Rich native spiced rice with assorted seasonings.', true, 2),
('restaurant', 'Asun Rice',              'Rice & Porridge', 99, 'portions', 21750, 'Spicy Asun infused rice loaded with peppered goat meat.', true, 2),
('restaurant', 'Classic Porridge',       'Rice & Porridge', 99, 'portions', 14600, 'Porridge, Steamed Vegetable, Beef, Eja Kika & 1 Bottle Water.', true, 2),

-- ── 3. OFADA DISHES ──────────────────────────────────────────
('restaurant', 'Ofada Bliss',   'Ofada Dishes', 99, 'portions', 7750,  'Ofada, Plantain, Egg, 2 Assorted, 1 Ponmo & 1 Bottle Water.', true, 3),
('restaurant', 'Ofada Delight', 'Ofada Dishes', 99, 'portions', 12750, 'Ofada, Beans (Optional), Plantain, 1 Egg, 1 Ponmo, 1 Panla Fish, 2 Assorted & 1 Bottle Water.', true, 3),
('restaurant', 'Ofada Aladun',  'Ofada Dishes', 99, 'portions', 18250, 'Ofada, Beans (Optional), Plantain, 2 Boiled Eggs, 1 Ponmo, 2 Assorted, 1 Hake or Panla Fish, 1 Bottle Water & 1 Soft Drink.', true, 3),
('restaurant', 'Ofada Olola',   'Ofada Dishes', 99, 'portions', 28750, 'Ofada, Beans, Plantain, 2 Boiled Eggs, 3 Ponmo, 2 Beef, 2 Assorted, Hake or Panla Fish, 1 Soft Drink & 1 Bottle Water.', true, 3),

-- ── 4. SWALLOW COMBOS ────────────────────────────────────────
('restaurant', 'Gbayi',    'Swallow Combos', 99, 'portions', 7250,  'Amala (3 Scoops), Gbegiri/Ewedu, 2 Assorted, 2 Ponmo & 1 Bottle Water.', true, 4),
('restaurant', 'Amuludun', 'Swallow Combos', 99, 'portions', 11250, 'Amala (3 Scoops), Gbegiri/Ewedu, 1 Goat Meat, 2 Ponmo, 2 Assorted & 1 Bottle Water.', true, 4),
('restaurant', 'Oga-Nla',  'Swallow Combos', 99, 'portions', 15250, 'Amala (4 Scoops), Gbegiri/Ewedu, 1 Goat Meat, 2 Ponmo, 2 Assorted, 1 Fish, 1 Soft Drink & 1 Water.', true, 4),
('restaurant', 'Olowo-Eko','Swallow Combos', 99, 'portions', 24750, 'Amala (6 Scoops), Gbegiri/Ewedu, 4 Ponmo, 6 Assorted, 2 Soft Drinks & 2 Waters.', true, 4),

-- ── 5. BEANS ─────────────────────────────────────────────────
('restaurant', 'Ewa Agonyin Royale', 'Beans', 99, 'portions', 8750, 'Ewa Agonyin, Plantain, Eja Kika, 2 Ponmo & 1 Bottle Water.', true, 5),

-- ── 6. PASTA & NOODLES ───────────────────────────────────────
('restaurant', 'Stir-fry Spaghetti (Full)',           'Pasta & Noodles', 99, 'portions', 19000, 'Full plate stir-fried spaghetti.', true, 6),
('restaurant', 'Stir-fry Spaghetti (Half)',           'Pasta & Noodles', 99, 'portions', 11000, 'Half plate stir-fried spaghetti.', true, 6),
('restaurant', 'Creamy Pasta',                        'Pasta & Noodles', 99, 'portions', 21000, 'Rich and creamy pasta with savoury seasonings.', true, 6),
('restaurant', 'Spaghetti Jollof',                    'Pasta & Noodles', 99, 'portions', 9000,  'Nigerian-style jollof spaghetti.', true, 6),
('restaurant', 'Singapore Noodles',                   'Pasta & Noodles', 99, 'portions', 26000, 'Stir-fried curried noodles loaded with protein and veggies.', true, 6),
('restaurant', 'Noodle with Veggies, Eggs & Protein', 'Pasta & Noodles', 99, 'portions', 15750, 'Served with 2 Eggs, Fish or 2 Beef.', true, 6),

-- ── 7. PEPPER SOUPS ──────────────────────────────────────────
('restaurant', 'Fish Pepper Soup (Full)',    'Pepper Soups', 99, 'portions', 17250, 'Fish cooked with Pepper Soup Mix, Aromatics, Chunks of Sweet Potatoes or Unripe Plantain.', true, 7),
('restaurant', 'Fish Pepper Soup (Half)',    'Pepper Soups', 99, 'portions', 12250, 'Fish cooked with Pepper Soup Mix, Aromatics, Chunks of Sweet Potatoes or Unripe Plantain.', true, 7),
('restaurant', 'Goat Meat Pepper Soup',     'Pepper Soups', 99, 'portions', 12250, 'Goat Meat cooked with Pepper Soup Mix, Aromatics, Chunks of Sweet Potatoes or Unripe Plantain.', true, 7),
('restaurant', 'Seafood Pepper Soup',       'Pepper Soups', 99, 'portions', 27250, 'Seafood, Crab, Fresh Fish cooked with Pepper Soup Mix & Aromatics.', true, 7),
('restaurant', 'Point and Kill Peppersoup', 'Pepper Soups', 99, 'portions', 46250, 'Live Full Chicken cooked with Peppersoup Mix, Aromatics, Chunks of Sweet Potatoes or Unripe Plantain.', true, 7),

-- ── 8. SIGNATURE PLATTERS ────────────────────────────────────
('restaurant', '1911 Special Platter (Small)', 'Signature Platters', 99, 'portions', 62500,  'Spicy Chicken Wings x4, Turkey x4, Gizzard x4, Yam Fries, Plantain Fries & 1 Bottle Water. Served with our Signature Sauce.', true, 8),
('restaurant', '1911 Special Platter (Large)', 'Signature Platters', 99, 'portions', 121500, 'Chicken Wings x7, Turkey x7, Gizzard x10, Snail x5, Crab x2, Prawn x2, Yam Fries, Plantain Fries, Sweet Potato, 2 Soft Drinks & 1 Bottle Water.', true, 8),

-- ── 9. SALADS ────────────────────────────────────────────────
('restaurant', 'Coleslaw Bowl',        'Salads', 99, 'portions', 5700,  'Cabbage, Carrot, Mixed with Mayonnaise Vinegar, Sugar & Salt.', true, 9),
('restaurant', 'Chicken Caesar Salad', 'Salads', 99, 'portions', 8600,  'Lettuce, Diced Chicken, Carrot, Fresh Tomatoes, Cheese, Garlic, Mixed with Mayonnaise Vinegar, Sugar & Salt.', true, 9),
('restaurant', 'Prawn Caesar Salad',   'Salads', 99, 'portions', 14500, 'Prawn, Diced Chicken, Carrot, Fresh Tomatoes, Cheese, Garlic, Mixed with Mayonnaise Vinegar, Sugar & Salt.', true, 9),

-- ── 10. GOURMET SOUPS (WITH SWALLOW) ────────────────────────
('restaurant', 'Seafood Okro',          'Gourmet Soups', 99, 'portions', 27500, 'Fish, Crab, Prawns, Vegetables, Calamari. Served with Swallow of your Choice.', true, 10),
('restaurant', 'Efo Riro',              'Gourmet Soups', 99, 'portions', 12100, 'Efo Riro, Palmoil, Pepper Mix, Locust Beans, Fried Fish. Served with Swallow of your Choice.', true, 10),
('restaurant', 'Egusi with Vegetables', 'Gourmet Soups', 99, 'portions', 12100, 'Egusi, Vegetables, Pepper Mix, Locust Beans, Fried Fish. Served with Swallow of your Choice.', true, 10),
('restaurant', 'Ogbono Soup',           'Gourmet Soups', 99, 'portions', 11000, 'Served with Swallow of your Choice.', true, 10),
('restaurant', 'Oha Soup',              'Gourmet Soups', 99, 'portions', 12300, 'Served with Swallow of your Choice.', true, 10),
('restaurant', 'Afang Soup',            'Gourmet Soups', 99, 'portions', 12300, 'Served with Swallow of your Choice.', true, 10),
('restaurant', 'Edikaikong',            'Gourmet Soups', 99, 'portions', 12000, 'Served with Swallow of your Choice.', true, 10),
('restaurant', 'Ofensala',              'Gourmet Soups', 99, 'portions', 12300, 'Served with Swallow of your Choice.', true, 10),
('restaurant', 'Fisherman Soup',        'Gourmet Soups', 99, 'portions', 23500, 'Served with Swallow of your Choice.', true, 10),

-- ── 11. SOUPS BY THE LITRE ──────────────────────────────────
('restaurant', 'Chicken Soup (1 Litre)',     'Soups by the Litre', 99, 'portions', 31500, '1 Litre.', true, 11),
('restaurant', 'Turkey Soup (1 Litre)',      'Soups by the Litre', 99, 'portions', 46500, '1 Litre.', true, 11),
('restaurant', 'Beef Soup (1 Litre)',        'Soups by the Litre', 99, 'portions', 29500, '1 Litre.', true, 11),
('restaurant', 'Fish Soup (1 Litre)',        'Soups by the Litre', 99, 'portions', 36500, '1 Litre.', true, 11),
('restaurant', 'Ogbono Soup (1 Litre)',      'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true, 11),
('restaurant', 'Oha Soup (1 Litre)',         'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true, 11),
('restaurant', 'Efo Riro Soup (1 Litre)',    'Soups by the Litre', 99, 'portions', 26500, '1 Litre.', true, 11),
('restaurant', 'Efo Elegusi Soup (1 Litre)', 'Soups by the Litre', 99, 'portions', 26500, '1 Litre.', true, 11),
('restaurant', 'Afang Soup (1 Litre)',       'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true, 11),
('restaurant', 'Edikaikong Soup (1 Litre)',  'Soups by the Litre', 99, 'portions', 31500, '1 Litre.', true, 11),
('restaurant', 'Ofe-Nsala Soup (1 Litre)',   'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true, 11),
('restaurant', 'Gbegiri Soup (1 Litre)',     'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true, 11),
('restaurant', 'Ewedu Soup (1 Litre)',       'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true, 11),

-- ── 12. SAUCES & STEWS ──────────────────────────────────────
('restaurant', 'Ofada Sauce with Protein (1L)',   'Sauces & Stews', 99, 'portions', 37500, '1 Litre of Ofada Sauce with Protein.', true, 12),
('restaurant', 'Agonyin Sauce (1L)',               'Sauces & Stews', 99, 'portions', 17500, '1 Litre of Agonyin Sauce.', true, 12),
('restaurant', 'Agonyin Sauce with Protein (1L)', 'Sauces & Stews', 99, 'portions', 27500, '1 Litre of Agonyin Sauce with Protein.', true, 12),
('restaurant', 'Goat Meat Stew',                  'Sauces & Stews', 99, 'portions', 25350, 'Rich slow-cooked goat meat stew.', true, 12),

-- ── 13. SEAFOOD SPECIAL ─────────────────────────────────────
('restaurant', 'Seafood Boils (Half)', 'Seafood Special', 99, 'portions', 30000, 'Crab, prawns, sweet corn and potatoes in rich Cajun garlic butter broth (Half portion).', true, 13),
('restaurant', 'Seafood Boils (Full)', 'Seafood Special', 99, 'portions', 55000, 'Crab, prawns, calamari, sweet corn and potatoes in rich Cajun garlic butter broth (Full portion).', true, 13),

-- ── 14. PROTEINS ─────────────────────────────────────────────
('restaurant', 'Turkey',         'Proteins', 99, 'portions', 11500, null, true, 14),
('restaurant', 'Chicken',        'Proteins', 99, 'portions', 11500, null, true, 14),
('restaurant', 'Goat Meat',      'Proteins', 99, 'portions', 4000,  null, true, 14),
('restaurant', 'Panla Fish',     'Proteins', 99, 'portions', 3100,  null, true, 14),
('restaurant', 'Hake Fish',      'Proteins', 99, 'portions', 4100,  null, true, 14),
('restaurant', 'Snail',          'Proteins', 99, 'portions', 11500, null, true, 14),
('restaurant', 'Cow Meat',       'Proteins', 99, 'portions', 3000,  null, true, 14),
('restaurant', 'Peppered Snail', 'Proteins', 99, 'portions', 11500, null, true, 14),
('restaurant', 'Tilapia Fish',   'Proteins', 99, 'portions', 11300, null, true, 14),
('restaurant', 'Owene Fish',     'Proteins', 99, 'portions', 23500, null, true, 14),

-- ── 15. EXTRA SIDES ──────────────────────────────────────────
('restaurant', 'Plantain',                   'Extra Sides', 99, 'portions', 3500,  null, true, 15),
('restaurant', 'Moi-Moi',                    'Extra Sides', 99, 'portions', 3500,  null, true, 15),
('restaurant', 'French Fries',               'Extra Sides', 99, 'portions', 3500,  null, true, 15),
('restaurant', 'Steamed Rice',               'Extra Sides', 99, 'portions', 6500,  null, true, 15),
('restaurant', 'Yam Fries',                  'Extra Sides', 99, 'portions', 3500,  null, true, 15),
('restaurant', 'Coleslaw',                   'Extra Sides', 99, 'portions', 3500,  null, true, 15),
('restaurant', 'Jollof Rice (Side)',         'Extra Sides', 99, 'portions', 7500,  null, true, 15),
('restaurant', 'Fried Rice (Side)',          'Extra Sides', 99, 'portions', 7500,  null, true, 15),
('restaurant', 'Coconut Rice (Side)',         'Extra Sides', 99, 'portions', 7500,  null, true, 15),
('restaurant', 'Grilled Chicken & Plantain', 'Extra Sides', 99, 'portions', 7500,  null, true, 15),
('restaurant', 'Chicken & Chips',            'Extra Sides', 99, 'portions', 13500, null, true, 15),
('restaurant', 'Omelette',                   'Extra Sides', 99, 'portions', 7700,  null, true, 15),

-- ── 16. SWALLOWS EXTRA ───────────────────────────────────────
('restaurant', 'Pounded Yam', 'Swallows Extra', 99, 'portions', 3500, null, true, 16),
('restaurant', 'Amala',       'Swallows Extra', 99, 'portions', 3500, null, true, 16),
('restaurant', 'Semovita',    'Swallows Extra', 99, 'portions', 3500, null, true, 16),
('restaurant', 'Eba',         'Swallows Extra', 99, 'portions', 3500, null, true, 16),
('restaurant', 'Starch',      'Swallows Extra', 99, 'portions', 3500, null, true, 16);
