alter table genres enable row level security;
alter table movies enable row level security;
alter table reviews enable row level security;

drop policy if exists "Public can read genres" on genres;
create policy "Public can read genres"
on genres
for select
to anon, authenticated
using (true);

drop policy if exists "Public can read movies" on movies;
create policy "Public can read movies"
on movies
for select
to anon, authenticated
using (true);

drop policy if exists "Public can read reviews" on reviews;
create policy "Public can read reviews"
on reviews
for select
to anon, authenticated
using (true);

drop policy if exists "Public can add reviews" on reviews;
create policy "Public can add reviews"
on reviews
for insert
to anon, authenticated
with check (
    rating between 1 and 5
    and char_length(trim(reviewer_name)) between 1 and 50
    and (comment is null or char_length(comment) <= 500)
);

grant select on genres, movies, reviews to anon, authenticated;
grant insert on reviews to anon, authenticated;