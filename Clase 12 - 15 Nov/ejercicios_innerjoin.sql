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

-- Mostrar todos los campos de las facturas del empleado cuyo apellido sea
-- “Leverling” o que incluyan el producto id = “42
select * 
from facturas f
inner join empleados e
on e.empleadoid = f.empleadoid
inner join facturadetalle d 
on d.facturaid = f.facturaid
where apellido = "leverling" or productoid = 42;
-- Mostrar todos los campos de las facturas del empleado cuyo apellido sea
-- “Leverling” y que incluya los producto id = “80” o ”42”.
select * 
from facturas f
inner join empleados e
on e.empleadoid = f.empleadoid
inner join facturadetalle d 
on d.facturaid = f.facturaid
where apellido = "leverling" and (productoid = 42 or productoid = 80);
-- Generar un listado con los cinco mejores clientes, según 
-- sus importes de
-- compras total (PrecioUnitario * Cantidad).
select
    c.clienteid,
    sum(d.preciounitario * d.cantidad) as montototalcompras
from
    clientes c
inner join
    facturas f on f.clienteid = c.clienteid
inner join
    facturadetalle d on d.facturaid = f.facturaid
group by
    c.clienteid
order by
    montototalcompras desc
limit 5;
/*Generar un listado de facturas, con los campos id, nombre y apellido del cliente,
fecha de factura, país de envío, Total, ordenado de manera descendente por
fecha de factura y limitado a 10 filas.*/
select
    c.clienteid,
    c.contacto as "nombre del cliente",
    f.fechafactura,
    f.paisenvio,
    sum(d.preciounitario * d.cantidad) as total
from
    facturas f
inner join
    clientes c on f.clienteid = c.clienteid
inner join
    facturadetalle d on d.facturaid = f.facturaid
group by
    c.clienteid, c.contacto, f.fechafactura, f.paisenvio
order by
    f.fechafactura desc
limit 10;



