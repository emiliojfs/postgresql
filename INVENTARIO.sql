--User: postgres
CREATE USER admin PASSWORD 'admin';
--Path: INVENTARIO.sql
CREATE DATABASE inventario OWNER admin TABLESPACE tbls_proyectos;
--Schemas

CREATE TABLE Usuario (
    usuario_id SERIAL,
    usuario_nombre VARCHAR(100) NOT NULL,
    usuario_apellido VARCHAR(100) NOT NULL,
    usuario_cedula VARCHAR(100) NOT NULL,
    usuario_direccion VARCHAR(100) NOT NULL,
    usuario_telefono VARCHAR(100) NOT NULL,
    usuario_email VARCHAR(100) NOT NULL,
    usuario_password VARCHAR(100) NOT NULL,
    usuario_estado BOOLEAN NOT NULL,
    CONSTRAINT pk_usuario_id PRIMARY KEY (usuario_id)
);
CREATE TABLE Cliente(
    cliente_id SERIAL,
    cliente_nombre VARCHAR(100) NOT NULL,
    cliente_apellido VARCHAR(100) NOT NULL,
    cliente_cedula VARCHAR(100) NOT NULL,
    cliente_direccion VARCHAR(100) NOT NULL,
    cliente_telefono VARCHAR(100) NOT NULL,
    cliente_email VARCHAR(100) NOT NULL,
    cliente_estado BOOLEAN NOT NULL,
    CONSTRAINT pk_cliente_id PRIMARY KEY (cliente_id)
);
CREATE TABLE Proveedor (
    proveedor_id SERIAL,
    proveedor_nombre VARCHAR(100) NOT NULL,
    proveedor_descripcion TEXT NOT NULL,
    proveedor_estado BOOLEAN NOT NULL,
    CONSTRAINT pk_proveedor_id PRIMARY KEY (proveedor_id)
);
CREATE TABLE Bodega(
    bodega_id SERIAL,
    bodega_nombre VARCHAR(100) NOT NULL,
    bodega_descripcion TEXT NOT NULL,
    bodega_estado BOOLEAN NOT NULL,
    CONSTRAINT pk_bodega_id PRIMARY KEY (bodega_id)
);
CREATE TABLE Categoria (
    categoria_id SERIAL,
    categoria_nombre VARCHAR(100) NOT NULL,
    categoria_descripcion TEXT NOT NULL,
    CONSTRAINT pk_categoria_id PRIMARY KEY (categoria_id)
);
CREATE TABLE Producto (
    producto_id SERIAL,
    categoria_id INTEGER NOT NULL,
    proveedor_id INTEGER NOT NULL,
    producto_nombre VARCHAR(100) NOT NULL,
    producto_descripcion TEXT NOT NULL,
    producto_stockActual INTEGER NOT NULL,
    producto_stockMinimo INTEGER NOT NULL,
    producto_stockMaximo INTEGER NOT NULL,
    producto_fechaVencimiento DATE NOT NULL,
    producto_estado BOOLEAN NOT NULL,
    CONSTRAINT pk_producto_id PRIMARY KEY (producto_id),
    CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id) REFERENCES Categoria (categoria_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_producto_proveedor FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE DocumentoEntrada(
    documentoEntrada_id SERIAL,
    documentoEntrada_fecha DATE NOT NULL,
    usuario_id INTEGER NOT NULL,
    bodega_id INTEGER NOT NULL,
    proveedor_id INTEGER NOT NULL,
    CONSTRAINT pk_documentoEntrada_id PRIMARY KEY (documentoEntrada_id),
    CONSTRAINT fk_documentoEntrada_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_documentoEntrada_bodega FOREIGN KEY (bodega_id) REFERENCES Bodega (bodega_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_documentoEntrada_proveedor FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE DetalleEntrada(
    detalleEntrada_id SERIAL,
    detalleEntrada_cantidad INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    documentoEntrada_id INTEGER NOT NULL,
    CONSTRAINT pk_detalleEntrada_id PRIMARY KEY (detalleEntrada_id),
    CONSTRAINT fk_detalleEntrada_producto FOREIGN KEY (producto_id) REFERENCES Producto (producto_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_detalleEntrada_documentoEntrada FOREIGN KEY (documentoEntrada_id) REFERENCES DocumentoEntrada (documentoEntrada_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE DocumentoSalida(
    documentoSalida_id SERIAL,
    documentoSalida_fecha DATE NOT NULL,
    usuario_id INTEGER NOT NULL,
    bodega_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    CONSTRAINT pk_documentoSalida_id PRIMARY KEY (documentoSalida_id),
    CONSTRAINT fk_documentoSalida_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_documentoSalida_bodega FOREIGN KEY (bodega_id) REFERENCES Bodega (bodega_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_documentoSalida_cliente FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE  DetalleSalida(
    detalleSalida_id SERIAL,
    detalleSalida_cantidad INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    documentoSalida_id INTEGER NOT NULL,
    CONSTRAINT pk_detalleSalida_id PRIMARY KEY (detalleSalida_id),
    CONSTRAINT fk_detalleSalida_producto FOREIGN KEY (producto_id) REFERENCES Producto (producto_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_detalleSalida_documentoSalida FOREIGN KEY (documentoSalida_id) REFERENCES DocumentoSalida (documentoSalida_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);


--
INSERT INTO Usuario (usuario_nombre, usuario_apellido, usuario_cedula, usuario_direccion, usuario_telefono, usuario_email, usuario_password, usuario_estado)
VALUES 
('Oscar', 'Usuario 1', '1234567890', 'Direccion 1', '1234567890', '1@1','1',true),
('Dangelo', 'Usuario 2', '1234567890', 'Direccion 2', '1234567890', '2@2','2',true),
('Delia', 'Usuario 3', '1234567890', 'Direccion 3', '1234567890', '3@3','3',true),
('Juan', 'Usuario 4', '1234567890', 'Direccion 4', '1234567890', '4@4','4',true),
('Pedro', 'Usuario 5', '1234567890', 'Direccion 5', '1234567890', '5@5','5',true);

INSERT INTO Cliente (cliente_nombre, cliente_apellido, cliente_cedula, cliente_direccion, cliente_telefono, cliente_email, cliente_estado)
VALUES
('Pia', 'Cliente1', '1234567890', 'Direccion 1', '1234567890', '1@1', true),
('Milagros', 'Cliente2', '1234567890', 'Direccion 2', '1234567890', '2@2', true),
('Naturely', 'Cliente3', '1234567890', 'Direccion 3', '1234567890', '3@3', true),
('Matias', 'Cliente4', '1234567890', 'Direccion 4', '1234567890', '4@4', true),
('Macarena', 'Cliente5', '1234567890', 'Direccion 5', '1234567890', '5@5', true);

INSERT INTO Proveedor (proveedor_nombre, proveedor_descripcion, proveedor_estado)
VALUES
('FNL', 'Proveedor 1', true),
('AURAVITALIS', 'Proveedor 2', true),
('LABORATORIO SOLNATURA', 'Proveedor 3', true),
('KNOP', 'Proveedor 4', true),
('SIENA', 'Proveedor 5', true);

INSERT INTO Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('Batuco-1', 'Bodega 1', true);
INSERT INTO Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('Batuco-2', 'Bodega 2', true);
INSERT INTO Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('SanAlfonso', 'Bodega 3', true);
INSERT INTO Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('Tucapel', 'Bodega 4', true);
INSERT INTO Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('Vega', 'Bodega 5', true);

INSERT INTO Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 1', 'Categoria 1');
INSERT INTO Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 2', 'Categoria 2');
INSERT INTO Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 3', 'Categoria 3');
INSERT INTO Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 4', 'Categoria 4');
INSERT INTO Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 5', 'Categoria 5');

UPDATE Categoria SET categoria_nombre = 'Capsulas' WHERE categoria_id = 1;
UPDATE Categoria SET categoria_nombre = 'Harinas' WHERE categoria_id = 2;
UPDATE Categoria SET categoria_nombre = 'Aceites' WHERE categoria_id = 3;
UPDATE Categoria SET categoria_nombre = 'Cremas' WHERE categoria_id = 4;
UPDATE Categoria SET categoria_nombre = 'Jabones' WHERE categoria_id = 5;

INSERT INTO Producto (categoria_id, proveedor_id, producto_nombre, producto_descripcion, producto_stockActual, producto_stockMinimo, producto_stockMaximo, producto_fechaVencimiento, producto_estado)
VALUES 
(1, 2, 'Capsula Incagold Moringa', 'Capsula Incagold Moringa', 10, 5, 15, '2020-01-01', true),
(1, 2, 'Capsula Incagold Curcuma', 'Capsula Incagold Curcuma', 10, 5, 15, '2020-01-01', true),
(1, 2, 'Capsula Incagold Maqui', 'Capsula Incagold Maqui', 10, 5, 15, '2020-01-01', true),
(1, 2, 'Capsula Incagold Maca', 'Capsula Incagold Maca', 10, 5, 15, '2020-01-01', true),
(1, 2, 'Capsula Incagold Ajo', 'Capsula Incagold Ajo', 10, 5, 15, '2020-01-01', true),

(2,3,'Harina de Maca','Harina de Maca',10,5,15,'2020-01-01',true),
(2,3,'Harina de Maqui','Harina de Maqui',10,5,15,'2020-01-01',true),
(2,3,'Harina de Quinoa','Harina de Quinoa',10,5,15,'2020-01-01',true),
(2,4,'Harina de Linaza','Harina de Linaza',10,5,15,'2020-01-01',true),
(2,4,'Harina de Almendra','Harina de Almendra',10,5,15,'2020-01-01',true),

(3,5,'Aceite de Oliva','Aceite de Oliva',10,5,15,'2020-01-01',true),
(3,5,'Aceite de Coco','Aceite de Coco',10,5,15,'2020-01-01',true),
(3,1,'Aceite de Almendra','Aceite de Almendra',10,5,15,'2020-01-01',true),
(3,1,'Aceite de Argan','Aceite de Argan',10,5,15,'2020-01-01',true),
(3,1,'Aceite de Jojoba','Aceite de Jojoba',10,5,15,'2020-01-01',true),

(4,1,'Crema de Moringa','Crema de Moringa',10,5,15,'2020-01-01',true),
(4,1,'Crema de Maca','Crema de Maca',10,5,15,'2020-01-01',true),
(4,1,'Crema de Curcuma','Crema de Curcuma',10,5,15,'2020-01-01',true),
(4,1,'Crema de Acai','Crema de Acai',10,5,15,'2020-01-01',true),
(4,1,'Crema de Ajo','Crema de Ajo',10,5,15,'2020-01-01',true),

(5,2,'Jabon de Moringa','Jabon de Moringa',10,5,15,'2020-01-01',true),
(5,2,'Jabon de Maca','Jabon de Maca',10,5,15,'2020-01-01',true),
(5,2,'Jabon de Curcuma','Jabon de Curcuma',10,5,15,'2020-01-01',true),
(5,3,'Jabon de Acai','Jabon de Acai',10,5,15,'2020-01-01',true),
(5,3,'Jabon de Ajo','Jabon de Ajo',10,5,15,'2020-01-01',true);

INSERT INTO DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 1, 1, 1);
INSERT INTO DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 1, 2, 3);
INSERT INTO DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 1, 2, 5);
INSERT INTO DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 2, 3, 3);
INSERT INTO DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 2, 3, 5);

INSERT INTO DetalleEntrada (detalleEntrada_cantidad, producto_id, documentoEntrada_id)
VALUES 
(100, 1, 1),
(300, 2, 1),
(250, 7, 1),
(100, 12, 1),
(220, 18, 1),

(100, 13, 2),
(300, 20, 2),
(250, 11, 2),
(100, 10, 2),
(220, 15, 2),

(100, 16, 3),
(300, 15, 3),
(250, 2, 3),
(100, 7, 3),
(220, 5, 3),

(100, 5, 4),
(300, 6, 4),
(250, 7, 4),
(100, 17, 4),
(220, 16, 4),

(100, 9, 5),
(300, 19, 5),
(250, 17, 5),
(100, 12, 5),
(220, 11, 5);

INSERT INTO DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 1, 1, 1);
INSERT INTO DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 2, 2, 3);
INSERT INTO DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 2, 2, 3);
INSERT INTO DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 3, 2, 2);
INSERT INTO DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 3, 3, 4);

INSERT INTO DetalleSalida (detalleSalida_cantidad, producto_id, documentoSalida_id)
VALUES
(10, 1, 1),
(30, 2, 1),
(25, 3, 1),
(10, 4, 1),
(20, 5, 1),

(10, 17, 2),
(100, 16, 2),
(50, 15, 2),
(50, 11, 2),
(10, 10, 2),

(10, 9, 3),
(30, 7, 3),
(25, 6, 3),
(10, 13, 3),
(20, 20, 3),

(10, 3, 4),
(30, 5, 4),
(25, 6, 4),
(100, 9, 4),
(20, 16, 4),

(100, 13, 5),
(30, 11, 5),
(25, 12, 5),
(10, 16, 5),
(220, 18, 5);

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


--Delete (elimina registros de toda la tabla)

DELETE FROM Producto;
DELETE FROM DocumentoEntrada;
DELETE FROM DetalleEntrada;
DELETE FROM DocumentoSalida;
DELETE FROM DetalleSalida;

DELETE FROM Usuario;
DELETE FROM Cliente;
DELETE FROM Proveedor;
DELETE FROM Bodega;
DELETE FROM Categoria;

--Reset SEQUENCE

TRUNCATE TABLE Usuario RESTART IDENTITY CASCADE;
TRUNCATE TABLE Producto RESTART IDENTITY CASCADE;
TRUNCATE TABLE DocumentoEntrada RESTART IDENTITY CASCADE;
TRUNCATE TABLE DetalleEntrada RESTART IDENTITY CASCADE;
TRUNCATE TABLE DocumentoSalida RESTART IDENTITY CASCADE;
TRUNCATE TABLE DetalleSalida RESTART IDENTITY CASCADE;
TRUNCATE TABLE Cliente RESTART IDENTITY CASCADE;
TRUNCATE TABLE Proveedor RESTART IDENTITY CASCADE;
TRUNCATE TABLE Bodega RESTART IDENTITY CASCADE;
TRUNCATE TABLE Categoria RESTART IDENTITY CASCADE;
