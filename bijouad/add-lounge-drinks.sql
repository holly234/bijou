-- ============================================================
-- Bijou Lounge — Complete Drinks Menu
-- Follows the exact booklet order and prices from the images
-- Paste into Supabase → SQL Editor → Run
-- ============================================================

-- Ensure sort_order column exists
alter table public.inventory add column if not exists sort_order integer not null default 99;

-- Clear previous lounge drinks to eliminate all duplicates and outdated items
delete from public.inventory where section = 'lounge';

-- Insert fresh drinks menu in exact visual order
insert into public.inventory (section, name, category, quantity, unit, price, notes, available, sort_order) values

-- ════════════════════════════════════════════════════════════
-- PAGE 1
-- ════════════════════════════════════════════════════════════

-- ── SOFT DRINKS AND YOGHURT ─────────────────────────────────
('lounge', 'Malta Guinness',    'Soft Drinks & Yoghurt', 99, 'bottles', 1000, null, true, 1),
('lounge', 'Fayrouz',           'Soft Drinks & Yoghurt', 99, 'bottles', 1000, null, true, 1),
('lounge', 'Maltina',           'Soft Drinks & Yoghurt', 99, 'bottles', 1000, null, true, 1),
('lounge', 'Coke',              'Soft Drinks & Yoghurt', 99, 'bottles', 1000, null, true, 1),
('lounge', 'Fanta',             'Soft Drinks & Yoghurt', 99, 'bottles', 1000, null, true, 1),
('lounge', 'Sprite',            'Soft Drinks & Yoghurt', 99, 'bottles', 1000, null, true, 1),
('lounge', 'Tiger Nut',         'Soft Drinks & Yoghurt', 99, 'bottles', 2000, null, true, 1),
('lounge', 'Nutri Milk',        'Soft Drinks & Yoghurt', 99, 'bottles', 1500, null, true, 1),
('lounge', 'Coke Big',          'Soft Drinks & Yoghurt', 99, 'bottles', 2000, null, true, 1),
('lounge', 'Hollandia Big',     'Soft Drinks & Yoghurt', 99, 'bottles', 3500, null, true, 1),
('lounge', 'Hollandia Small',   'Soft Drinks & Yoghurt', 99, 'bottles', 1500, null, true, 1),
('lounge', 'Water',             'Soft Drinks & Yoghurt', 99, 'bottles', 1000, null, true, 1),

-- ── COGNAC DRINK ────────────────────────────────────────────
('lounge', 'Hennessy VSOP',     'Cognac Drink', 99, 'bottles', 120000, null, true, 2),
('lounge', 'Martel VS',         'Cognac Drink', 99, 'bottles', 80000,  null, true, 2),
('lounge', 'Hennessy VS',       'Cognac Drink', 99, 'bottles', 100000, null, true, 2),
('lounge', 'Martel VSOP',       'Cognac Drink', 99, 'bottles', 100000, null, true, 2),

-- ── JUICE ───────────────────────────────────────────────────
('lounge', '5 Alive Pulpy',     'Juice', 99, 'bottles', 2000, null, true, 3),
('lounge', 'Chi Exotic',        'Juice', 99, 'bottles', 3500, null, true, 3),
('lounge', 'Chi Active',        'Juice', 99, 'bottles', 3500, null, true, 3),

-- ── CAN DRINK ───────────────────────────────────────────────
('lounge', 'Black Bullet',      'Can Drink', 99, 'cans', 2500, null, true, 4),
('lounge', 'Maltina Can',       'Can Drink', 99, 'cans', 1000, null, true, 4),
('lounge', 'Smirnoff Ice Can',  'Can Drink', 99, 'cans', 1500, null, true, 4),
('lounge', 'Chi Exotic Can',    'Can Drink', 99, 'cans', 1500, null, true, 4),
('lounge', 'Chi Active Can',    'Can Drink', 99, 'cans', 1500, null, true, 4),
('lounge', 'Veleta Can',        'Can Drink', 99, 'cans', 1500, null, true, 4),
('lounge', 'Desperado Can',     'Can Drink', 99, 'cans', 1500, null, true, 4),

-- ════════════════════════════════════════════════════════════
-- PAGE 2
-- ════════════════════════════════════════════════════════════

-- ── BEER ────────────────────────────────────────────────────
('lounge', 'Big Stout',            'Beer', 99, 'bottles', 2500, null, true, 5),
('lounge', 'Medium Stout',         'Beer', 99, 'bottles', 2000, null, true, 5),
('lounge', 'Small Stout',          'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Heineken',             'Beer', 99, 'bottles', 2000, null, true, 5),
('lounge', 'Star Radler',          'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Desperado',            'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', '"33" Export',          'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Goldberg',             'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Black Goldberg',       'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Gulder',               'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Tiger Beer',           'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Legend',               'Beer', 99, 'bottles', 2000, null, true, 5),
('lounge', 'Trophy',               'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Budweiser',            'Beer', 99, 'bottles', 2000, null, true, 5),
('lounge', 'Lite',                 'Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Smirnoff Ice Big',     'Beer', 99, 'bottles', 2000, null, true, 5),
('lounge', 'Smirnoff Double Black','Beer', 99, 'bottles', 1500, null, true, 5),
('lounge', 'Origin Beer',          'Beer', 99, 'bottles', 1500, null, true, 5),

-- ── GIN ─────────────────────────────────────────────────────
('lounge', 'Lord''s Gin',          'Gin', 99, 'bottles', 20000, null, true, 6),
('lounge', 'Gordon''s Gin Small',  'Gin', 99, 'bottles', 4500,  null, true, 6),

-- ── WINE ────────────────────────────────────────────────────
('lounge', 'Four Cousins',         'Wine', 99, 'bottles', 20000, null, true, 7),
('lounge', 'Expression',           'Wine', 99, 'bottles', 10000, null, true, 7),
('lounge', 'Status',               'Wine', 99, 'bottles', 10000, null, true, 7),
('lounge', 'Veleta',               'Wine', 99, 'bottles', 15000, null, true, 7),
('lounge', 'Baron',                'Wine', 99, 'bottles', 15000, null, true, 7),
('lounge', 'Carlorossi',           'Wine', 99, 'bottles', 35000, null, true, 7),
('lounge', 'Blue Rum',             'Wine', 99, 'bottles', 20000, null, true, 7),
('lounge', 'Drostdy Hof',          'Wine', 99, 'bottles', 15000, null, true, 7),

-- ════════════════════════════════════════════════════════════
-- PAGE 3
-- ════════════════════════════════════════════════════════════

-- ── VODKA ───────────────────────────────────────────────────
('lounge', 'Magic Moment',         'Vodka', 99, 'bottles', 15000, null, true, 8),
('lounge', 'Smirnoff X1 Medium',   'Vodka', 99, 'bottles', 4500,  null, true, 8),
('lounge', 'Smirnoff X1 Big',      'Vodka', 99, 'bottles', 10000, null, true, 8),
('lounge', 'Ciroc',                'Vodka', 99, 'bottles', 60000, null, true, 8),
('lounge', 'Gordon Small',         'Vodka', 99, 'bottles', 4500,  null, true, 8),
('lounge', 'Elliot',               'Vodka', 99, 'bottles', 25000, null, true, 8),

-- ── CHAMPAGNE ───────────────────────────────────────────────
('lounge', 'Belaire Rose',         'Champagne', 99, 'bottles', 90000, null, true, 9),

-- ── TEQUILA ─────────────────────────────────────────────────
('lounge', 'Sierra Tequila',       'Tequila', 99, 'bottles', 45000, null, true, 10),
('lounge', 'Sierra Olmeca',        'Tequila', 99, 'bottles', 50000, null, true, 10),
('lounge', 'Jager Monster',        'Tequila', 99, 'bottles', 30000, null, true, 10),

-- ── MOCKTAILS ───────────────────────────────────────────────
('lounge', 'Chapman',              'Mocktails', 99, 'glasses', 7000, null, true, 11),
('lounge', 'Sweet Sunrise',        'Mocktails', 99, 'glasses', 7000, null, true, 11),
('lounge', 'Fruit Punch',          'Mocktails', 99, 'glasses', 7000, null, true, 11),
('lounge', 'Smoothie',             'Mocktails', 99, 'glasses', 7000, null, true, 11),
('lounge', 'Virgin Colada',        'Mocktails', 99, 'glasses', 7000, null, true, 11),
('lounge', 'Virgin Daiquiri',      'Mocktails', 99, 'glasses', 7000, null, true, 11),

-- ── COCKTAILS ───────────────────────────────────────────────
('lounge', 'Pina Colada',          'Cocktails', 99, 'glasses', 8000, null, true, 12),
('lounge', 'Tequila Sunrise',      'Cocktails', 99, 'glasses', 8000, null, true, 12),
('lounge', 'Daiquiri',             'Cocktails', 99, 'glasses', 8000, null, true, 12),
('lounge', 'Long Island Ice Tea',  'Cocktails', 99, 'glasses', 8000, null, true, 12),
('lounge', 'Sex on the Beach',     'Cocktails', 99, 'glasses', 8000, null, true, 12),
('lounge', 'Royal Modak Milkshake','Cocktails', 99, 'glasses', 8000, null, true, 12),

-- ════════════════════════════════════════════════════════════
-- PAGE 4
-- ════════════════════════════════════════════════════════════

-- ── BITTERS DRINK ───────────────────────────────────────────
('lounge', 'Origin Bitters',       'Bitters Drink', 99, 'bottles', 2000, null, true, 13),
('lounge', 'Ace Bitters',          'Bitters Drink', 99, 'bottles', 1500, null, true, 13),
('lounge', 'Action Bitter',        'Bitters Drink', 99, 'bottles', 1500, null, true, 13),

-- ── SPARKLING WINE ──────────────────────────────────────────
('lounge', 'Andre Rose',           'Sparkling Wine', 99, 'bottles', 20000, null, true, 14),
('lounge', 'Dominio Rose',         'Sparkling Wine', 99, 'bottles', 25000, null, true, 14),
('lounge', 'Joven',                'Sparkling Wine', 99, 'bottles', 25000, null, true, 14),
('lounge', '4th Street',           'Sparkling Wine', 99, 'bottles', 20000, null, true, 14),
('lounge', 'Cape More',            'Sparkling Wine', 99, 'bottles', 7000,  null, true, 14),

-- ── ENERGY DRINKS ───────────────────────────────────────────
('lounge', 'Monster',              'Energy Drinks', 99, 'cans', 2500, null, true, 15),
('lounge', 'Fearless',             'Energy Drinks', 99, 'cans', 1000, null, true, 15),
('lounge', 'Predator',             'Energy Drinks', 99, 'cans', 1500, null, true, 15),
('lounge', 'Commando',             'Energy Drinks', 99, 'cans', 1500, null, true, 15),
('lounge', 'Climax Plastic',       'Energy Drinks', 99, 'bottles', 1500, null, true, 15),

-- ── WHISKY DRINKS ───────────────────────────────────────────
('lounge', 'Jameson Green',        'Whisky Drinks', 99, 'bottles', 40000, null, true, 16),
('lounge', 'Jameson Black Barrel', 'Whisky Drinks', 99, 'bottles', 50000, null, true, 16),
('lounge', 'William Lawson',       'Whisky Drinks', 99, 'bottles', 25000, null, true, 16),
('lounge', 'Best Whiskey Big',     'Whisky Drinks', 99, 'bottles', 10000, null, true, 16),
('lounge', 'Best Whiskey Small',   'Whisky Drinks', 99, 'bottles', 2500,  null, true, 16),
('lounge', 'Imperial Blue',        'Whisky Drinks', 99, 'bottles', 15000, null, true, 16),
('lounge', 'Red Label',            'Whisky Drinks', 99, 'bottles', 35000, null, true, 16),
('lounge', 'Jack Daniels',         'Whisky Drinks', 99, 'bottles', 60000, null, true, 16),
('lounge', 'Mack Old Level',       'Whisky Drinks', 99, 'bottles', 15000, null, true, 16),
('lounge', 'Campari',              'Whisky Drinks', 99, 'bottles', 10000, null, true, 16);
