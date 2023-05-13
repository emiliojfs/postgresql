--*si no se definio las relaciones de las tablas al momento de crearlas, se puede agregar despues*-- ALTER TABLE nombre ADD CONSTRAINT nombre_constraint FOREIGN KEY (nombre_columna) REFERENCES nombre_tabla (nombre_columna) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE producto
    ADD CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id) REFERENCES Categoria (categoria_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    ADD CONSTRAINT fk_producto_proveedor FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id) ON UPDATE RESTRICT ON DELETE RESTRICT; 

ALTER TABLE documentoEntrada
    ADD CONSTRAINT fk_documentoEntrada_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    ADD CONSTRAINT fk_documentoEntrada_bodega FOREIGN KEY (bodega_id) REFERENCES Bodega (bodega_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    ADD CONSTRAINT fk_documentoEntrada_proveedor FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE detalleEntrada
    ADD CONSTRAINT fk_detalleEntrada_producto FOREIGN KEY (producto_id) REFERENCES Producto (producto_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    ADD CONSTRAINT fk_detalleEntrada_documentoEntrada FOREIGN KEY (documentoEntrada_id) REFERENCES DocumentoEntrada (documentoEntrada_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE documentoSalida
    ADD CONSTRAINT fk_documentoSalida_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    ADD CONSTRAINT fk_documentoSalida_bodega FOREIGN KEY (bodega_id) REFERENCES Bodega (bodega_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    ADD CONSTRAINT fk_documentoSalida_cliente FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE detalleSalida
    ADD CONSTRAINT fk_detalleSalida_producto FOREIGN KEY (producto_id) REFERENCES Producto (producto_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    ADD CONSTRAINT fk_detalleSalida_documentoSalida FOREIGN KEY (documentoSalida_id) REFERENCES DocumentoSalida (documentoSalida_id) ON UPDATE RESTRICT ON DELETE RESTRICT;