-- ============================================================
-- Bijou Restaurant Menu — Chef'u Bistro & 19.11
-- Categories match exactly as shown in the original menus
-- Paste into Supabase → SQL Editor → Run
-- ============================================================

insert into public.inventory (section, name, category, quantity, unit, price, notes, available) values

-- ════════════════════════════════════════════════════════════
-- IMAGE 1 — CHEF'U BISTRO MENU
-- ════════════════════════════════════════════════════════════

-- ── AMALA & SWALLOWS ─────────────────────────────────────────
('restaurant', 'Gbayi',    'Swallow', 99, 'portions', 7250,  'Amala (3 Scoops), Gbegiri/Ewedu, 2 Assorted, 2 Ponmo & 1 Bottle Water.', true),
('restaurant', 'Amuludun', 'Swallow', 99, 'portions', 11250, 'Amala (3 Scoops), Gbegiri/Ewedu, 1 Goat Meat, 2 Ponmo, 2 Assorted & 1 Bottle Water.', true),
('restaurant', 'Oga-Nla',  'Swallow', 99, 'portions', 15250, 'Amala (4 Scoops), Gbegiri/Ewedu, 1 Goat Meat, 2 Ponmo, 2 Assorted, 1 Fish, 1 Soft Drink & 1 Water.', true),
('restaurant', 'Olowo-Eko','Swallow', 99, 'portions', 24750, 'Amala (6 Scoops), Gbegiri/Ewedu, 4 Ponmo, 6 Assorted, 2 Soft Drinks & 2 Waters.', true),

-- ── BEANS ────────────────────────────────────────────────────
('restaurant', 'Ewa Agonyin Royale', 'Beans', 99, 'portions', 8750, 'Ewa Agonyin, Plantain, Eja Kika, 2 Ponmo & 1 Bottle Water.', true),

-- ── OFADA DISHES ─────────────────────────────────────────────
('restaurant', 'Ofada Bliss',   'Ofada Dishes', 99, 'portions', 7750,  'Ofada, Plantain, Egg, 2 Assorted, 1 Ponmo & 1 Bottle Water.', true),
('restaurant', 'Ofada Delight', 'Ofada Dishes', 99, 'portions', 12750, 'Ofada, Beans (Optional), Plantain, 1 Egg, 1 Ponmo, 1 Panla Fish, 2 Assorted & 1 Bottle Water.', true),
('restaurant', 'Ofada Aladun',  'Ofada Dishes', 99, 'portions', 18250, 'Ofada, Beans (Optional), Plantain, 2 Boiled Eggs, 1 Ponmo, 2 Assorted, 1 Hake or Panla Fish, 1 Bottle Water & 1 Soft Drink.', true),
('restaurant', 'Ofada Olola',   'Ofada Dishes', 99, 'portions', 28750, 'Ofada, Beans, Plantain, 2 Boiled Eggs, 3 Ponmo, 2 Beef, 2 Assorted, Hake or Panla Fish, 1 Soft Drink & 1 Bottle Water.', true),

-- ── FIREWOOD JOLLOF ──────────────────────────────────────────
('restaurant', 'Firewood Delight', 'Firewood Jollof', 99, 'portions', 9750,  'Smokey Jollof, Moi-Moi, Plantain (1 portion), 2 Beef & 1 Bottle Water.', true),
('restaurant', 'Jollof Reloaded',  'Firewood Jollof', 99, 'portions', 14250, 'Smokey Jollof, Coleslaw, Moi-Moi, Plantain (1 Portion), 1 Hake or Panla Fish, 2 Beef & 1 Bottle Water.', true),
('restaurant', 'Hot Pot Jollof',   'Firewood Jollof', 99, 'portions', 18750, 'Smokey Jollof, Coleslaw, Moi-Moi, Plantain, 1 Turkey, 1 Hake or Panla Fish, 1 Soft Drink & 1 Bottle Water.', true),
('restaurant', 'Royal Jollof',     'Firewood Jollof', 99, 'portions', 28750, 'Smokey Jollof, Coleslaw, Moi-Moi, Plantain, 1 Turkey, 1 Hake or Panla Fish, 1 Chicken, 1 Beef, 1 Ponmo, 2 Soft Drinks & 2 Bottle Water.', true),

-- ── RICE & PORRIDGE ──────────────────────────────────────────
('restaurant', 'Fried Rice',          'Rice & Porridge', 99, 'portions', 11750, 'Fried Rice, Plantain, Moi-Moi, 2 Beef, 1 Coleslaw & 1 Bottle Water.', true),
('restaurant', 'Classic Porridge',    'Rice & Porridge', 99, 'portions', 14600, 'Porridge, Steamed Vegetable, Beef, Eja Kika & 1 Bottle Water.', true),
('restaurant', 'Coconut Rice',        'Rice & Porridge', 99, 'portions', 16750, 'Coconut Rice with Sauce, 1 Egg, 1 Beef, 1 Ponmo, Panla Fish & 1 Bottle Water.', true),
('restaurant', '1911 Special Signature', 'Rice & Porridge', 99, 'portions', 28250, 'Basmati Rice, Prawn, Vegetables, Plantain, Turkey or Chicken or Fish.', true),

-- ── PASTA ────────────────────────────────────────────────────
('restaurant', 'Stir-fry Spaghetti (Full)',  'Pasta', 99, 'portions', 19000, 'Full plate stir-fried spaghetti.', true),
('restaurant', 'Stir-fry Spaghetti (Half)',  'Pasta', 99, 'portions', 11000, 'Half plate stir-fried spaghetti.', true),
('restaurant', 'Creamy Pasta',               'Pasta', 99, 'portions', 21000, 'Rich and creamy pasta.', true),
('restaurant', 'Spaghetti Jollof',           'Pasta', 99, 'portions', 9000,  'Nigerian-style jollof spaghetti.', true),

-- ── PEPPER SOUPS ─────────────────────────────────────────────
('restaurant', 'Fish Pepper Soup (Full)',    'Pepper Soups', 99, 'portions', 17250, 'Fish cooked with Pepper Soup Mix, Aromatics, Chunks of Sweet Potatoes or Unripe Plantain.', true),
('restaurant', 'Fish Pepper Soup (Half)',    'Pepper Soups', 99, 'portions', 12250, 'Fish cooked with Pepper Soup Mix, Aromatics, Chunks of Sweet Potatoes or Unripe Plantain.', true),
('restaurant', 'Goat Meat Pepper Soup',     'Pepper Soups', 99, 'portions', 12250, 'Goat Meat cooked with Pepper Soup Mix, Aromatics, Chunks of Sweet Potatoes or Unripe Plantain.', true),
('restaurant', 'Seafood Pepper Soup',       'Pepper Soups', 99, 'portions', 27250, 'Seafood, Crab, Fresh Fish cooked with Pepper Soup Mix & Aromatics.', true),
('restaurant', 'Point and Kill Peppersoup', 'Pepper Soups', 99, 'portions', 46250, 'Live Full Chicken cooked with Peppersoup Mix, Aromatics, Chunks of Sweet Potatoes or Unripe Plantain.', true),

-- ════════════════════════════════════════════════════════════
-- IMAGE 2 — 19.11 MENU
-- ════════════════════════════════════════════════════════════

-- ── 1911 SPECIAL PLATTER ────────────────────────────────────
('restaurant', '1911 Special Platter (Small)', '1911 Special Platter', 99, 'portions', 62500,  'Spicy Chicken Wings x4, Turkey x4, Gizzard x4, Yam Fries, Plantain Fries & 1 Bottle Water. Served with our Signature Sauce.', true),
('restaurant', '1911 Special Platter (Large)', '1911 Special Platter', 99, 'portions', 121500, 'Chicken Wings x7, Turkey x7, Gizzard x10, Snail x5, Crab x2, Prawn x2, Yam Fries, Plantain Fries, Sweet Potato, 2 Soft Drinks & 1 Bottle Water.', true),

-- ── SALADS ───────────────────────────────────────────────────
('restaurant', 'Coleslaw Bowl',        'Salads', 99, 'portions', 5700,  'Cabbage, Carrot, Mixed with Mayonnaise Vinegar, Sugar & Salt.', true),
('restaurant', 'Chicken Caesar Salad', 'Salads', 99, 'portions', 8600,  'Lettuce, Diced Chicken, Carrot, Fresh Tomatoes, Cheese, Garlic, Mixed with Mayonnaise Vinegar, Sugar & Salt.', true),
('restaurant', 'Prawn Caesar Salad',   'Salads', 99, 'portions', 14500, 'Prawn, Diced Chicken, Carrot, Fresh Tomatoes, Cheese, Garlic, Mixed with Mayonnaise Vinegar, Sugar & Salt.', true),

-- ── SOUPS & STEWS ────────────────────────────────────────────
('restaurant', 'Seafood Okro',          'Soups & Stews', 99, 'portions', 27500, 'Fish, Crab, Prawns, Vegetables, Calamari. Served with Swallow of your Choice.', true),
('restaurant', 'Efo Riro',              'Soups & Stews', 99, 'portions', 12100, 'Efo Riro, Palmoil, Pepper Mix, Locust Beans, Fried Fish. Served with Swallow of your Choice.', true),
('restaurant', 'Egusi with Vegetables', 'Soups & Stews', 99, 'portions', 12100, 'Egusi, Vegetables, Pepper Mix, Locust Beans, Fried Fish. Served with Swallow of your Choice.', true),

-- ── SOUP VARIETIES ───────────────────────────────────────────
('restaurant', 'Ogbono Soup',    'Soup Varieties', 99, 'portions', 11000, 'Served with Swallow of your Choice.', true),
('restaurant', 'Oha Soup',       'Soup Varieties', 99, 'portions', 12300, 'Served with Swallow of your Choice.', true),
('restaurant', 'Afang Soup',     'Soup Varieties', 99, 'portions', 12300, 'Served with Swallow of your Choice.', true),
('restaurant', 'Edikaikong',     'Soup Varieties', 99, 'portions', 12000, 'Served with Swallow of your Choice.', true),
('restaurant', 'Ofensala',       'Soup Varieties', 99, 'portions', 12300, 'Served with Swallow of your Choice.', true),
('restaurant', 'Fisherman Soup', 'Soup Varieties', 99, 'portions', 23500, 'Served with Swallow of your Choice.', true),

-- ── SOUPS (BY THE LITRE) ─────────────────────────────────────
('restaurant', 'Chicken Soup (1 Litre)',      'Soups by the Litre', 99, 'portions', 31500, '1 Litre.', true),
('restaurant', 'Turkey Soup (1 Litre)',       'Soups by the Litre', 99, 'portions', 46500, '1 Litre.', true),
('restaurant', 'Beef Soup (1 Litre)',         'Soups by the Litre', 99, 'portions', 29500, '1 Litre.', true),
('restaurant', 'Fish Soup (1 Litre)',         'Soups by the Litre', 99, 'portions', 36500, '1 Litre.', true),
('restaurant', 'Ogbono Soup (1 Litre)',       'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true),
('restaurant', 'Oha Soup (1 Litre)',          'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true),
('restaurant', 'Efo Riro Soup (1 Litre)',     'Soups by the Litre', 99, 'portions', 26500, '1 Litre.', true),
('restaurant', 'Efo Elegusi Soup (1 Litre)',  'Soups by the Litre', 99, 'portions', 26500, '1 Litre.', true),
('restaurant', 'Afang Soup (1 Litre)',        'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true),
('restaurant', 'Edikaikong Soup (1 Litre)',   'Soups by the Litre', 99, 'portions', 31500, '1 Litre.', true),
('restaurant', 'Ofe-Nsala Soup (1 Litre)',    'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true),
('restaurant', 'Gbegiri Soup (1 Litre)',      'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true),
('restaurant', 'Ewedu Soup (1 Litre)',        'Soups by the Litre', 99, 'portions', 28500, '1 Litre.', true),

-- ── SAUCE ────────────────────────────────────────────────────
('restaurant', 'Ofada Sauce with Protein (1L)',   'Sauce', 99, 'portions', 37500, '1 Litre of Ofada Sauce with Protein.', true),
('restaurant', 'Agonyin Sauce (1L)',               'Sauce', 99, 'portions', 17500, '1 Litre of Agonyin Sauce.', true),
('restaurant', 'Agonyin Sauce with Protein (1L)', 'Sauce', 99, 'portions', 27500, '1 Litre of Agonyin Sauce with Protein.', true),

-- ── PROTEINS ─────────────────────────────────────────────────
('restaurant', 'Turkey',         'Proteins', 99, 'portions', 11500, null, true),
('restaurant', 'Chicken',        'Proteins', 99, 'portions', 11500, null, true),
('restaurant', 'Goat Meat',      'Proteins', 99, 'portions', 4000,  null, true),
('restaurant', 'Panla Fish',     'Proteins', 99, 'portions', 3100,  null, true),
('restaurant', 'Hake Fish',      'Proteins', 99, 'portions', 4100,  null, true),
('restaurant', 'Snail',          'Proteins', 99, 'portions', 11500, null, true),
('restaurant', 'Cow Meat',       'Proteins', 99, 'portions', 3000,  null, true),
('restaurant', 'Peppered Snail', 'Proteins', 99, 'portions', 11500, null, true),
('restaurant', 'Tilapia Fish',   'Proteins', 99, 'portions', 11300, null, true),
('restaurant', 'Owene Fish',     'Proteins', 99, 'portions', 23500, null, true),

-- ── FOOD ADD ON ──────────────────────────────────────────────
('restaurant', 'Seafood Boils (Half)',                 'Food Add On', 99, 'portions', 30000, null, true),
('restaurant', 'Seafood Boils (Full)',                 'Food Add On', 99, 'portions', 55000, null, true),
('restaurant', 'Native Rice',                          'Food Add On', 99, 'portions', 14700, null, true),
('restaurant', 'Asun Rice',                            'Food Add On', 99, 'portions', 21750, null, true),
('restaurant', 'Noodle with Veggies, Eggs & Protein',  'Food Add On', 99, 'portions', 15750, '2 Eggs, Fish or 2 Beef.', true),
('restaurant', 'Singapore Noodles',                    'Food Add On', 99, 'portions', 26000, null, true),
('restaurant', 'Goat Meat Stew',                       'Food Add On', 99, 'portions', 25350, null, true),

-- ── EXTRA ────────────────────────────────────────────────────
('restaurant', 'Plantain',                   'Extra', 99, 'portions', 3500,  null, true),
('restaurant', 'Moi-Moi',                    'Extra', 99, 'portions', 3500,  null, true),
('restaurant', 'French Fries',               'Extra', 99, 'portions', 3500,  null, true),
('restaurant', 'Steamed Rice',               'Extra', 99, 'portions', 6500,  null, true),
('restaurant', 'Yam Fries',                  'Extra', 99, 'portions', 3500,  null, true),
('restaurant', 'Coleslaw',                   'Extra', 99, 'portions', 3500,  null, true),
('restaurant', 'Jollof Rice',                'Extra', 99, 'portions', 7500,  null, true),
('restaurant', 'Fried Rice',                 'Extra', 99, 'portions', 7500,  null, true),
('restaurant', 'Coconut Rice (Side)',         'Extra', 99, 'portions', 7500,  null, true),
('restaurant', 'Grilled Chicken & Plantain', 'Extra', 99, 'portions', 7500,  null, true),
('restaurant', 'Chicken & Chips',            'Extra', 99, 'portions', 13500, null, true),
('restaurant', 'Omelette',                   'Extra', 99, 'portions', 7700,  null, true),

-- ── SWALLOWS EXTRA ───────────────────────────────────────────
('restaurant', 'Pounded Yam', 'Swallows Extra', 99, 'portions', 3500, null, true),
('restaurant', 'Amala',       'Swallows Extra', 99, 'portions', 3500, null, true),
('restaurant', 'Semovita',    'Swallows Extra', 99, 'portions', 3500, null, true),
('restaurant', 'Eba',         'Swallows Extra', 99, 'portions', 3500, null, true),
('restaurant', 'Starch',      'Swallows Extra', 99, 'portions', 3500, null, true),

-- ── DRINKS (Restaurant) ──────────────────────────────────────
('restaurant', 'Water',   'Drinks', 99, 'bottles', 2000, null, true),
('restaurant', 'Coke',    'Drinks', 99, 'bottles', 2500, null, true),
('restaurant', 'Pepsi',   'Drinks', 99, 'bottles', 2500, null, true),
('restaurant', 'Fanta',   'Drinks', 99, 'bottles', 2500, null, true),
('restaurant', 'Maltina', 'Drinks', 99, 'bottles', 2500, null, true),
('restaurant', 'Sprite',  'Drinks', 99, 'bottles', 2500, null, true);
