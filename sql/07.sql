/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

WITH bacall_1 AS (
SELECT actor_id
FROM actor
JOIN film_actor USING (actor_id)
WHERE
film_id IN (
SELECT film_id
FROM film_actor
JOIN actor USING (actor_id)
WHERE first_name = 'RUSSELL' AND last_name = 'BACALL'
)
AND NOT (first_name = 'RUSSELL' AND last_name = 'BACALL')
)





SELECT DISTINCT act.first_name || ' ' ||act.last_name as "Actor Name"
FROM actor act
JOIN film_actor filact1 ON (act.actor_id  = filact1.actor_id)
JOIN film_actor filact2 ON (filact1.film_id = filact2.film_id)
JOIN actor act2 on (filact2.actor_id = act2.actor_id)
WHERE act2.actor_id IN (SELECT * FROM bacall_1)
AND act.actor_id NOT IN (SELECT * FROM bacall_1)
AND NOT (act.first_name = 'RUSSELL' AND act.last_name = 'BACALL')
GROUP BY "Actor Name"
ORDER BY "Actor Name";
