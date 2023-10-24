--task1 
-- First, find the film_id of the film you want to remove from the inventory
SELECT film_id FROM public.film WHERE title = 'The Equalizer 3';

-- Use the retrieved film_id to delete records from inventory and rental
DELETE FROM public.inventory WHERE film_id = <203>;
DELETE FROM public.rental WHERE inventory_id IN (SELECT inventory_id FROM public.inventory WHERE film_id = <203>);


--task2
-- First, identify your customer_id. Replace 'Your Name' with your actual customer information.
SELECT customer_id FROM public.customer WHERE first_name = 'Muzrabjon' AND last_name = 'Tolipov';


DELETE FROM public.rental WHERE customer_id = <2>;
DELETE FROM public.payment WHERE customer_id = <2>;

DELETE FROM public.customer WHERE customer_id = <3>;
