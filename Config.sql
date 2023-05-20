--azure
--concomtic
--Port 5432
--User: admin_server
--Password: ******

--Crear Backup
    --cmd
        --*ubicarse en carpeta donde se desea guardar el backup*
            pg_dump --host localhost --port 5432 --username postgres --verbose --file backup20230502.buckup matricula
            pg_dump --host localhost --port 5432 --username postgres --verbose --inserts --column-inserts --file backup20230502_2.buckup matricula

--Restaurar
    -- En postgresql crear la base de datos con el usuario y contraseña anteriormente creados
        \i nombredel_backup.buckup
