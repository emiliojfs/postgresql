--Querys

select * from detalleentrada where detalleentrada_cantidad > 250;
select * from detalleentrada where detalleentrada_cantidad >= 150;
select * from detalleentrada where detalleentrada_cantidad <= 300;


SELECT doc.documentoEntrada_id, doc.documentoEntrada_fecha, det.detalleEntrada_id, det.detalleEntrada_cantidad, det.producto_id, pro.producto_nombre
FROM DocumentoEntrada doc INNER JOIN DetalleEntrada det ON doc.documentoEntrada_id = det.documentoEntrada_id INNER JOIN Producto pro ON det.producto_id = pro.producto_id;

SELECT * FROM bodega WHERE upper(bodega_nombre) = upper('batuco-1'); -- Buscar por nombre de bodega (case insensitive)
SELECT * FROM producto WHERE producto_nombre ILIKE '%MACA%'; -- Buscar por nombre de producto (case insensitive)

SELECT * FROM producto WHERE producto_nombre LIKE '%Maca%'; -- Buscar por nombre de producto 
SELECT * FROM producto WHERE producto_nombre LIKE '%Mac_'; -- Busca desde el inicio de la palabra hasta el caracter _ (case sensitive)

SELECT * FROM detalleentrada WHERE detalleentrada_cantidad BETWEEN 100 AND 200;
SELECT * FROM producto WHERE producto_stockActual BETWEEN 10 AND 20;

SELECT * FROM producto WHERE producto_stockActual IN (10, 20, 30); -- Busca por valores especificos

SELECT * FROM producto WHERE EXISTS (SELECT * FROM cliente); -- Busca si existe un registro en la tabla cliente
SELECT * FROM producto WHERE NOT EXISTS (SELECT * FROM cliente); -- Busca si no existe un registro en la tabla cliente

SELECT *, CASE WHEN detalleentrada_cantidad >= 200 THEN 'NO REVISAR' ELSE 'CONTAR' END FROM detalleentrada; -- Case When
SELECT *, CASE WHEN detalleentrada_cantidad <= 100 THEN 'NO REVISAR' WHEN detalleentrada_cantidad BETWEEN 101 AND 250 THEN 'CONTAR' WHEN detalleentrada_cantidad>251 THEN 'REVISAR' END FROM detalleentrada;
SELECT * , CASE detalleentrada_cantidad WHEN  100 THEN 'POCO' WHEN  200 THEN 'NORMAL' WHEN  300 THEN 'ALTO' END FROM detalleentrada; -- Case When

SELECT doc.documentoEntrada_id, doc.documentoEntrada_fecha, det.detalleEntrada_id, det.detalleEntrada_cantidad, det.producto_id, pro.producto_nombre 
INTO tmp_consulta 
FROM DocumentoEntrada doc INNER JOIN DetalleEntrada det ON doc.documentoEntrada_id = det.documentoEntrada_id INNER JOIN Producto pro
ON det.producto_id = pro.producto_id; -- Crear tabla temporal con datos de consulta (SELECT INTO) 

SELECT DISTINCT detalleentrada_cantidad FROM DetalleEntrada;

SELECT MIN(detalleentrada_cantidad) as Minimo FROM detalleentrada;
SELECT MAX(detalleentrada_cantidad) as Maximo FROM detalleentrada;
SELECT AVG(detalleentrada_cantidad) as Promedio FROM detalleentrada;
SELECT SUM(detalleentrada_cantidad) as Suma_Total FROM detalleentrada;
SELECT COUNT(detalleentrada_cantidad) as cantidad_operaciones FROM detalleentrada;
SELECT MIN(detalleentrada_cantidad) as Minimo, MAX(detalleentrada_cantidad) as Maximo, AVG(detalleentrada_cantidad) as Promedio, SUM(detalleentrada_cantidad) as Suma_Total, COUNT(detalleentrada_cantidad) as cantidad_operaciones FROM detalleentrada;

SELECT producto_id, SUM(detalleentrada_cantidad) as suma_entrada_x_producto FROM detalleentrada GROUP BY producto_id;
SELECT P.producto_id, P.producto_nombre, SUM(DE.detalleentrada_cantidad) as suma_entrada_x_producto 
FROM producto P INNER JOIN detalleentrada DE ON P.producto_id = DE.producto_id 
GROUP BY P.producto_id, P.producto_nombre; -- Agrupar por producto_id y producto_nombre, si se usan 2 tablas deben ir 2 campos en el GROUP BY

select * from detalleentrada ORDER BY producto_id;
select * from detalleentrada ORDER BY producto_id DESC;
select * from detalleentrada ORDER BY producto_id ASC, detalleentrada_cantidad DESC;

SELECT producto_id, COUNT(*) as cantidad FROM detalleentrada GROUP BY producto_id; -- Agrupar por producto_id y contar la cantidad de registros por producto_id
SELECT producto_id, COUNT(*) as cantidad FROM detalleentrada GROUP BY producto_id HAVING COUNT(*) > 2; -- Agrupar por producto_id y contar la cantidad de registros por producto_id, filtrar por cantidad de registros


SELECT * FROM detalleentrada LIMIT 5;
SELECT * FROM detalleentrada LIMIT 5 ORDER BY producto_id DESC;
SELECT * FROM detalleentrada LIMIT 5 OFFSET 5; -- OFFSET 5, indica que se salte los primeros 5 registros y muestre los siguientes 5