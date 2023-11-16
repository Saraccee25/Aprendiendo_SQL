use emarket;
-- Generar un listado de todas las facturas del empleado 'Buchanan'.
select * 
from empleados e 
inner join facturas f 
on e.empleadoid = f.empleadoid
where e.apellido = "buchanan";

-- Generar un listado con todos los campos de las facturas del correo 'Speedy
-- Express'.
select *
from facturas f
inner join correos c
on f.enviovia = c.correoid
where compania like "speedy express";

-- Generar un listado de todas las facturas con el nombre y apellido de los
-- empleados.

select concat(e.nombre, " ", e.apellido) as "Nombre y apellido", fa.facturaid, fa.fechafactura 
from empleados e
inner join facturas fa
on e.empleadoid = fa.empleadoid;

-- Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío
-- “USA”.

