use consultas;
#ejer01
SELECT nombre,precio from producto;
#ejer02
SELECT * from producto;
#ejer03
SELECT precio from producto WHERE precio;
#ejer04
SELECT nombre,concat('$ ', round(precio * 1.1,2)) AS Precio_Usd 
FROM producto;
#ejer05
SELECT nombre AS "nombre de producto", concat('€ ',round (precio)) AS euros, 
concat ('$ ', round (precio * 1.1,2)) AS dólares FROM producto;
#ejer06
SELECT UPPER(nombre) AS nombre,precio
FROM producto;
#ejer07
SELECT LOWER(nombre) AS nombre,precio
FROM producto;
#ejer08
SELECT nombre, UPPER(SUBSTRING(nombre FROM 1 FOR 2)) AS iniciales
FROM fabricante;
#ejer09
SELECT nombre, round(precio) AS Precio_Redondiado
FROM producto;
#ejer10
SELECT nombre, TRUNCATE(precio, 0) AS Precio_Truncado
FROM producto;
#ejer11
SELECT f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante
FROM fabricante f
JOIN producto p ON f.codigo = p.fabricante
ORDER BY f.codigo;
#ejer12
SELECT DISTINCT f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante
FROM fabricante f JOIN producto p ON f.codigo = p.fabricante
ORDER BY f.codigo;
#ejer13
SELECT nombre FROM fabricante 
ORDER BY nombre ASC;
#ejer14
SELECT nombre FROM fabricante 
ORDER BY nombre DESC;
#ejer15
SELECT nombre, precio FROM producto
ORDER BY nombre ASC, precio DESC;
#ejer16
SELECT * FROM fabricante LIMIT 5;
#ejer17
SELECT * FROM fabricante LIMIT 3, 2;
#ejer18
SELECT nombre, precio FROM producto 
ORDER BY precio ASC LIMIT 1;
#ejer19
SELECT nombre, precio FROM producto
ORDER BY precio DESC LIMIT 1;
#ejer20
SELECT nombre FROM producto
WHERE fabricante = 2;
#ejer21
SELECT nombre FROM producto 
WHERE precio <= 120;
#ejer22
SELECT nombre FROM producto
WHERE precio >=400;
#ejer23
SELECT nombre FROM producto
WHERE NOT (precio >=400);
#ejer24
SELECT nombre FROM producto
WHERE precio >= 80 AND precio <=300;
#ejer25
SELECT nombre FROM producto
WHERE precio BETWEEN 60 AND 200;
#ejer26
SELECT nombre, precio, fabricante FROM producto
WHERE precio > 200 AND fabricante =6;
#ejer27
SELECT nombre, fabricante FROM producto
WHERE fabricante = 1 OR fabricante = 3 OR fabricante = 5;
#ejer28
SELECT nombre, fabricante FROM producto 
WHERE fabricante IN (1,3,5);
#ejer29
SELECT nombre, precio * 100 céntimos
FROM producto;
#ejer30
SELECT nombre FROM fabricante
WHERE nombre LIKE 'S%';
#ejer31
SELECT nombre FROM fabricante
WHERE nombre LIKE '%e';
#ejer32
SELECT nombre FROM fabricante
WHERE nombre LIKE '%w%';
#ejer33
