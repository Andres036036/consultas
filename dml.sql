DELIMITER $$
CREATE PROCEDURE insertar_fabricante (
  IN nombre_fab VARCHAR(100)
)
BEGIN
  INSERT INTO fabricante(nombre) VALUES (nombre_fab);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertar_producto (
  IN nombre_prod VARCHAR(100),
  IN precio_prod DOUBLE,
  IN cod_fab INT
)
BEGIN
  INSERT INTO producto(nombre, precio, codigo_fabricante) 
  VALUES (nombre_prod, precio_prod, cod_fab);
END$$
DELIMITER ;