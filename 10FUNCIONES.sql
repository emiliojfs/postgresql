-- FUNCIONES, DEVUELVEN 0 O 1 UN VALOR
CREATE FUNCTION saludar()
RETURNS character varying
AS
	$$
	DECLARE
		nombre character varying;
	BEGIN
		RETURN 'Hola soy yo';
	END;
	$$
	LANGUAGE plpgsql;
--ejecutamos	
	SELECT saludar();
	SELECT cliente_nombre, cliente_apellido, saludar() FROM cliente;

-- PROCEDIMIENTO ALMACENADOS, DEVUELVEN 0,1 O MAS VALORES
