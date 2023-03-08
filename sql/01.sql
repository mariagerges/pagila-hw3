/*
 * Compute the number of customers who live outside of the US.
 */

SELECT count(*) as count
FROM customer cua
JOIN address a ON(cua.address_id = a.address_id)
JOIN city ci ON(a.city_id = ci.city_id)
JOIN country co ON(ci.country_id = co.country_id)
WHERE co.country_id NOT IN (
    SELECT country_id
    FROM country
    WHERE country = 'United States'
)
