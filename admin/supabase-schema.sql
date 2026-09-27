-- ================================================================
-- BIJOU Inventory – Supabase Schema
-- Run this in your Supabase project:
--   Dashboard → SQL Editor → New Query → paste & run
-- ================================================================

-- Enable UUID generation
create extension if not exists "pgcrypto";

-- ── Main inventory table ─────────────────────────────────────────
create table if not exists public.inventory (
  id          uuid        primary key default gen_random_uuid(),
  section     text        not null check (section in ('restaurant', 'lounge')),
  name        text        not null,
  category    text        not null,
  quantity    integer     not null default 0 check (quantity >= 0),
  unit        text        not null default 'pieces',
  price       numeric(10, 2),
  notes       text,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- ── Indexes ──────────────────────────────────────────────────────
create index if not exists idx_inventory_section   on public.inventory (section);
create index if not exists idx_inventory_category  on public.inventory (section, category);

-- ── Row Level Security ────────────────────────────────────────────
-- The admin page uses the anon key. For now we allow full access.
-- When you add Supabase Auth, replace the policies below with
-- auth.uid()-based checks so only logged-in staff can write.

alter table public.inventory enable row level security;

-- Allow anon read (needed for the public-facing menu pages if you ever
-- query inventory there; you can remove this if you only read from admin)
create policy "Public read"
  on public.inventory for select
  using (true);

-- Allow anon insert / update / delete (admin panel uses anon key)
-- ⚠️  IMPORTANT: Before going live, lock this down by:
--   1. Enabling Supabase Auth in the admin panel (see admin.js)
--   2. Replacing `using (true)` below with `using (auth.uid() is not null)`
create policy "Admin write"
  on public.inventory for all
  using (true)
  with check (true);

-- ── Seed data (optional – delete if not needed) ──────────────────
insert into public.inventory (section, name, category, quantity, unit, price) values
  ('restaurant', 'Firewood Jollof Rice',    'Main Course',  12, 'portions', 6500),
  ('restaurant', 'Peppered Snail',          'Special Platter', 8, 'portions', 9500),
  ('restaurant', 'Gourmet Pepper Soup',     'Soups',         6, 'portions', 5500),
  ('restaurant', 'Grilled Tilapia',         'Main Course',  10, 'portions', 8000),
  ('lounge',     'Hennessy VS',             'Cognac',        5, 'bottles', 45000),
  ('lounge',     'Moët & Chandon Brut',     'Champagne',     3, 'bottles', 55000),
  ('lounge',     'Signature Bijou Cocktail','Cocktails',    20, 'portions', 7500),
  ('lounge',     'Martell VSOP',            'Cognac',        4, 'bottles', 38000)
on conflict do nothing;
