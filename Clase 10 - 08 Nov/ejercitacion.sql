use emarket;

-- Categorias y prodcutos
-- Queremos tener un listado de todas las categorías.
select * from categorias;
-- Cómo las categorías no tienen imágenes, Solamente interesa obtener un
-- listado de CategoriaNombre y Descripcion.
select categoriaNombre, descripcion from categorias;
-- Obtener un listado de los productos.
select * from productos;
-- ¿Existen productos discontinuados? (Discontinuado = 1).
select * from productos where discontinuado = 1;
-- Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son
-- los que nos provee?
select * from productos where ProveedorID = 8;
-- Queremos conocer todos los productos cuyo precio unitario se encuentre
-- entre 10 y 22.
select * from products where preciounitario between 10 and 22;
-- Se define que un producto hay que solicitarlo al proveedor si sus
-- Unidades en stock son menores al Nivel de Reorden. ¿Hay productos por
-- solicitar?
select * from productos where unidadesstock < nivelreorden;
-- Se quiere conocer todos los productos del listado anterior pero que
-- Unidades pedidas sea igual a cero.
select * from productos where unidadesstock < nivelreorden
and unidadespedidas = 0; 

-- Clientes
-- Obtener un listado de todos los clientes con Contacto, Compania, Título,
-- País. Ordenar el listado por País.
select contacto, compania, titulo, pais from clientes
 order by pais;
 -- Queremos conocer a todos los clientes que tengan un título “Owner”.
 select * from clientes where titulo like "Owner";
-- El operador telefónico que atendió a un cliente, no recuerda su nombre.
-- Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con
-- todos los contactos que inician con C?
select contacto from clientes
where contacto like "c%";

-- Facturas
-- Obtener un listado de todas las facturas, ordenado por fecha de factura
-- ascendente. 
select * from facturas order by fechafactura;
-- Ahora se requiere un listado de las facturas con el país de envío “USA” y
-- que su correo (EnvioVia) sea distinto de 3.
select * from facturas where paisenvio like "USA" and enviovia != 3;
-- ¿El cliente 'GOURL' realizó algún pedido?
select facturaid, fechafactura from facturas 
where nombreenvio like "gourl";
