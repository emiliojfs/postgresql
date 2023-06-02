-- Creación de la tabla de auditoría
CREATE TABLE auditoria {
	consecutivo smallserial,
	nombre varchar(20),
	accion varchar(50),
	fecha timestamp DEFAULT now()
}

-- Creación de la función
CREATE OR REPLACE FUNCTION fn_mostrar ventas(_nombre character varying)
RETURNS SETOF ventas
AS
$BODY$
BEGIN
	-- Registrar auditoría
	INSERT INTO auditoria (consecutivo, nombre, accion, fecha)
	VALUES (DEFAULT, _nombre, 'CONSULTA VENTAS', DEFAULT);
	-- Devuelve lo solicitado
	RETURN QUERY SELECT * FROM ventas;
END
$BODY$
LANGUAGE plpgsql;

-- Llamado de la función
SELECT * FROM auditoria;
SELECT * FROM fn_mostrar_ventas('Alexys Lozada');