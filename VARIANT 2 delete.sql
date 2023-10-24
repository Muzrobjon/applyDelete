-- Delete rental records related to the film
DELETE FROM rental
WHERE inventory_id IN (
    SELECT inventory_id
    FROM inventory
    WHERE film_id = (SELECT film_id FROM film WHERE title = 'The Magnificent Seven')
);

-- Delete the film from the inventory
DELETE FROM inventory
WHERE film_id = (SELECT film_id FROM film WHERE title = 'The Magnificent Seven');

-- Delete records related to you from the rental table
DELETE FROM rental
WHERE customer_id = (
    SELECT customer_id
    FROM customer
    WHERE first_name = 'Doston' AND last_name = 'Kayimov'
);

-- Delete records related to you from the payment table
DELETE FROM payment
WHERE customer_id = (
    SELECT customer_id
    FROM customer
    WHERE first_name = 'Doston' AND last_name = 'Kayimov'
);

-- Delete records related to you from the film_actor table
DELETE FROM film_actor
WHERE film_id IN (
    SELECT film_id
    FROM film
    WHERE title = 'The Magnificent Seven'
);

-- Delete records related to you from the actor table
DELETE FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_id IN (
        SELECT film_id
        FROM film
        WHERE title = 'The Magnificent Seven'
    )
);

-- Truncate the category table
TRUNCATE TABLE category;

-- Truncate the film_category table
TRUNCATE TABLE film_category;

-- Truncate the language table
TRUNCATE TABLE language;