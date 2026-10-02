-- Run this in Supabase > SQL Editor

create table queue (
  id         uuid primary key default gen_random_uuid(),
  name       text not null check (char_length(name) between 1 and 30),
  status     text not null default 'waiting' check (status in ('waiting','washing')),
  started_at timestamptz,
  created_at timestamptz not null default now()
);

-- No accounts, so the public (anon) key may read and write this one table.
alter table queue enable row level security;
create policy "anyone can read"   on queue for select using (true);
create policy "anyone can add"    on queue for insert with check (true);
create policy "anyone can update" on queue for update using (true);
create policy "anyone can delete" on queue for delete using (true);

-- The 24-hour rule, enforced on the server:
-- 1) enable the extension: Supabase > Database > Extensions > pg_cron
-- 2) then run this to delete expired rows every 15 minutes
select cron.schedule(
  'delete-old-queue',
  '*/15 * * * *',
  $$ delete from queue where created_at < now() - interval '24 hours' $$
);
