use EMarket;

/* 1- istado de Categorias */
select * from Categorias;

/* 2- listado de CategoriaNombre y Descripcion */
select CategoriaNombre, Descripcion From Categorias;

/* 3- Listado de Productos*/
select * from Productos;

/* 4- Productos Discontinuados*/
select * from Productos where Discontinuado = 1; 

/* 5- Listado productos proveedor 8 */
select * from Productos where  ProveedorID = 8;

/* 6- Listado productos cuyo precio este entre 10 y 22 */
select * from Productos where  PrecioUnitario between 10 and 22;

/* 7- Listado productos cuyo Unidades en stock son menores al Nivel de Reorden */
select * from Productos where UnidadesStock < NivelReorden;

/* 8- Listado productos cuyo unidades pedidas sean 0 y Unidades en stock son menores al Nivel de Reorden */
select * from Productos where UnidadesStock < NivelReorden and UnidadesPedidas = 0;

/**** CLIENTES ******/

/* 1- Contacto, Compania, Título, País. Ordenar el listado por País*/
select Contacto, Compania, Titulo, Pais from Clientes order by Pais;

/* 2- Clientes que tengan un título “Owner” */
select * from Clientes where Titulo = 'Owner';

/* 3- Clientes que empiezan con C */
select * from Clientes where Compania like 'C%';

/**** FACTURAS ******/

/* 1- Facturas ordenadas por fecha de factura ascendente */
select * from Facturas Order by FechaFactura Asc;

/* 2- Facturas del Pais USA */
select * from Facturas where PaisEnvio = 'USA' and EnvioVia <> 3;

/* 3- Facturas del cliente 'GOURL' */
select * from Facturas where ClienteID = 'GOURL';

/* 4- Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9 */
select * from Facturas where EmpleadoID in (2,3,5,8,9);

/*
===================================
== Consultas Queries ML Parte II ==
===================================
*/

/**** PRODUCTOS ******/

/* 1- listado de todos los productos ordenados descendentemente por Precio Unitario */
select * from Productos Order By PrecioUnitario desc;

/* 2- Top 5 cuyo precio unitario es mas caro */
select * from Productos Order By PrecioUnitario desc limit 5;

/* 2- Top 10 productos con mas unidades en stock */
select * from Productos Order By UnidadesStock desc limit 10;

/**** FacturaDetalle ******/

/* 1- listado de FacturaID, Producto, Cantidad. */
select FacturaID, ProductoID, Cantidad from FacturaDetalle;

/* 2- Ordenar descendentemente listado de FacturaID, Producto, Cantidad. */
select FacturaID, ProductoID, Cantidad from FacturaDetalle Order by Cantidad desc;

/* 3- Filtrar listado cuya Cantidad este entre 50 y 100. */
select FacturaID, ProductoID, Cantidad from FacturaDetalle where Cantidad between 50 and 100 Order by Cantidad desc;

/* 4- listado de NroFactura (FacturaID), Producto (ProductoID) y Total (PrecioUnitario*Cantidad) */
select FacturaID as NroFactura, ProductoID as Producto, (PrecioUnitario*Cantidad) as Total from FacturaDetalle;

/*
============
== EXTRAS ==
============
*/

/* Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico” o
que tengan un título que empiece con “Sales” */
select * from Clientes where Pais in ('Brazil', 'Mexico') Or Titulo like 'Sales%';

/*Obtener un listado de todos los clientes que pertenecen a una compañía
que empiece "A"*/
select * from Clientes where Compania like 'A%';

/*Obtener un listado con los datos: Ciudad,Contacto y renombrarlo como
Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los
clientes que sean de la ciudad "Madrid"*/
select Ciudad, Contacto as 'Apellido y Nombre', Titulo as Puesto from Clientes Where Ciudad = 'Madrid';

/* Obtener un listado de todas las facturas con ID entre 10000 y 10500 */
select * from Facturas Where FacturaID between 10000 and 10500;

/*Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de
los clientes con ID que empiecen con “B”*/
select * from Facturas Where (FacturaID >= 10000 and FacturaID <= 10500) Or ClienteId like 'B%';

/* Facturas que la ciudad de envío “Vancouver” o que utilicen el
correo 3 */
select * from Facturas Where CiudadEnvio = 'Vancouver' Or EnvioVia = 3;

/* Id de empleado de “Buchanan” */
select EmpleadoId from Empleados Where Apellido = 'Buchanan';

/* Facturas con EmpleadoID del empleado del ejercicio anterior */
Select * From Facturas Where EmpleadoID = 5;
Select * From Facturas Where EmpleadoID in (select EmpleadoId from Empleados Where Apellido = 'Buchanan');