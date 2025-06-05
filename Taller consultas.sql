use consultas;
-- 1.
SELECT nombre FROM producto;

-- 2.
SELECT nombre, CONCAT('$', precio) AS precio_usd FROM producto;

-- 3.
SELECT * FROM producto;

-- 4. 
SELECT nombre,
       CONCAT('€', ROUND(precio * 0.93, 2)) AS precio_eur,
       CONCAT('$', precio) AS precio_usd
FROM producto;

-- 5. 
SELECT nombre AS "nombre de producto",
       CONCAT('€', ROUND(precio * 0.93, 2)) AS euros,
       CONCAT('$', precio) AS dólares
FROM producto;

-- 6. 
SELECT UPPER(nombre) AS nombre,
       CONCAT('$', precio) AS precio_usd
FROM producto;

-- 7. 
SELECT LOWER(nombre) AS nombre,
       CONCAT('$', precio) AS precio_usd
FROM producto;

-- 8. 
SELECT nombre,
       UPPER(LEFT(nombre, 2)) AS iniciales
FROM fabricante;

-- 9. 
SELECT nombre,
       CONCAT('$', ROUND(precio)) AS precio_redondeado
FROM producto;

-- 10. 
SELECT nombre,
       CONCAT('$', TRUNCATE(precio, 0)) AS precio_truncado
FROM producto;

-- 11. 
SELECT codigo_fabricante FROM producto;

-- 12. 
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. 
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. 
SELECT nombre,
       CONCAT('$', precio) AS precio_usd
FROM producto
ORDER BY nombre ASC, precio DESC;

-- 16. 
SELECT * FROM fabricante LIMIT 5;

-- 17. 
SELECT * FROM fabricante LIMIT 3, 2;

-- 18. 
SELECT nombre,
       CONCAT('$', precio) AS precio_usd
FROM producto
ORDER BY precio ASC LIMIT 1;

-- 19. 
SELECT nombre,
       CONCAT('$', precio) AS precio_usd
FROM producto
ORDER BY precio DESC LIMIT 1;

-- 20. 
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21. 
SELECT nombre
FROM producto
WHERE ROUND(precio * 0.93, 2) <= 120;

-- 22. 
SELECT nombre
FROM producto
WHERE ROUND(precio * 0.93, 2) >= 400;

-- 23. 
SELECT nombre
FROM producto
WHERE NOT ROUND(precio * 0.93, 2) >= 400;

-- 24. 
SELECT nombre
FROM producto
WHERE ROUND(precio * 0.93, 2) >= 80 AND ROUND(precio * 0.93, 2) <= 300;

-- 25. 
SELECT nombre
FROM producto
WHERE ROUND(precio * 0.93, 2) BETWEEN 60 AND 200;

-- 26. 
SELECT *
FROM producto
WHERE ROUND(precio * 0.93, 2) > 200 AND codigo_fabricante = 6;

-- 27. 
SELECT *
FROM producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

-- 28. 
SELECT *
FROM producto
WHERE codigo_fabricante IN (1, 3, 5);

-- 29. 
SELECT nombre,
       ROUND(precio * 100) AS centimos
FROM producto;

-- 30. 
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';

-- 31.
SELECT nombre FROM fabricante WHERE nombre LIKE '%e';

-- 32. 
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

-- 33. 
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;

-- 34. 
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

-- 35. 
SELECT nombre
FROM producto
WHERE nombre LIKE '%Monitor%' AND ROUND(precio * 0.93, 2) < 215;

-- 36. 
SELECT nombre,
       CONCAT('€', ROUND(precio * 0.93, 2)) AS precio_eur
FROM producto
WHERE ROUND(precio * 0.93, 2) >= 180
ORDER BY precio DESC, nombre ASC;

#1.1.4 Consultas multitabla (Composición interna)
-- 1. 
SELECT p.nombre AS producto,
       CONCAT('$', p.precio) AS precio_usd,
       f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 2. 
SELECT p.nombre AS producto,
       CONCAT('$', p.precio) AS precio_usd,
       f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;

-- 3. 
SELECT p.codigo AS id_producto,
       p.nombre AS producto,
       f.codigo AS id_fabricante,
       f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 4. 
SELECT p.nombre AS producto,
       CONCAT('€', ROUND(p.precio * 0.93, 2)) AS precio_eur,
       f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

-- 5. 
SELECT p.nombre AS producto,
       CONCAT('€', ROUND(p.precio * 0.93, 2)) AS precio_eur,
       f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- 6. 
SELECT p.nombre AS producto,
       CONCAT('$', p.precio) AS precio_usd
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

-- 7. 
SELECT p.nombre AS producto,
       CONCAT('€', ROUND(p.precio * 0.93, 2)) AS precio_eur
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND ROUND(p.precio * 0.93, 2) > 200;

-- 8. 
SELECT p.nombre AS producto,
       CONCAT('$', p.precio) AS precio_usd,
       f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus'
   OR f.nombre = 'Hewlett-Packard'
   OR f.nombre = 'Seagate';

-- 9. 
SELECT p.nombre AS producto,
       CONCAT('$', p.precio) AS precio_usd,
       f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. 
SELECT p.nombre AS producto,
       CONCAT('€', ROUND(p.precio * 0.93, 2)) AS precio_eur
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%e';

-- 11. 
SELECT p.nombre AS producto,
       CONCAT('$', p.precio) AS precio_usd
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';

-- 12. 
SELECT p.nombre AS producto,
       CONCAT('€', ROUND(p.precio * 0.93, 2)) AS precio_eur,
       f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE ROUND(p.precio * 0.93, 2) >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- 13. 
SELECT DISTINCT f.codigo AS id_fabricante,
       f.nombre AS fabricante
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante;

#1.1.5 Consultas multitabla (Composición externa)
-- 1. 
SELECT f.nombre AS fabricante,
       p.nombre AS producto,
       CONCAT('$', p.precio) AS precio_usd
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 2. 
SELECT f.nombre AS fabricante
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo IS NULL;

-- 3. 
SELECT p.nombre AS producto
FROM producto p
RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.codigo_fabricante IS NULL;

#1.1.6 Consultas resumen
-- 1. 
SELECT COUNT(*) AS total_productos FROM producto;

-- 2. 
SELECT COUNT(*) AS total_fabricantes FROM fabricante;

-- 3. 
SELECT COUNT(DISTINCT codigo_fabricante) AS total_fabricantes_diferentes FROM producto;

-- 4. 
SELECT AVG(precio) AS precio_medio_usd FROM producto;

-- 5. 
SELECT MIN(precio) AS precio_minimo_usd FROM producto;

-- 6. 
SELECT MAX(precio) AS precio_maximo_usd FROM producto;

-- 7. 
SELECT nombre, precio AS precio_usd
FROM producto
ORDER BY precio ASC
LIMIT 1;

-- 8. 
SELECT nombre, precio AS precio_usd
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- 9. 
SELECT SUM(precio) AS suma_precios_usd FROM producto;

-- 10. 
SELECT COUNT(*) AS total_productos_asus
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 11. 
SELECT AVG(precio) AS precio_medio_asus_usd
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 12. 
SELECT MIN(precio) AS precio_minimo_asus_usd
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 13. 
SELECT MAX(precio) AS precio_maximo_asus_usd
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 14. 
SELECT SUM(precio) AS suma_precios_asus_usd
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 15. 
SELECT
    MAX(precio) AS precio_maximo_usd,
    MIN(precio) AS precio_minimo_usd,
    AVG(precio) AS precio_medio_usd,
    COUNT(*) AS total_productos
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial';

-- 16. 
SELECT f.nombre, COUNT(p.codigo) AS total_productos
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
ORDER BY total_productos DESC;

-- 17. 
SELECT f.nombre,
       MAX(p.precio) AS precio_maximo_usd,
       MIN(p.precio) AS precio_minimo_usd,
       AVG(p.precio) AS precio_medio_usd
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- 18. 
SELECT p.codigo_fabricante,
       ROUND(MAX(precio * 0.875708), 2) AS precio_maximo_eur,
       ROUND(MIN(precio * 0.875708), 2) AS precio_minimo_eur,
       ROUND(AVG(precio * 0.875708), 2) AS precio_medio_eur,
       COUNT(*) AS total_productos
FROM producto p
GROUP BY p.codigo_fabricante
HAVING ROUND(AVG(precio * 0.875708), 2) > 200;
-- 19. 
SELECT f.nombre,
       ROUND(MAX(p.precio * 0.875708), 2) AS precio_maximo_eur,
       ROUND(MIN(p.precio * 0.875708), 2) AS precio_minimo_eur,
       ROUND(AVG(p.precio * 0.875708), 2) AS precio_medio_eur,
       COUNT(*) AS total_productos
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING ROUND(AVG(p.precio * 0.875708), 2) > 200;

-- 20. 
SELECT COUNT(*) AS total_productos_180eur
FROM producto
WHERE ROUND(precio * 0.875708, 2) >= 180;

-- 21. 
SELECT f.nombre, COUNT(p.codigo) AS total_productos
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE ROUND(p.precio * 0.875708, 2) >= 180
GROUP BY f.nombre;

-- 22. 
SELECT codigo_fabricante, AVG(precio) AS precio_medio_usd
FROM producto
GROUP BY codigo_fabricante;

-- 23. 
SELECT f.nombre, AVG(p.precio) AS precio_medio_usd
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- 24. 
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING ROUND(AVG(p.precio * 0.875708), 2) >= 150;

-- 25. 
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.codigo) >= 2;

-- 26. 
SELECT f.nombre, COUNT(p.codigo) AS total
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE ROUND(p.precio * 0.875708, 2) >= 220
GROUP BY f.nombre;

-- 27. 
SELECT f.nombre, COUNT(p.codigo) AS total
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante AND ROUND(p.precio * 0.875708, 2) >= 220
GROUP BY f.nombre;

-- 28. 
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING ROUND(SUM(p.precio * 0.875708), 2) > 1000;

-- 29. 
SELECT p.nombre, p.precio AS precio_usd, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo = p.codigo_fabricante
WHERE p.precio = (
    SELECT MAX(p2.precio)
    FROM producto p2
    WHERE p2.codigo_fabricante = p.codigo_fabricante
)
ORDER BY f.nombre ASC;

#1.1.7 Subconsultas (En la cláusula WHERE)
#1.1.7.1 Con operadores básicos de comparación
-- 1. 
SELECT *
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Lenovo'
);

-- 2. 
SELECT *
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);

-- 3. 
SELECT nombre
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);

-- 4. 
SELECT nombre
FROM producto
WHERE precio = (
    SELECT MIN(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Hewlett-Packard'
    )
);

-- 5. 
SELECT *
FROM producto
WHERE precio >= (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);

-- 6. 
SELECT *
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Asus'
)
AND precio > (
    SELECT AVG(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Asus'
    )
);
-- 1.1.7.2 Subconsultas con ALL y ANY
-- 7. 
SELECT nombre, precio
FROM producto
WHERE precio >= ALL (
    SELECT precio
    FROM producto
);

-- 8. 
SELECT nombre, precio
FROM producto
WHERE precio <= ALL (
    SELECT precio
    FROM producto
);

-- 9. 
SELECT nombre
FROM fabricante
WHERE codigo = ANY (
    SELECT DISTINCT codigo_fabricante
    FROM producto
);

-- 10. 
SELECT nombre
FROM fabricante
WHERE codigo <> ALL (
    SELECT DISTINCT codigo_fabricante
    FROM producto
);
-- 1.1.7.3 Subconsultas con IN y NOT IN
-- 11. 
SELECT nombre
FROM fabricante
WHERE codigo IN (
    SELECT DISTINCT codigo_fabricante
    FROM producto
);

-- 12. 
SELECT nombre
FROM fabricante
WHERE codigo NOT IN (
    SELECT DISTINCT codigo_fabricante
    FROM producto
);
-- 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
-- 13. 
SELECT nombre
FROM fabricante f
WHERE EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.codigo_fabricante = f.codigo
);

-- 14. 
SELECT nombre
FROM fabricante f
WHERE NOT EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.codigo_fabricante = f.codigo
);
-- 1.1.7.5 Subconsultas correlacionadas
-- 15. 
SELECT f.nombre AS fabricante, p.nombre AS producto, p.precio
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = f.codigo
);

-- 16. 
SELECT *
FROM producto p
WHERE precio >= (
    SELECT AVG(precio)
    FROM producto
    WHERE codigo_fabricante = p.codigo_fabricante
);

-- 17. 
SELECT nombre
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);
#1.1.8 Subconsultas (En la cláusula HAVING)
-- 18. 
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.codigo) = (
    SELECT COUNT(p2.codigo)
    FROM producto p2
    WHERE p2.codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);