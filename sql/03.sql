/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT co.country, SUM(p.amount) AS total_payments
FROM payment p
INNER JOIN customer c ON c.customer_id = p.customer_id
INNER JOIN address a ON a.address_id = c.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
INNER JOIN country co ON co.country_id = ci.country_id
GROUP BY co.country
ORDER BY total_payments DESC, co.country;
