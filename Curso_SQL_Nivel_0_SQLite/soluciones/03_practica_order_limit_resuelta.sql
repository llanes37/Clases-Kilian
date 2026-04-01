-- ============================================================
-- ! Soluciones practica 03: ORDER BY y LIMIT
-- ============================================================

-- * 1) Socios ordenados por nombre
SELECT nombre, ciudad
FROM socios
ORDER BY nombre ASC;

-- * 2) Libros del mas corto al mas largo
SELECT titulo, paginas
FROM libros
ORDER BY paginas ASC;

-- * 3) Top 3 libros mas largos
SELECT titulo, paginas
FROM libros
ORDER BY paginas DESC
LIMIT 3;

-- * 4) 2 primeros socios ordenados por ciudad
SELECT nombre, ciudad
FROM socios
ORDER BY ciudad ASC
LIMIT 2;

-- * 5) Prestamos mas recientes primero
SELECT prestamo_id, fecha_prestamo
FROM prestamos
ORDER BY fecha_prestamo DESC;
