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
SELECT nombre FROM fabricante
WHERE CHAR_LENGTH(nombre) = 4;
#ejer34
SELECT nombre FROM producto
WHERE nombre LIKE '%Portátil%';
#ejer35
SELECT nombre FROM producto
WHERE nombre LIKE '%Monitor%' AND precio < 215;
#ejer36
SELECT nombre, precio FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;

#1.1.4 Consultas multitabla (Composición interna)
#ejer1
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo;
#ejer2
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
ORDER BY f.nombre;
#ejer3
SELECT p.codigo AS id_producto, p.nombre AS producto,
f.codigo AS id_fabricante, f.nombre AS fabricante
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo;
#ejer4
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
ORDER BY p.precio ASC LIMIT 1;
#ejer5
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
ORDER BY p.precio DESC LIMIT 1;
#ejer6
SELECT p.* FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre = 'Lenovo';
#ejer7
SELECT p.* FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio > 200;
#ejer8
SELECT p.* FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' 
OR f.nombre = 'Seagate';
#ejer9
SELECT p.* FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
#ejer10
SELECT p.nombre AS producto, p.precio FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre LIKE '%e';
#ejer11
SELECT p.nombre AS producto, p.precio
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre LIKE '%w%';
#ejer12
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
#ejer13
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f
JOIN producto p ON f.codigo = p.fabricante;

#1.1.5 Consultas multitabla (Composición externa)
#ejer1
SELECT f.nombre AS fabricante, p.nombre AS producto
FROM fabricante f LEFT JOIN producto p ON f.codigo = p.fabricante;

SELECT f.nombre AS fabricante, p.nombre AS producto
FROM producto p
RIGHT JOIN fabricante f ON f.codigo = p.fabricante;
#ejer2
SELECT f.codigo, f.nombre FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.fabricante
WHERE p.codigo IS NULL;
#ejer3
SELECT p.nombre AS producto, f.nombre AS fabricante
FROM producto p LEFT JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.codigo IS NULL;
#Esta consulta devolverá cero resultados, porque que no hay productos huérfanos.}

#1.1.6 Consultas resumen
#ejer1
SELECT COUNT(*) AS total_productos
FROM producto;
#ejer2
SELECT COUNT(*) AS total_fabricantes
FROM fabricante;
#ejer3
SELECT COUNT(DISTINCT fabricante) AS fabricantes_distintos_en_producto
FROM producto;
#ejer4
SELECT AVG(precio) AS precio_medio
FROM producto;
#ejer5
SELECT MIN(precio) AS precio_minimo
FROM producto;
#ejer6
SELECT MAX(precio) AS precio_maximo
FROM producto;
#ejer7
SELECT nombre, precio
FROM producto
ORDER BY precio ASC LIMIT 1;
#ejer8
SELECT nombre, precio
FROM producto
ORDER BY precio DESC LIMIT 1;
#ejer9
SELECT SUM(precio) AS suma_total_precios
FROM producto;
#ejer10
SELECT COUNT(*) AS productos_asus
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre = 'Asus';
#ejer11
SELECT AVG(p.precio) AS media_precio_asus
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre = 'Asus';
#ejer12
SELECT MIN(p.precio) AS precio_minimo_asus
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre = 'Asus';
#ejer13
SELECT MAX(p.precio) AS precio_maximo_asus
FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre = 'Asus';
#ejer14
SELECT SUM(p.precio) AS suma_precios_asus
FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre = 'Asus';
#ejer15
SELECT MAX(p.precio) AS precio_maximo,
MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio,
COUNT(*) AS total_productos FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE f.nombre = 'Crucial';
#ejer16
SELECT f.nombre AS fabricante,
COUNT(p.codigo) AS total_productos FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.fabricante
GROUP BY f.codigo, f.nombre
ORDER BY total_productos DESC;
#ejer17
SELECT f.nombre AS fabricante,
MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo,
AVG(p.precio) AS precio_medio FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.fabricante
GROUP BY f.codigo, f.nombre;
#ejer18
SELECT p.fabricante AS id_fabricante, MAX(p.precio) AS precio_maximo,
MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio,
COUNT(*) AS total_productos FROM producto p
GROUP BY p.fabricante HAVING AVG(p.precio) > 200;
#ejer19
SELECT f.nombre AS fabricante, MAX(p.precio) AS precio_maximo,
MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio,
COUNT(*) AS total_productos FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
GROUP BY f.codigo, f.nombre HAVING AVG(p.precio) > 200;
#ejer20
SELECT COUNT(*) AS productos_mayor_180
FROM producto WHERE precio >= 180;
#ejer21
SELECT f.nombre AS fabricante,COUNT(p.codigo) AS productos_mayor_180
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.fabricante AND p.precio >= 180
GROUP BY f.codigo, f.nombre;
#ejer22
SELECT fabricante AS id_fabricante, AVG(precio) AS precio_medio
FROM producto GROUP BY fabricante;
#ejer23
SELECT f.nombre AS fabricante, AVG(p.precio) AS precio_medio
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
GROUP BY f.codigo, f.nombre;
#ejere24
SELECT f.nombre AS fabricante
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
GROUP BY f.codigo, f.nombre HAVING AVG(p.precio) >= 150;
#ejer25
SELECT f.nombre AS fabricante FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
GROUP BY f.codigo, f.nombre HAVING COUNT(p.codigo) >= 2;
#ejer26
SELECT f.nombre AS nombre, COUNT(p.codigo) AS total
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
WHERE p.precio >= 220 GROUP BY f.codigo, f.nombre
HAVING COUNT(p.codigo) > 0;
#ejer27
SELECT f.nombre AS nombre, COUNT(p.codigo) AS total
FROM fabricante f LEFT JOIN producto p 
ON f.codigo = p.fabricante AND p.precio >= 220
GROUP BY f.codigo, f.nombre
ORDER BY total DESC, nombre;
#ejer28
SELECT f.nombre AS fabricante FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
GROUP BY f.codigo, f.nombre HAVING SUM(p.precio) > 1000;
#ejer29
SELECT p.nombre AS producto,p.precio,f.nombre AS fabricante
FROM producto p JOIN fabricante f ON p.fabricante = f.codigo
WHERE (p.fabricante, p.precio) IN (SELECT fabricante, MAX(precio)
FROM producto GROUP BY fabricante
) ORDER BY f.nombre ASC;

#1.1.7 Subconsultas (En la cláusula WHERE)
#1.1.7.1 Con operadores básicos de comparación
#ejer1
SELECT * FROM producto
WHERE fabricante = (SELECT codigo FROM fabricante
WHERE nombre = 'Lenovo');
#ejer2
SELECT * FROM producto
WHERE precio = (SELECT MAX(precio)
FROM producto WHERE fabricante = (
SELECT codigo FROM fabricante
WHERE nombre = 'Lenovo'));
#ejer3
SELECT nombre FROM producto
WHERE precio = (SELECT MAX(precio)
FROM producto WHERE fabricante = (
SELECT codigo FROM fabricante
WHERE nombre = 'Lenovo'))
AND fabricante = (SELECT codigo
FROM fabricante WHERE nombre = 'Lenovo');
#ejer4
SELECT nombre FROM producto
WHERE precio = (SELECT MIN(precio)
FROM producto WHERE fabricante = (
SELECT codigo FROM fabricante
WHERE nombre = 'Hewlett-Packard'))
AND fabricante = (SELECT codigo
FROM fabricante WHERE nombre = 'Hewlett-Packard');
#ejer5
SELECT * FROM producto
WHERE precio >= (SELECT MAX(precio)
FROM producto WHERE fabricante = (
SELECT codigo FROM fabricante
WHERE nombre = 'Lenovo'));
#ejer6
SELECT *FROM producto
WHERE fabricante = (
SELECT codigo FROM fabricante
WHERE nombre = 'Asus')
AND precio > (SELECT AVG(precio)
FROM producto WHERE fabricante = (
SELECT codigo FROM fabricante
WHERE nombre = 'Asus'));

#1.1.7.2 Subconsultas con ALL y ANY
#ejer7
SELECT * FROM producto p1
WHERE precio >= ALL (
SELECT precio FROM producto);
#ejer8
SELECT * FROM producto p1
WHERE precio <= ALL (
SELECT precio FROM producto);
#ejer9
SELECT nombre FROM fabricante
WHERE codigo = ANY (
SELECT fabricante FROM producto);
#ejer10
SELECT nombre
FROM fabricante WHERE codigo <> ALL (
SELECT fabricante FROM producto);

#1.1.7.3 Subconsultas con IN y NOT IN
#ejer11
SELECT nombre FROM fabricante
WHERE codigo IN (
SELECT DISTINCT fabricante
FROM producto);
#ejer12
SELECT nombre FROM fabricante
WHERE codigo NOT IN (
SELECT DISTINCT fabricante
FROM producto);

#1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
#ejer13
SELECT nombre FROM fabricante f
WHERE EXISTS (SELECT 1
FROM producto p WHERE p.fabricante = f.codigo);
#ejer14
SELECT nombre FROM fabricante f
WHERE NOT EXISTS (SELECT 1
FROM producto p WHERE p.fabricante = f.codigo);

#1.1.7.5 Subconsultas correlacionadas
#ejer15
SELECT f.nombre AS fabricante,p.nombre AS producto,
p.precio FROM producto p
JOIN fabricante f ON p.fabricante = f.codigo
WHERE (p.fabricante, p.precio) IN (
SELECT fabricante, MAX(precio)
FROM producto GROUP BY fabricante);
#ejer16
SELECT * FROM producto p
WHERE precio >= (
SELECT AVG(precio) FROM producto
WHERE fabricante = p.fabricante);
#ejer17
SELECT nombre FROM producto
WHERE fabricante = (
SELECT codigo FROM fabricante
WHERE nombre = 'Lenovo')
AND precio = (
SELECT MAX(precio)FROM producto
WHERE fabricante = (SELECT codigo
FROM fabricante WHERE nombre = 'Lenovo'));

#1.1.8 Subconsultas (En la cláusula HAVING)
SELECT f.nombre FROM fabricante f
WHERE (SELECT COUNT(*)
FROM producto p WHERE p.fabricante = f.codigo
) = (
SELECT COUNT(*) FROM producto
WHERE fabricante = (SELECT codigo
FROM fabricante
WHERE nombre = 'Lenovo'));