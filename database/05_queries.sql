-- Part A: Required Queries

-- Q1. Show all movies with their genre name
select
    m.title,
    m.release_year,
    g.name as genre
from movies m
join genres g on g.id = m.genre_id
order by m.id;


-- Q2. Count the number of movies in each genre
select
    g.name as genre,
    count(m.id) as movie_count
from genres g
left join movies m on m.genre_id = g.id
group by g.id, g.name
order by g.name;


-- Q3. Show the average rating for each movie
select
    m.title,
    round(avg(r.rating), 1) as avg_rating
from movies m
left join reviews r on r.movie_id = m.id
group by m.id, m.title
order by avg_rating desc nulls last, m.title;


-- Q4. Malayalam movies released after 2015
select
    title,
    release_year,
    language
from movies
where language = 'Malayalam'
  and release_year > 2015
order by release_year;


-- Q5. Movies with an average rating of 4.5 or higher
select
    m.title,
    round(avg(r.rating), 1) as avg_rating
from movies m
join reviews r on r.movie_id = m.id
group by m.id, m.title
having avg(r.rating) >= 4.5
order by avg_rating desc, m.title;


-- Q6. Movies with no reviews
select
    m.title
from movies m
left join reviews r on r.movie_id = m.id
where r.id is null
order by m.title;


-- Q7. Find the longest movie
select
    title,
    duration_min
from movies
order by duration_min desc
limit 1;


-- Q8. Update the description of Interstellar
update movies
set description = 'Astronauts travel through a wormhole to find a new home for humanity.'
where title = 'Interstellar';




-- Part B: Additional Queries

-- 1. Show all reviews with the movie title
select
    m.title,
    r.reviewer_name,
    r.rating,
    r.comment
from reviews r
join movies m on m.id = r.movie_id
order by m.title, r.id;


-- 2. Count movies by language
select
    language,
    count(*) as movie_count
from movies
group by language
order by language;


-- 3. Find the newest movie
select
    title,
    release_year
from movies
order by release_year desc
limit 1;


-- 4. Find movies whose title starts with M
select
    title
from movies
where title like 'M%'
order by title;


-- 5. Show reviews before deleting one
select
    r.id,
    m.title,
    r.reviewer_name,
    r.rating,
    r.comment
from reviews r
join movies m on m.id = r.movie_id
order by r.id;