CREATE TABLE fabricante (
	codigo serial PRIMARY KEY,
	nombre VARCHAR(100)
);
CREATE TABLE producto (
	codigo serial PRIMARY KEY,
	nombre VARCHAR(100),
	precio NUMERIC(10),
	codigo_fabricante serial
);

ALTER TABLE producto
ADD CONSTRAINT fk_codigo
FOREIGN KEY (codigo_fabricante)
REFERENCES fabricante (codigo)

CREATE PROCEDURE Dato_fac2 (nombre_fac VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO fabricante (nombre)
VALUES (nombre_fac);
END;
$$;

CALL  Dato_fac2('Asus');
CALL  Dato_fac2('Lenovo');
CALL  Dato_fac2('Hewlett-Packard');
CALL  Dato_fac2('Samsung');
CALL  Dato_fac2('Seagate');
CALL  Dato_fac2('Crucial');
CALL  Dato_fac2('Gigabyte');
CALL  Dato_fac2('Huawei');
CALL  Dato_fac2('Xiaomi');

select * from fabricante
