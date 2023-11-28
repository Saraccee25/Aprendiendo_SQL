use emarket;

select f.facturaid, f.fechafactura, co.compania,
c.contacto, p.categoriaid, p.productonombre,
 p.preciounitario, d.cantidad
from clientes c
inner join facturas f
on c.clienteid = f.clienteid
inner join correos co
on co.correoid = f.enviovia
inner join facturadetalle d
on f.facturaid = d.facturaid
inner join productos p
on d.productoid = p.productoid
inner join categorias ca
on ca.categoriaid = p.categoriaid;

/*Listar todas las categorías junto con información de sus productos. Incluir todas
las categorías aunque no tengan productos.*/
select * 
from categorias c
left join productos p 
on c.categoriaid = p.categoriaid;

/*Listar la información de contacto de los clientes que no hayan comprado nunca
en emarket.*/
select c.contacto
from clientes c
left join facturas f
on f.clienteid = c.clienteid
where f.facturaid is null;

/*Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y
la información de contacto de su proveedor. Tener en cuenta que puede haber
productos para los cuales no se indicó quién es el proveedor.*/
select
    p.productonombre,
    p.categoriaid,
    ca.categorianombre,
    pro.contacto as informacionproveedor
from
    productos p
left join
    proveedores pro on p.proveedorid = pro.proveedorid
inner join
    categorias ca on p.categoriaid = ca.categoriaid;
/*Para cada categoría listar el promedio del precio unitario de sus productos.*/
select
    ca.categoriaid,
    ca.categorianombre,
    avg(p.preciounitario) as promediopreciounitario
from
    productos p
inner join
    categorias ca on p.categoriaid = ca.categoriaid
group by
    ca.categoriaid, ca.categorianombre;
/*Para cada cliente, indicar la última factura de compra. Incluir a los clientes que
nunca hayan comprado en e-market.*/
select
    c.clienteid,
    c.contacto as nombrecliente,
    max(f.fechafactura) as ultimafechafactura
from
    clientes c
left join
    facturas f on c.clienteid = f.clienteid
group by
    c.clienteid, c.contacto;
/*Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un
listado con todas las empresas de correo, y la cantidad de facturas
correspondientes. Realizar la consulta utilizando RIGHT JOIN.*/
SELECT
    f.enviovia AS empresa_correo,
    COUNT(f.facturaid) AS cantidad_facturas
FROM
    facturas f
RIGHT JOIN
    correos c ON f.enviovia = c.correoid
GROUP BY
    f.enviovia;






