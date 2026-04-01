-- ============================================================
-- ! Practica 05: relacionar tablas con JOIN
-- ============================================================
-- * Meta: dejar de ver ids sueltos y empezar a ver informacion completa.
-- * Requisito: antes ejecuta scripts/00_reset_biblioteca_nivel0.sql
-- * Idea:
-- *   prestamos tiene socio_id y libro_id
-- *   JOIN sirve para traer nombre y titulo desde otras tablas
-- *
-- * Truco de lectura:
-- *   p = prestamos
-- *   s = socios
-- *   l = libros

-- ? Ejemplo guiado
SELECT p.prestamo_id, s.nombre, l.titulo, p.devuelto
FROM prestamos p
JOIN socios s ON p.socio_id = s.socio_id
JOIN libros l ON p.libro_id = l.libro_id;
-- * EXPECT: deberias ver columnas "prestamo_id", "nombre", "titulo" y "devuelto".

-- TODO: muestra prestamo_id, nombre del socio y fecha_prestamo.
-- * Plantilla:
-- SELECT p.prestamo_id, s.nombre, p.fecha_prestamo
-- FROM prestamos p
-- JOIN socios s ON p.socio_id = s.socio_id;

-- TODO: muestra prestamo_id, titulo del libro y devuelto.
-- * Plantilla:
-- SELECT p.prestamo_id, l.titulo, p.devuelto
-- FROM prestamos p
-- JOIN libros l ON p.libro_id = l.libro_id;

-- TODO: muestra nombre del socio, titulo del libro y fecha_prestamo.
-- * Plantilla:
-- SELECT s.nombre, l.titulo, p.fecha_prestamo
-- FROM prestamos p
-- JOIN socios s ON p.socio_id = s.socio_id
-- JOIN libros l ON p.libro_id = l.libro_id;

-- TODO: muestra solo los prestamos no devueltos con nombre y titulo.
-- * Plantilla:
-- SELECT s.nombre, l.titulo, p.fecha_prestamo, p.devuelto
-- FROM prestamos p
-- JOIN socios s ON p.socio_id = s.socio_id
-- JOIN libros l ON p.libro_id = l.libro_id
-- WHERE p.devuelto = 'NO';

-- TODO: intenta explicar en un comentario por que esta consulta es mejor que ver solo ids.

-- * Idea clave:
-- * JOIN sirve para traducir ids a informacion que una persona puede leer.
-- ? Error tipico:
-- * Si escribes mal el ON (por ejemplo cruzas ids incorrectos), el resultado sera falso.
