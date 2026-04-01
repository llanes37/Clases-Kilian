-- ============================================================
-- ! Practica 01: ver datos con SELECT
-- ============================================================
-- * Meta: aprender a leer tablas sin tocar nada.
-- * Requisito: antes ejecuta scripts/00_reset_biblioteca_nivel0.sql
-- * Pista mental:
-- *   SELECT = quiero ver
-- *   FROM   = de donde lo saco (tabla)
-- *   *      = todas las columnas

-- ? Empieza siempre por mirar la tabla completa.
SELECT * FROM socios;

-- TODO: muestra todas las columnas de la tabla libros.
-- * Plantilla:
-- SELECT * FROM libros;

-- TODO: muestra solo nombre y ciudad de la tabla socios.
-- * Plantilla:
-- SELECT nombre, ciudad FROM socios;

-- TODO: muestra titulo y paginas de la tabla libros.
-- * Plantilla:
-- SELECT titulo, paginas FROM libros;

-- TODO: muestra titulo AS libro y genero AS tipo en la tabla libros.
-- * Plantilla:
-- SELECT titulo AS libro, genero AS tipo FROM libros;

-- TODO: muestra solo prestamo_id y fecha_prestamo de la tabla prestamos.
-- * Plantilla:
-- SELECT prestamo_id, fecha_prestamo FROM prestamos;

-- * Resultado esperado:
-- * Debes sentirte comodo leyendo una tabla y eligiendo columnas concretas.
-- ? Si te sale un error tipo "no such table socios":
-- * Significa que no ejecutaste el script base (00_reset...).
