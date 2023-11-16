use el_descubierto;

-- 1
select id as "Número de cliente", nombre, apellido 
from cliente where nombre like "a%";
-- 2
select numero as "numero sucursal" from sucursal 
where domicilio =  "Ramón Freire Serrano 7410";
-- 3
select max(importe) as "mayor importe" from prestamo;
-- 4
SELECT * FROM pago WHERE id IN (10, 14, 27, 45);
-- 5
Select prestamo_id as "Nùmero de prèstamo", sum(importe) as "Total Pagado" from pago Where prestamo_id = 40;
-- 6
Select * from empleado where sucursal_numero != 2 and (alta_contrato_laboral > '20210905' or alta_contrato_laboral = '20210625') Order By alta_contrato_laboral;
-- 7
select * from pago where importe between 1030.25 and 1666.66 order by importe desc;
-- 8
select * from pago order by importe asc limit 5;
-- 9
SELECT id,fecha_otorgado,importe FROM prestamo order by importe desc limit 1 ;
-- 10
SELECT numero,saldo,cuenta_tipo_id FROM cuenta order by saldo asc limit 10;
-- 11
SELECT * FROM prestamo WHERE fecha_otorgado BETWEEN '2021-07-10' AND '2021-08-10' ORDER BY fecha_otorgado;
-- 12
SELECT * FROM cuenta WHERE descubierto_otorgado >=8999.80 ORDER BY descubierto_otorgado asc;
-- 13
SELECT legajo, apellido, nombre, email
FROM empleado
WHERE apellido LIKE '%do';
-- 14
SELECT AVG(saldo) AS promedio_saldos
FROM cuenta
WHERE cuenta_tipo_id = 1;
-- 15
SELECT *
FROM prestamo
ORDER BY importe DESC
LIMIT 1 OFFSET 2;
-- 16 
SELECT
    sucursal_numero AS Sucursal,
    COUNT(*) AS "Cantidad de Cuentas"
FROM
    cuenta
WHERE
    sucursaL_numero = 5;
-- 17 falta
SELECT * FROM ciudad  where nombre like '___n%' and nombre like '_____ %';
-- 18 
UPDATE cuenta_tipo
SET tipo = "Cuenta Especial"
WHERE ID = 2;
-- 19 falta

-- 20 falta
-- 21 
select sum(importe) as total_prestado
FROM prestamo;
-- 22
SELECT COUNT(*) AS total_cuentas_activas
FROM cuenta
WHERE activa = 1;
-- 23 falta
SELECT apellido, COUNT(*) AS cantidad_clientes
FROM cliente
GROUP BY apellido
HAVING COUNT(*) > 1;
-- 24 
SELECT p.id AS id_pais, COUNT(c.id) AS cantidad_ciudades
FROM pais p
LEFT JOIN ciudad c ON p.id = c.pais_id
GROUP BY p.id;
-- 25
select sucursal_numero, fecha_otorgado , count(*) as 
"cantidad prestamos" from prestamo
group by sucursal_numero, fecha_otorgado;

