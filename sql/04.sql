/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */

SELECT act.first_name, act.last_name
FROM (select actor.first_name, actor.last_name
from actor
join film_actor using(actor_id)
join film using(film_id)
join film_category using(film_id)
join category using (category_id)
WHERE name = 'Children') act
WHERE (act.first_name, act.last_name) NOT IN (select actor.first_name, actor.last_name
from actor
join film_actor using(actor_id)
join film using(film_id)
join film_category using(film_id)
join category using (category_id)
WHERE name = 'Horror') GROUP BY act.first_name, act.last_name
ORDER BY  act.last_name, act.first_name;
