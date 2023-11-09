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
 
 
 
 