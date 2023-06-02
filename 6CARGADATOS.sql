
INSERT INTO inventario.Usuario (usuario_nombre, usuario_apellido, usuario_cedula, usuario_direccion, usuario_telefono, usuario_email, usuario_password, usuario_estado)
VALUES 
('Oscar', 'Usuario 1', '1234567890', 'Direccion 1', '1234567890', '1@1','1',true),
('Dangelo', 'Usuario 2', '1234567890', 'Direccion 2', '1234567890', '2@2','2',true),
('Delia', 'Usuario 3', '1234567890', 'Direccion 3', '1234567890', '3@3','3',true),
('Juan', 'Usuario 4', '1234567890', 'Direccion 4', '1234567890', '4@4','4',true),
('Pedro', 'Usuario 5', '1234567890', 'Direccion 5', '1234567890', '5@5','5',true);

INSERT INTO inventario.Cliente (cliente_nombre, cliente_apellido, cliente_cedula, cliente_direccion, cliente_telefono, cliente_email, cliente_estado)
VALUES
('Pia', 'Cliente1', '1234567890', 'Direccion 1', '1234567890', '1@1', true),
('Milagros', 'Cliente2', '1234567890', 'Direccion 2', '1234567890', '2@2', true),
('Naturely', 'Cliente3', '1234567890', 'Direccion 3', '1234567890', '3@3', true),
('Matias', 'Cliente4', '1234567890', 'Direccion 4', '1234567890', '4@4', true),
('Macarena', 'Cliente5', '1234567890', 'Direccion 5', '1234567890', '5@5', true);

INSERT INTO inventario.Proveedor (proveedor_nombre, proveedor_descripcion, proveedor_estado)
VALUES
('FNL', 'Proveedor 1', true),
('AURAVITALIS', 'Proveedor 2', true),
('LABORATORIO SOLNATURA', 'Proveedor 3', true),
('KNOP', 'Proveedor 4', true),
('SIENA', 'Proveedor 5', true);

INSERT INTO inventario.Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('Batuco-1', 'Bodega 1', true);
INSERT INTO inventario.Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('Batuco-2', 'Bodega 2', true);
INSERT INTO inventario.Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('SanAlfonso', 'Bodega 3', true);
INSERT INTO inventario.Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('Tucapel', 'Bodega 4', true);
INSERT INTO inventario.Bodega (bodega_nombre, bodega_descripcion, bodega_estado) VALUES ('Vega', 'Bodega 5', true);

INSERT INTO inventario.Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 1', 'Categoria 1');
INSERT INTO inventario.Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 2', 'Categoria 2');
INSERT INTO inventario.Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 3', 'Categoria 3');
INSERT INTO inventario.Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 4', 'Categoria 4');
INSERT INTO inventario.Categoria (categoria_nombre, categoria_descripcion) VALUES ('Categoria 5', 'Categoria 5');

INSERT INTO inventario.Producto (categoria_id, proveedor_id, producto_nombre, producto_descripcion, producto_stockActual, producto_stockMinimo, producto_stockMaximo, producto_fechaVencimiento, producto_estado)
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

INSERT INTO inventario.DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 1, 1, 1);
INSERT INTO inventario.DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 1, 2, 3);
INSERT INTO inventario.DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 1, 2, 5);
INSERT INTO inventario.DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 2, 3, 3);
INSERT INTO inventario.DocumentoEntrada (documentoEntrada_fecha, usuario_id, bodega_id, proveedor_id) VALUES ('2020-01-01', 2, 3, 5);

INSERT INTO inventario.DetalleEntrada (detalleEntrada_cantidad, producto_id, documentoEntrada_id)
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

INSERT INTO inventario.DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 1, 1, 1);
INSERT INTO inventario.DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 2, 2, 3);
INSERT INTO inventario.DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 2, 2, 3);
INSERT INTO inventario.DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 3, 2, 2);
INSERT INTO inventario.DocumentoSalida (documentoSalida_fecha, usuario_id, bodega_id, cliente_id) VALUES ('2020-01-01', 3, 3, 4);

INSERT INTO inventario.DetalleSalida (detalleSalida_cantidad, producto_id, documentoSalida_id)
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


--Update (actualiza registros de toda la tabla)

UPDATE inventario.Categoria SET categoria_nombre = 'Capsulas' WHERE categoria_id = 1;
UPDATE inventario.Categoria SET categoria_nombre = 'Harinas' WHERE categoria_id = 2;
UPDATE inventario.Categoria SET categoria_nombre = 'Aceites' WHERE categoria_id = 3;
UPDATE inventario.Categoria SET categoria_nombre = 'Cremas' WHERE categoria_id = 4;
UPDATE inventario.Categoria SET categoria_nombre = 'Jabones' WHERE categoria_id = 5;

--Delete (elimina registros de toda la tabla)

DELETE FROM inventario.Producto;
DELETE FROM inventario.DocumentoEntrada;
DELETE FROM inventario.DetalleEntrada;
DELETE FROM inventario.DocumentoSalida;
DELETE FROM inventario.DetalleSalida;

DELETE FROM inventario.Usuario;
DELETE FROM inventario.Cliente;
DELETE FROM inventario.Proveedor;
DELETE FROM inventario.Bodega;
DELETE FROM inventario.Categoria;


--Reset SEQUENCE

TRUNCATE TABLE inventario.Usuario RESTART IDENTITY CASCADE;
TRUNCATE TABLE inventario.Producto RESTART IDENTITY CASCADE;
TRUNCATE TABLE inventario.DocumentoEntrada RESTART IDENTITY CASCADE;
TRUNCATE TABLE inventario.DetalleEntrada RESTART IDENTITY CASCADE;
TRUNCATE TABLE inventario.DocumentoSalida RESTART IDENTITY CASCADE;
TRUNCATE TABLE inventario.DetalleSalida RESTART IDENTITY CASCADE;
TRUNCATE TABLE inventario.Cliente RESTART IDENTITY CASCADE;
TRUNCATE TABLE inventario.Proveedor RESTART IDENTITY CASCADE;
TRUNCATE TABLE inventario.Bodega RESTART IDENTITY CASCADE;
TRUNCATE TABLE inventario.Categoria RESTART IDENTITY CASCADE;