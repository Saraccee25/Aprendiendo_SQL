use sakila;
--  Obtener el nombre y apellido de los primeros 5 actores disponibles. Utilizar 
-- alias para mostrar los nombres de las columnas en español. 
select first_name as Nombre from actor
limit 5;
-- Obtener un listado que incluya nombre, apellido y correo electrónico de los 
-- clientes (customers) inactivos. Utilizar alias para mostrar los nombres de las 
-- columnas en español. 
select first_name as Nombre, last_name as Apellido, email as Correo
from customer where active like 0;
-- Obtener un listado de films incluyendo título, año y descripción de los films 
-- que tienen un rental_duration mayor a cinco. Ordenar por rental_duration de 
-- mayor a menor. Utilizar alias para mostrar los nombres de las columnas en 
-- español. 
select title as Título, release_year as AÑO, description as Descripción
from film where rental_duration > 5 order by rental_duration desc;
-- Obtener un listado de alquileres (rentals) que se hicieron durante el mes de 
-- mayo de 2005, incluir en el resultado todas las columnas disponibles. 
select *
from rental
where month(rental_date) = 5 and year(rental_date) = 2005;
-- Obtener la cantidad TOTAL de alquileres (rentals). Utilizar un alias para mostrarlo en una columna llamada “cantidad”. 
select count(rental_id) as cantidad from rental;
-- Obtener la suma TOTAL de todos los pagos (payments). Utilizar un alias para mostrarlo en una columna llamada “total”,
-- junto a una columna con la cantidad de alquileres con el alias “Cantidad” y una columna que indique el “Importe promedio” por alquiler. 
select
  SUM(amount) AS total,
  COUNT(rental_id) AS cantidad,
  avg(amount) AS "Importe promedio"
from payment;
-- Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes que más dinero gastan 
-- y en cuántos alquileres lo hacen
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(p.amount) AS TotalGastado,
  COUNT(p.rental_id) AS RentasTotales
FROM
  customer c
JOIN
  rental r ON c.customer_id = r.customer_id
JOIN
  payment p ON r.rental_id = p.rental_id
GROUP BY
  c.customer_id, c.first_name, c.last_name
ORDER BY
  TotalGastado DESC
LIMIT 10;
-- Generar un reporte que indique: ID de cliente, cantidad de alquileres y monto total para todos los clientes que hayan gastado más de 150 dólares en alquileres. 
SELECT
  c.customer_id,
  COUNT(r.rental_id) AS CantidadAlquileres,
  SUM(p.amount) AS MontoTotal
FROM
  customer c
JOIN 
  rental r ON c.customer_id = r.customer_id
JOIN
  payment p ON r.rental_id = p.rental_id
GROUP BY
  c.customer_id
HAVING
  MontoTotal > 150;

