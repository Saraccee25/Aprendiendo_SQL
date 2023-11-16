use emarket;
-- count, cuenta los valores no null
select count(*) from productos;
select count(EmpleadoId) from empleados;
select count(jefe) from empleados;
select count(foto) from empleados;

-- avg y sum

select avg(preciounitario) as promedio_precio, sum(unidadesstock)
 as stock from productos;
 
 select avg(preciounitario), sum(cantidad)
 from facturadetalle where productoid= 41;
 
 -- min y max
 
 select min(preciounitario) as "precio minimo",
 max(preciounitario) as "precio maximo" , min(unidadesstock) 
 as "unidades minimas", max(unidadesstock) as "unidadesmaximas" from 
 productos;
 
 select min(fechafactura) as "fecha antigua", max(fechafactura) 
 as "fecha reciente" from facturas;
 
 -- group by
 select * from empleados;
 select pais, count(*) as cantidad, min(fechacontratacion) as
 "mayor antiguedad", max(fechacontratacion) as "menor antiguedad"
 from empleados group by pais;