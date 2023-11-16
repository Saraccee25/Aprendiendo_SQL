use movies_db;

-- JOINS
select * from movies
inner join genres
on movies.genre_id = genres.id;

select title, name from movies
inner join genres
on movies.genre_id = genres.id;

-- usar alias con las tablas
select m.id, m.title, g.name from movies m
inner join genres g
on m.genre_id = g.id;

-- relacion entre dos tablas con tabla intermedia
select * 
from movies m
inner join actor_movie am -- relacion movies con actor_movie
on m.id = am.movie_id
inner join actors a -- relacion de actors con actor_movie
on a.id = am.actor_id;

-- funciones de alteración
-- concat, concatena la salida de las tablas
select title, concat(first_name, " ", last_name) 
nombre_apellido from movies m
inner join actor_movie am
on m.id= am.movie_id
inner join actors a on  a.id = am.actor_id;

/*
select * 
from nombre_tabla1
inner join nombre_tabla2
on nombre_tabla1.PK = nombre_tabla2.FK
*/

-- actividad
/*1. Utilizando la base de datos de movies, queremos conocer, por un lado, los
títulos y el nombre del género de todas las series de la base de datos.
2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y
apellido de los actores que trabajan en cada uno de ellos.
3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o
actrices (mostrar nombre y apellido) que han trabajado en cualquier película
de la saga de La Guerra de las galaxias.
4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
cantidad de películas por nombre de género.*/

SELECT  title as titulo, name as genero
FROM genres
INNER JOIN series
ON series.genre_id = genres.id;

SELECT title as "titulo episodio", concat(first_name," ", last_name) as "nombre y apellido"
FROM actors
INNER JOIN actor_episode
ON actors.id = actor_episode.actor_id
INNER JOIN episodes
ON episodes.id = actor_episode.episode_id;

SELECT title titulo, concat(first_name," ", last_name) nombre_apellido
FROM movies m
INNER JOIN actor_movie am
ON m.id = am.movie_id
INNER JOIN actors a
ON a.id = am.actor_id
where title like "%galaxia%";

SELECT genres.name, count(*) as cantidad
FROM movies
INNER JOIN genres
ON movies.genre_id = genres.id
group by genres.name;

-- FUNCION COALESCE
SELECT title as titulo, rating, release_date as fecha_lanzamiento, 
coalesce(length, "sin datos") as duracion
FROM movies;
