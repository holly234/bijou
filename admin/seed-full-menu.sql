-- ================================================================
-- BIJOU Full Menu Seed
-- Run in Supabase → SQL Editor → New Query
-- This clears the old sample data and loads the real menu.
-- ================================================================

-- Clear existing seed data first
delete from public.inventory;

-- ================================================================
-- RESTAURANT ITEMS
-- ================================================================

insert into public.inventory (section, name, category, quantity, unit, price, notes) values

-- Signature Platters
('restaurant', '1911 Special Platter',    'Signature Platters', 99, 'portions', 62500,  'Spicy Chicken Wings (4), Spiced Turkey (4), Peppered Gizzard (4), Crispy Yam Fries, Sweet Plantain Fries & Bottled Water with House Signature Sauce.'),
('restaurant', '1911 Mega VIP Platter',   'Signature Platters', 99, 'portions', 121500, 'Chicken Wings (7), Turkey (7), Peppered Gizzard (10), Jumbo Snails (5), Crab (2), Jumbo Prawns (2), Yam Fries, Plantain Fries, Sweet Potato Chunks & 2 Soft Drinks.'),

-- Firewood Jollof & Rice
('restaurant', 'Firewood Delight',        'Firewood Jollof & Rice', 99, 'portions', 9750,  'Signature Smokey Firewood Jollof Rice, steamed Moi-Moi, sweet diced plantain, 2 succulent beef cuts & bottled water.'),
('restaurant', 'Jollof Reloaded',         'Firewood Jollof & Rice', 99, 'portions', 14250, 'Smokey Jollof, fresh Coleslaw, Moi-Moi, Plantain, Choice of 1 Hake or Panla Fish, 2 Beef cuts & bottled water.'),
('restaurant', 'Hot Pot Jollof',          'Firewood Jollof & Rice', 99, 'portions', 18750, 'Smokey Jollof Rice, Coleslaw, Moi-Moi, Plantain, 1 Spiced Turkey, 1 Fish, 1 Soft Drink & bottled water.'),
('restaurant', 'Royal Jollof Supreme',    'Firewood Jollof & Rice', 99, 'portions', 28750, 'Smokey Jollof, Coleslaw, Moi-Moi, Plantain, 1 Turkey, 1 Fish, 1 Crispy Chicken, 1 Beef, Soft Ponmo & 2 Drinks.'),
('restaurant', '1911 Special Basmati',    'Firewood Jollof & Rice', 99, 'portions', 28250, 'Fragrant Basmati Rice, Jumbo Prawns, garden vegetables, diced plantain, served with Choice of Turkey, Chicken or Fish.'),
('restaurant', 'Gourmet Fried Rice',      'Firewood Jollof & Rice', 99, 'portions', 11750, 'Golden Seasoned Fried Rice, Plantain, Moi-Moi, 2 Beef cuts, crisp Coleslaw & bottled water.'),
('restaurant', 'Aromatic Coconut Rice',   'Firewood Jollof & Rice', 99, 'portions', 16750, 'Creamy Coconut Rice with Rich Savory Sauce, 1 Boiled Egg, 1 Beef, 1 Ponmo, Panla Fish & bottled water.'),

-- Ofada & Native Stews
('restaurant', 'Ofada Bliss',             'Ofada & Native Stews', 99, 'portions', 7750,  'Aromatic Ofada Rice, plantain, boiled egg, 2 cuts assorted meat, ponmo & authentic Ayamase designer sauce.'),
('restaurant', 'Ofada Delight',           'Ofada & Native Stews', 99, 'portions', 12750, 'Ofada Rice, Stewed Honey Beans, Plantain, 1 Egg, 1 Ponmo, 1 Panla Fish, 2 Assorted Meat & bottled water.'),
('restaurant', 'Ofada Aladun',            'Ofada & Native Stews', 99, 'portions', 18250, 'Ofada Rice, Stewed Beans, Plantain, 2 Boiled Eggs, 1 Ponmo, 2 Assorted Meat, 1 Fish & 1 Soft Drink.'),
('restaurant', 'Ofada Olola Feast',       'Ofada & Native Stews', 99, 'portions', 28750, 'Premium Ofada Rice, Stewed Beans, Plantain, 2 Boiled Eggs, 3 Soft Ponmo, 2 Beef cuts, 2 Assorted Meat, Fish & Drinks.'),
('restaurant', 'Ewa Agonyin Royale',      'Ofada & Native Stews', 99, 'portions', 8750,  'Mashed Honey Beans drenched in dark caramelized Agonyin pepper sauce, fried plantain, Eja Kika (dry fish) & 2 Ponmo.'),

-- Amala & Swallows
('restaurant', 'Gbayi Amala Special',     'Amala & Swallows', 99, 'portions', 7250,  'Silky Hot Amala (3 Scoops), Gbegiri & Ewedu, 2 Assorted Meats, 2 Soft Ponmo & 1 bottled water.'),
('restaurant', 'Amuludun Amala Special',  'Amala & Swallows', 99, 'portions', 11250, 'Hot Amala (3 Scoops), Gbegiri/Ewedu, 1 Tender Cut of Goat Meat, 2 Ponmo & 2 Assorted Meat cuts.'),
('restaurant', 'Oga-Nla Amala Special',   'Amala & Swallows', 99, 'portions', 15250, 'Amala (4 Scoops), Gbegiri/Ewedu, 1 Goat Meat, 2 Soft Ponmo, 2 Assorted Meat, 1 Fish & 1 Soft Drink.'),
('restaurant', 'Olowo-Eko Grand Feast',   'Amala & Swallows', 99, 'portions', 24750, 'Amala (6 Generous Scoops), Gbegiri/Ewedu, 2 Goat Meat Cuts, 4 Soft Ponmo, 6 Assorted Meat Cuts & 2 Soft Drinks.'),

-- Gourmet Native Soups
('restaurant', 'Seafood Okro Royale',        'Gourmet Native Soups', 99, 'portions', 27500, 'Whole Crab, Jumbo Tiger Prawns, Tender Calamari, Fish cuts in crunchy garden Okro. Served with choice of Swallow.'),
('restaurant', 'Efo Riro Elemi Meje',        'Gourmet Native Soups', 99, 'portions', 12100, 'Rich Yoruba spinach soup with locust beans (iru), fried fish, cow meat, ponmo & native aromatics with Swallow.'),
('restaurant', 'Egusi with Vegetables',      'Gourmet Native Soups', 99, 'portions', 12100, 'Slow-fried melon seed soup enriched with bitterleaf/ugwu, fried fish and tender meats with Swallow.'),
('restaurant', 'Fisherman Soup (Niger Delta)','Gourmet Native Soups', 99, 'portions', 23500, 'Fresh catfish, fresh crab, prawns & sea mollusks in spicy aromatic coastal broth with choice of swallow.'),
('restaurant', 'Traditional Soups Selection','Gourmet Native Soups', 99, 'portions', 11000, 'Draw Ogbono (₦11,000) • Oha Soup (₦12,300) • Calabar Afang (₦12,300) • Edikaikong (₦12,000) • Ofe-Nsala (₦12,300).'),

-- Native Pepper Soups
('restaurant', 'Point & Kill Peppersoup',    'Native Pepper Soups', 99, 'portions', 46250, 'Fresh Live Fisherman Catfish or Whole Country Chicken in authentic herbal peppersoup broth with sweet potatoes or plantain.'),
('restaurant', 'Sea Food Pepper Soup',       'Native Pepper Soups', 99, 'portions', 27250, 'Fresh Crab, Fresh Fish, and Prawns simmered in peppery herbal broth with sweet potato chunks.'),
('restaurant', 'Goat Meat Pepper Soup',      'Native Pepper Soups', 99, 'portions', 12250, 'Tender cuts of fresh goat meat cooked in spicy traditional pepper soup broth with sweet potatoes.'),
('restaurant', 'Fresh Fish Pepper Soup',     'Native Pepper Soups', 99, 'portions', 17250, 'Fresh fish steak simmered in spicy broth with native herbs and potatoes. (Half Plate: ₦12,250).'),

-- Pastas & Fresh Salads
('restaurant', 'Creamy Italian Herb Pasta',  'Pastas & Fresh Salads', 99, 'portions', 21000, 'Rich garlic parmesan cream sauce, al dente penne pasta, herb seasoning and grilled protein cuts.'),
('restaurant', 'Stir-fry Spaghetti Special', 'Pastas & Fresh Salads', 99, 'portions', 19000, 'Spaghetti wok-tossed with peppers, carrots, prawns and chili oil. (Half: ₦11,000 • Spaghetti Jollof: ₦9,000).'),
('restaurant', 'Prawn Caesar Salad',         'Pastas & Fresh Salads', 99, 'portions', 14500, 'Jumbo prawns, diced chicken, crisp lettuce, tomatoes, parmesan, garlic croutons in creamy dressing.'),
('restaurant', 'Chicken Caesar Salad',       'Pastas & Fresh Salads', 99, 'portions', 8600,  'Grilled chicken breast strips, crisp romaine, parmesan, garlic croutons. (Coleslaw Bowl: ₦5,700).'),

-- Extra Proteins & Sides
('restaurant', 'A La Carte Extra Proteins',  'Extra Proteins & Sides', 99, 'portions', 3000,  'Peppered Snail (₦11,500) • Turkey (₦11,500) • Chicken (₦11,500) • Goat (₦4,000) • Beef (₦3,000) • Panla (₦3,100) • Hake (₦4,100) • Tilapia (₦11,300) • Giant Owene (₦23,500).'),
('restaurant', 'Swallows & Gourmet Sides',   'Extra Proteins & Sides', 99, 'portions', 3500,  'Pounded Yam • Amala • Semovita • Eba • Starch • Fried Plantain • Moi-Moi • French Fries • Yam Fries.'),

-- ================================================================
-- LOUNGE ITEMS
-- ================================================================

-- Prestige Cognac
('lounge', 'Rémy Martin XO',               'Prestige Cognac', 10, 'bottles', 195000, 'Supreme cellar master blend of up to 400 eaux-de-vie. Velvety ripe figs, candied plum and opulent finish. (Glass: ₦24,000).'),
('lounge', 'Martell Blue Swift',            'Prestige Cognac', 10, 'bottles', 98000,  'VSOP finished in Kentucky bourbon casks. Notes of caramelized apple, toasted oak, plum and subtle vanilla warmth. (Glass: ₦13,000).'),
('lounge', 'Hennessy V.S.O.P Privilège',   'Prestige Cognac', 10, 'bottles', 95000,  'Harmonious blend of 60 eaux-de-vie. Aromas of fresh vanilla, cinnamon, toasted brioche and balanced smoothness. (Glass: ₦12,500).'),
('lounge', 'Rémy Martin V.S.O.P',          'Prestige Cognac', 10, 'bottles', 90000,  'Fine Champagne Cognac with dominant notes of vanilla, toasted oak, ripe apricot and summer brioche. (Glass: ₦12,000).'),

-- Whiskies & Single Malts
('lounge', 'Johnnie Walker Black Label',    'Whiskies & Single Malts', 10, 'bottles', 55000,  '12-year blended Scotch icon. Rich dark fruits, sweet vanilla, and an unmistakable smooth peat smoke finish. (Glass: ₦7,500).'),
('lounge', 'Glenfiddich 15 Years Solera',  'Whiskies & Single Malts', 10, 'bottles', 110000, 'Matured in sherry, bourbon and new oak. Warm spice, honey, and rich marzipan. (18 Years: ₦165,000).'),
('lounge', 'The Macallan 12 Double Cask',  'Whiskies & Single Malts', 10, 'bottles', 185000, 'Highland single malt scotch with candied citrus, wood spice, honey and dried fruits.'),
('lounge', 'Jameson Black Barrel',          'Whiskies & Single Malts', 10, 'bottles', 48000,  'Double charred bourbon barrel finish. Rich vanilla sweetness, toasted wood, and dried fruit aromatics.'),

-- Signature Craft Cocktails
('lounge', 'Savor the Experience',          'Signature Craft Cocktails', 99, 'portions', 14000, 'Martell Blue Swift, fresh passionfruit cordial, citrus mist, bitters, sparkling prosecco & 24k edible gold dust.'),
('lounge', 'Elevate the Night',             'Signature Craft Cocktails', 99, 'portions', 12500, 'Hennessy VSOP, blackberry liqueur, fresh lemon juice, honey syrup, torched rosemary & dehydrated blood orange.'),
('lounge', 'Smoked Velvet Paloma',          'Signature Craft Cocktails', 99, 'portions', 11500, 'Artisanal Mezcal, pink grapefruit freshly squeezed, lime juice, agave nectar, Himalayan black salt rim.'),
('lounge', 'Midnight in Lagos Espresso',    'Signature Craft Cocktails', 99, 'portions', 12000, 'Vanilla vodka, fresh single-origin espresso extraction, Kahlúa coffee liqueur, dark chocolate dusting.'),
('lounge', 'Bijou Chapman Royale',          'Signature Craft Cocktails', 99, 'portions', 9500,  'The iconic Nigerian cocktail elevated: Campari, Angostura bitters, citrus medley, grenadine, cucumber ribbons & gin kick.'),

-- Prestige Champagnes
('lounge', 'Dom Pérignon Vintage',          'Prestige Champagnes', 5, 'bottles', 340000, 'The pinnacle of luxury champagne. Complex minerality, white blossoms, brioche, and extraordinary length.'),
('lounge', 'Moët & Chandon Impérial',       'Prestige Champagnes', 5, 'bottles', 145000, 'Golden straw yellow with vibrant bouquet of green apple, citrus, and toasted hazelnut elegance.'),
('lounge', 'Veuve Clicquot Yellow Label',   'Prestige Champagnes', 5, 'bottles', 160000, 'Pinot Noir dominance providing structure, complemented by Chardonnay and Meunier finesse.'),
('lounge', 'Luc Belaire Luxe',              'Prestige Champagnes', 5, 'bottles', 85000,  'French sparkling perfection in iconic gold bottle with notes of apricot, honeysuckle, and brioche.'),

-- Beers, Soft Drinks & Mixers
('lounge', 'Premium Cold Beers',            'Beers, Soft Drinks & Mixers', 99, 'bottles', 3500, 'Heineken • Budweiser • Corona Extra • Guinness Stout • Desperados.'),
('lounge', 'Soft Drinks & Bottled Water',   'Beers, Soft Drinks & Mixers', 99, 'bottles', 2000, 'Mineral Water (₦2,000) • Coca-Cola (₦2,500) • Pepsi • Maltina • Fanta • Sprite (₦2,500).'),
('lounge', 'Energy & Premium Mixers',       'Beers, Soft Drinks & Mixers', 99, 'bottles', 3500, 'Red Bull Energy (₦4,500) • Schweppes Indian Tonic (₦3,500) • Club Soda • Ginger Ale (₦3,500).');
