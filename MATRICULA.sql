CREATE USER junior PASSWORD 'JUNIOR';
CREATE USER emilio PASSWORD 'EMILIO';

-- Path: MATRICULA.sql
CREATE DATABASE MATRICULA OWNER junior TABLESPACE tbls_laboratorios;


-- Path: MATRICULA.sql
CREATE TABLE propietarios (
    identificacion VARCHAR(20),
    nombre_nombres VARCHAR(50) NOT NULL,
    nombre_apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    CONSTRAINT pk_propietarios PRIMARY KEY (identificacion)
);

CREATE TABLE telefonos (
    identificacion VARCHAR(20),
    telefono VARCHAR(20),
    CONSTRAINT pk_telefonos PRIMARY KEY (identificacion, telefono),
    CONSTRAINT fk_telefonos_propietarios FOREIGN KEY (identificacion) REFERENCES propietarios (identificacion) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE departamentos (
    codigo SMALLSERIAL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_departamentos PRIMARY KEY (codigo)
);

CREATE TABLE ciudades (
    codigo SMALLSERIAL,
    nombre VARCHAR(100) NOT NULL,
    codigo_departamento SMALLINT NOT NULL,
    CONSTRAINT pk_ciudades PRIMARY KEY (codigo),
    CONSTRAINT fk_ciudades_departamentos FOREIGN KEY (codigo_departamento) REFERENCES departamentos (codigo) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE viviendas(
    codigo SMALLSERIAL,
    direccion_calle VARCHAR(100) NOT NULL,
    direccion_numero SMALLINT NOT NULL,
    habitantes SMALLINT NOT NULL,
    descripcion TEXT NOT NULL,
    identificacion_propietario VARCHAR(20) NOT NULL,
    codigo_ciudad SMALLINT NOT NULL,
    CONSTRAINT pk_viviendas PRIMARY KEY (codigo),
    CONSTRAINT fk_viviendas_propietarios FOREIGN KEY (identificacion_propietario) REFERENCES propietarios (identificacion) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_viviendas_ciudades FOREIGN KEY (codigo_ciudad) REFERENCES ciudades (codigo) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE contrato_alquileres (
    codigo SMALLSERIAL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    identificacion_propietario VARCHAR(20) NOT NULL,
    codigo_vivienda SMALLINT NOT NULL,
    CONSTRAINT pk_contrato_alquileres PRIMARY KEY (codigo),
    CONSTRAINT fk_contrato_alquileres_propietarios FOREIGN KEY (identificacion_propietario) REFERENCES propietarios (identificacion) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_contrato_alquileres_viviendas FOREIGN KEY (codigo_vivienda) REFERENCES viviendas (codigo) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE inquilinos (
    identificacion VARCHAR(20),
    nombre_nombres VARCHAR(50) NOT NULL,
    nombre_apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    CONSTRAINT pk_inquilinos PRIMARY KEY (identificacion)
);
--*se puede agregar los constraint al final como otro bloque de codigo de solo relaciones*-- ALTER TABLE nombre ADD CONSTRAINT nombre_constraint FOREIGN KEY (nombre_columna) REFERENCES nombre_tabla (nombre_columna) ON UPDATE RESTRICT ON DELETE RESTRICT;