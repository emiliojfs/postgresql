--en postgresql existen ciclos: FOR y WHILE
CREATE OR REPLACE FUNCTION repetir_for()
RETURNS void
AS
$BODY$
DECLARE
  iteracion integer;
BEGIN
  FOR iteracion IN 1..10 LOOP
    RAISE NOTICE 'Voy en la iteración: %', iteracion;
  END LOOP;
END;
$BODY$

LANGUAGE plpgsql;

-- Ejecución

SELECT repetir_for();