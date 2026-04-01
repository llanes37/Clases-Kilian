-- ============================================================
-- ! Practica 06: contar y agrupar
-- ============================================================
-- * Meta: resumir datos en vez de mirar fila por fila.
-- * Requisito: antes ejecuta scripts/00_reset_biblioteca_nivel0.sql
-- * Idea:
-- *   COUNT(*) cuenta filas
-- *   GROUP BY agrupa por una columna

-- ? Ejemplo guiado
SELECT ciudad, COUNT(*) AS total_socios
FROM socios
GROUP BY ciudad;
-- * EXPECT: varias filas, una por ciudad.

-- TODO: cuenta cuantos libros hay en total.
-- * Plantilla:
-- SELECT COUNT(*) AS total_libros FROM libros;

-- TODO: cuenta cuantos prestamos hay en total.
-- * Plantilla:
-- SELECT COUNT(*) AS total_prestamos FROM prestamos;

-- TODO: muestra cuantos libros hay por genero.
-- * Plantilla:
-- SELECT genero, COUNT(*) AS total
-- FROM libros
-- GROUP BY genero;

-- TODO: muestra cuantos prestamos hay segun si estan devueltos o no.
-- * Plantilla:
-- SELECT devuelto, COUNT(*) AS total
-- FROM prestamos
-- GROUP BY devuelto;

-- TODO: muestra cuantas veces aparece cada socio en la tabla prestamos.
-- TODO: si quieres dejarlo mas bonito, usa JOIN para ver el nombre del socio.
-- * Plantilla (version simple con ids):
-- SELECT socio_id, COUNT(*) AS total
-- FROM prestamos
-- GROUP BY socio_id;
-- * Plantilla (version bonita con nombre):
-- SELECT s.nombre, COUNT(*) AS total
-- FROM prestamos p
-- JOIN socios s ON p.socio_id = s.socio_id
-- GROUP BY s.nombre;

-- TODO: ordena el resultado anterior de mayor a menor.
-- * Pista: usa ORDER BY total DESC.

-- * Recuerda:
-- * COUNT(*) cuenta filas.
-- * GROUP BY junta filas parecidas.
