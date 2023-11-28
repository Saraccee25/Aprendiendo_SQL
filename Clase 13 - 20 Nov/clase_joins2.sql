-- CLASE DE JOINS

use movies_db;

-- INNER JOIN

select * 
from movies
inner join genres
on genres.id = movies.genre_id;

-- LEFT JOIN

select *
from movies
left join genres
on genres.id = movies.genre_id; -- todas las peliculas con o sin genero asociado

select *
from genres
left join movies
on genres.id = movies.genre_id; -- todos los generos con sus peliculas asociadas y generos sin peliculas asociadas

-- RIGHT JOIN
select *
from movies
right join genres
on genres.id = movies.genre_id;
-- generos con o sin peliculas asociadas
-- la tabla después del from es la de la izquierda

-- estas dos consultas me dan el mismo resultado
select *
from movies
right join genres
on genres.id = movies.genre_id;

select *
from genres
left join movies
on genres.id = movies.genre_id;

-- LEFT EXCLUDING JOIN
select *
from movies
left join genres
on genres.id = movies.genre_id
where genres.id is null;
-- no hay clausula como tal, se usa is null
-- debe ser is null, no = null

-- RIGHT EXCLUDING JOIN
select *
from movies
right join genres
on genres.id = movies.genre_id
where movies.id is null;
-- generos sin peliculas asociadas