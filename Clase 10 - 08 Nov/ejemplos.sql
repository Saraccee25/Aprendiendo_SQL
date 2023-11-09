use movies_db;
-- puedo poner que mostrar con select
select first_name, last_name from actors;
-- query where con condicion
select first_name, last_name, rating from actors
 where rating > 5;
 -- con operadores logicos
 select first_name, last_name, rating from actors
 where rating > 5 and first_name = "Sam";
 
select first_name, last_name, rating from actors
 where rating >= 5 or first_name = "Sam";
 
 -- operador like y between
 select first_name, last_name, rating from actors
 where first_name = "Sam";
 -- funciona igual
 select first_name, last_name, rating from actors
 where first_name like "Sam";
 
 -- comodines: %
 select * from movies;
 
 select title, rating, awards from movies 
 where title like "%potter%";
 -- puede haber 0, 1 o más caracteres adelante o atrás de potter
 -- windows no distingue entre mayusculas y minisculas
 
 select title, rating, awards from movies 
 where title like "a%"; -- que empiece con alter
 
select title, rating, awards from movies 
 where title like "%a"; -- que termine con a
 
 -- comodin _ (reemplaza solo 1 caracter)
 select title, rating, awards from movies
 where title like "_a%"; -- la primer letra puede ser cualquiera pero la seggunda debe ser una a
 
select title, rating, awards from movies
 where title like "__a%";
 
 -- between
 -- se puede reemplazar con >=, <=
 select title, rating, awards from movies 
 where rating between 3 and 9; -- between siempre toma los extremos
 
 -- order by ( es por defecto asc)
 select title, rating, awards from movies
 where rating between 3 and 9 order by rating desc;
 
 -- puedo ordenar por mas de un campo
 select title, rating, awards from movies
 where rating between 3 and 9 order by rating desc, title asc;
 
 -- limit y offset
 -- limit sirve para limitar cuantos registros quiero mostrar en una query
select title, rating, awards from movies
 order by rating desc limit 10; -- 10 mejores peliculas
 
 -- offset (se usa para paginación)
select title, rating, awards from movies 
order by rating desc 
limit 5 -- me muestra los 5 sigueintes
offset 10; -- me saca los 10 primeros registros

-- alias
select title as titulo, rating as calificaciones, awards as premios from movies 
order by rating desc 
limit 5 
offset 10;
 
 
 
 
 
 
 
 
 