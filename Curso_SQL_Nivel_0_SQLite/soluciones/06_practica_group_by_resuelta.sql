-- ============================================================
-- ! Soluciones practica 06: COUNT y GROUP BY
-- ============================================================

-- * 1) Total de libros
SELECT COUNT(*) AS total_libros
FROM libros;

-- * 2) Total de prestamos
SELECT COUNT(*) AS total_prestamos
FROM prestamos;

-- * 3) Libros por genero
SELECT genero, COUNT(*) AS total_libros
FROM libros
GROUP BY genero;

-- * 4) Prestamos por estado devuelto (SI/NO)
SELECT devuelto, COUNT(*) AS total_prestamos
FROM prestamos
GROUP BY devuelto;

-- * 5) Prestamos por socio (bonito con nombre) y ordenado
SELECT s.nombre, COUNT(*) AS total_prestamos
FROM prestamos p
JOIN socios s ON p.socio_id = s.socio_id
GROUP BY s.nombre
ORDER BY total_prestamos DESC;
