--paginar
CREATE OR REPLACE FUNCTION inventario.consulta_paginada(_registros integer, _pagina integer)
RETURNS SETOF inventario.usuario AS
$BODY$
DECLARE
	_offset integer;
BEGIN
	_offset := (_pagina - 1) * _registros;
	RETURN QUERY 
	SELECT * FROM inventario.usuario ORDER BY id LIMIT _registros OFFSET _offset;
END;
$BODY$
LANGUAGE plpgsql;


--llamada a la funcion
SELECT * FROM inventario.consulta_paginada(5,1);




-- tipos de datos
-- %type
	-- permite copiar el tipo de dato exacto de una columna (atributo) de una tabla (relacion);
	DECLARE
	mi_variable inventario.usuario%type;
-- %rowtype
	-- permite copiar la estructura de una tabla para almacenar la informacion de una fila (registro) de una tabla (relacion);
	DECLARE
	mi_registro inventario.usuario%rowtype;
	mi_registro.id;