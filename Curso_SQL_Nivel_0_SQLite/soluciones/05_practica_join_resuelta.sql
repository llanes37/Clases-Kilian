-- ============================================================
-- ! Soluciones practica 05: JOIN
-- ============================================================
-- * Objetivo: ver nombre/titulo en vez de ids.

-- * 1) Prestamo + nombre del socio + fecha
SELECT p.prestamo_id, s.nombre, p.fecha_prestamo
FROM prestamos p
JOIN socios s ON p.socio_id = s.socio_id;

-- * 2) Prestamo + titulo del libro + devuelto
SELECT p.prestamo_id, l.titulo, p.devuelto
FROM prestamos p
JOIN libros l ON p.libro_id = l.libro_id;

-- * 3) Prestamo completo: nombre + titulo + fecha
SELECT s.nombre, l.titulo, p.fecha_prestamo
FROM prestamos p
JOIN socios s ON p.socio_id = s.socio_id
JOIN libros l ON p.libro_id = l.libro_id;

-- * 4) Solo prestamos NO devueltos (con nombre y titulo)
SELECT s.nombre, l.titulo, p.fecha_prestamo, p.devuelto
FROM prestamos p
JOIN socios s ON p.socio_id = s.socio_id
JOIN libros l ON p.libro_id = l.libro_id
WHERE p.devuelto = 'NO';

-- * Es mejor porque vemos nombres y titulos reales, no solo ids.
