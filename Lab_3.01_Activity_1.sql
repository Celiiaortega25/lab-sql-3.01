USE sakila;
-- Activity 1
-- Drop column picture from staff.
ALTER TABLE staff
drop column picture;
Select * from staff;
-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM customer
WHERE first_name = 'Tammy';
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password)
VALUES ('Tammy', 'Sanders', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'tammy', 'password123');
SELECT * FROM staff
WHERE first_name = 'Tammy';
-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
SELECT * FROM customer
WHERE first_name = 'Charlotte' AND last_name = 'Hunter';
SELECT inventory_id FROM inventory
WHERE film_id = (SELECT film_id FROM sakila.film WHERE title = 'Academy Dinosaur')
AND store_id = 1 AND NOT EXISTS (
    SELECT * FROM sakila.rental
    WHERE inventory_id = sakila.inventory.inventory_id AND return_date IS NULL
);
SELECT film_id FROM sakila.film
WHERE title = 'Academy Dinosaur';
SELECT staff_id FROM sakila.staff
WHERE first_name = 'Mike' AND last_name = 'Hillyer';
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES (CURDATE(), 5, 130, 1);
select * from rental
where customer_id = 130 AND staff_id = 1;
