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
