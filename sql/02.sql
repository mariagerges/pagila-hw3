/*
 * Compute the country with the most customers in it. 
 */
SELECT country
FROM customer cua
INNER JOIN address a ON a.address_id = cua.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
INNER JOIN country co ON co.country_id = ci.country_id
GROUP BY co.country
ORDER BY COUNT(*) DESC
LIMIT 1;
