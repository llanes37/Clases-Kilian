-- ============================================================
-- ! Soluciones practica 01: ver datos con SELECT
-- ============================================================
-- * Si esto falla con "no such table ...":
-- * primero ejecuta scripts/00_reset_biblioteca_nivel0.sql

-- * 1) Ver toda la tabla libros (todas las columnas)
SELECT * FROM libros;

-- * 2) Ver solo nombre y ciudad de socios
SELECT nombre, ciudad
FROM socios;

-- * 3) Ver titulo y paginas de libros
SELECT titulo, paginas
FROM libros;

-- * 4) Usar alias (renombrar columnas en la salida)
SELECT titulo AS libro, genero AS tipo
FROM libros;

-- * 5) Ver datos basicos de prestamos
SELECT prestamo_id, fecha_prestamo
FROM prestamos;
