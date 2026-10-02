# SpinClean

A hostel washing machine queue. Join from your phone, see who is next, stop walking to the laundry room to check.

Live: https://spinclean.vercel.app/

## The annoyance
- people leave clothes sitting
- a person may find the machine busy after walking down multiple floors repeatedly
- 65 people relying on a single washing machine
- have been experiencing it myself

## My constraint: #7 Forgetful
- Everything is deleted after 24 hours, on purpose. A queue from yesterday is useless and nobody should keep a record of who did laundry when.
- Reads only ask for rows from the last 24 hours, so expired entries never show up.
- A `pg_cron` job in Supabase also deletes rows older than 24 hours every 15 minutes, so the data really is gone from the database.
- The UI says "Entries vanish after 24 hours" so it looks like a feature.

## The great part
- start washing button appears only for the person who is first in the queue
- the UI

## The two testers
- Tester 1: asked about what happens if the person first queue is done and hasn't updated
- Tester 2: asked how the people in queue get to know it's their turn

## AI
- Used AI for: for starter code, sql query

## Not done
- notification alert
- Updates by polling every 10 seconds, not realtime.
- notifying on the days when the machine stays closed
- automatic removal of the person who has finished
