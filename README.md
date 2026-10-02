# SpinClean

A hostel washing machine queue. Join from your phone, see who is next, stop walking to the laundry room to check.

Live: <your Netlify/Vercel URL>

> Rewrite every section below in your own words. The prompts in *italics* are hints, delete them.

## The annoyance
- *What happens in your hostel with the washing machine? (people leave clothes sitting, you walk down and it is busy, etc.)*
- *Who it annoys: you, your floor, how many people?*
- *How you know: you live it, you asked 2-3 friends.*

## My constraint: #7 Forgetful
- Everything is deleted after 24 hours, on purpose. A queue from yesterday is useless and nobody should keep a record of who did laundry when.
- Reads only ask for rows from the last 24 hours, so expired entries never show up.
- A `pg_cron` job in Supabase also deletes rows older than 24 hours every 15 minutes, so the data really is gone from the database.
- The UI says "Entries vanish after 24 hours" so it looks like a feature.
- *How did this change what you built? (e.g. no history page, no stats, no accounts.)*

## The great part
- *Pick ONE part you are proud of and say why. Example: the 24-hour deletion happens in two layers (query filter + scheduled delete), or the "Start washing" button only appears for the person who is actually next.*

## The two testers
- Tester 1: *where did they get stuck? what did you change?*
- Tester 2: *where did they get stuck? what did you change?*

## AI
- Used AI for: *what exactly (starter code, SQL, debugging...)*
- One thing it got wrong and I fixed: *be specific. Keep a note as you work so you have a real example.*

## Not done
- Only one machine. Multiple machines are not supported yet.
- Anyone can technically edit rows through the API, since there are no accounts. The "(you)" buttons are only hidden in the UI.
- Updates by polling every 10 seconds, not realtime.
- *Add anything else that is broken or missing.*

## Run it locally
1. Create a free project at supabase.com, then run `schema.sql` in the SQL Editor.
2. Enable the `pg_cron` extension before running the cron part.
3. In `index.html`, set `SUPABASE_URL` and `SUPABASE_ANON_KEY` (Project Settings > API).
4. Open `index.html` in a browser, or run `npx serve .`

Variable names used: `SUPABASE_URL`, `SUPABASE_ANON_KEY` (values are not committed).
