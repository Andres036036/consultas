CREATE TABLE fabricante (
codigo serial PRIMARY KEY,
nombre VARCHAR(100));

CREATE TABLE producto (
codigo serial PRIMARY KEY,
nombre VARCHAR(100),
precio NUMERIC(10, 2),
codigo_fabricante INTEGER);

ALTER TABLE producto
ADD CONSTRAINT fk_codigo
FOREIGN KEY (codigo_fabricante)
REFERENCES fabricante (codigo);

CREATE OR REPLACE PROCEDURE Dato_fac2(IN nombre_fac VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO fabricante (nombre)
VALUES (nombre_fac);
END;
$$;

CREATE OR REPLACE PROCEDURE Dato_pro2(
IN nombre_fac VARCHAR(100),
IN precio_fac NUMERIC(10,2),
IN fabricante_fac INT)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO producto (nombre, precio, codigo_fabricante)
VALUES (nombre_fac, precio_fac, fabricante_fac);
END;
$$;

CALL Dato_fac2('Asus');
CALL Dato_fac2('Lenovo');
CALL Dato_fac2('Hewlett-Packard');
CALL Dato_fac2('Samsung');
CALL Dato_fac2('Seagate');
CALL Dato_fac2('Crucial');
CALL Dato_fac2('Gigabyte');
CALL Dato_fac2('Huawei');
CALL Dato_fac2('Xiaomi');

SELECT * FROM fabricante;

CALL Dato_pro2('Disco duro SATA3 1TB', 86.99, 5);
CALL Dato_pro2('Memoria RAM DDR4 8GB ', 120, 6);
CALL Dato_pro2('Disco SSD 1 TB', 150.99, 4);
CALL Dato_pro2('GeForce GTX 1050Ti', 185, 7);
CALL Dato_pro2('GeForce GTX 1080 Xtreme', 755, 6);
CALL Dato_pro2('Monitor 24 LED Full HD', 202, 1);
CALL Dato_pro2('Monitor 27 LED Full HD', 86.99, 1);
CALL Dato_pro2('Portátil Yoga 520', 559, 2);
CALL Dato_pro2('Portátil Ideapd 320', 444, 2);
CALL Dato_pro2('Impresora HP Deskjet 3720', 59.99, 3);
CALL Dato_pro2('Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT * FROM producto;