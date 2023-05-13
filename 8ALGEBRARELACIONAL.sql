
--Seleccion 
    SELECT campo1,campo2,....campoN FROM tabla WHERE condicion;
    SELECT * FROM Empleados WHERE salario > 50000;
--Proyeccion
    SELECT campo1,campo2,....campoN FROM tabla;
    SELECT nombre, apellido FROM Empleados;
--Renombramiento
    SELECT campo1 AS nuevo_nombre1, campo2 AS nuevo_nombre2,....campoN AS nuevo_nombreN FROM tabla;

    ALTER TABLE Empleados RENAME COLUMN nombre TO primer_nombre;

--Union
    SELECT campo1,campo2,....campoN FROM tabla1 UNION SELECT campo1,campo2,....campoN FROM tabla2;
    SELECT * FROM Empleados UNION SELECT * FROM Departamentos;
--Interseccion
    SELECT campo1,campo2,....campoN FROM tabla1 INTERSECT SELECT campo1,campo2,....campoN FROM tabla2;
    SELECT * FROM Empleados WHERE departamento='ventas' INTERSECT SELECT * FROM Empleados WHERE departamento='marketing';
--Diferencia
    SELECT campo1,campo2,....campoN FROM tabla1 EXCEPT SELECT campo1,campo2,....campoN FROM tabla2;
    SELECT * FROM Empleados WHERE departamento='ventas' EXCEPT SELECT * FROM Empleados WHERE departamento='marketing';
--Division  
    SELECT campo1,campo2,....campoN FROM tabla1 WHERE campo1 IN (SELECT campo1 FROM tabla2);
--Agregacion
    SELECT campo1,campo2,....campoN FROM tabla GROUP BY campo1,campo2,....campoN;

--Producto cartesiano
    SELECT campo1,campo2,....campoN FROM tabla1, tabla2,....tablaN;
    SELECT * FROM Empleados, Departamentos;

    --natural join
    SELECT campo1,campo2,....campoN FROM tabla1 NATURAL JOIN tabla2;
    SELECT * FROM Empleados NATURAL JOIN Departamentos;

    --Join 
    SELECT campo1,campo2,....campoN FROM tabla1 JOIN tabla2 ON condicion;
    SELECT * FROM Empleados JOIN Departamentos ON Empleados.departamento=Departamentos.departamento;   

    --cross join
    SELECT campo1,campo2,....campoN FROM tabla1 CROSS JOIN tabla2;
    SELECT * FROM Empleados CROSS JOIN Departamentos;

    --left join
    SELECT campo1,campo2,....campoN FROM tabla1 LEFT JOIN tabla2 ON condicion;
    SELECT * FROM Empleados LEFT JOIN Departamentos ON Empleados.departamento=Departamentos.departamento;

    --right join
    SELECT campo1,campo2,....campoN FROM tabla1 RIGHT JOIN tabla2 ON condicion;
    SELECT * FROM Empleados RIGHT JOIN Departamentos ON Empleados.departamento=Departamentos.departamento;

    --inner join
    SELECT campo1,campo2,....campoN FROM tabla1 INNER JOIN tabla2 ON condicion;
    SELECT * FROM Empleados INNER JOIN Departamentos ON Empleados.departamento=Departamentos.departamento;
    
