-- ============================================================
-- ! Practica 03: ordenar y limitar
-- ============================================================
-- * Meta: ver primero lo mas importante.
-- * Requisito: antes ejecuta scripts/00_reset_biblioteca_nivel0.sql
-- * Idea:
-- *   ORDER BY ordena
-- *   LIMIT recorta filas

-- ? Ejemplo guiado
SELECT titulo, paginas
FROM libros
ORDER BY paginas DESC;
-- * EXPECT: "Viaje al centro" debe salir arriba (310 paginas).

-- TODO: muestra los socios ordenados por nombre.
-- * Plantilla:
-- SELECT nombre, ciudad FROM socios ORDER BY nombre ASC;

-- TODO: muestra los libros del mas corto al mas largo.
-- * Plantilla:
-- SELECT titulo, paginas FROM libros ORDER BY paginas ASC;

-- TODO: muestra los 3 libros mas largos.
-- * Plantilla:
-- SELECT titulo, paginas FROM libros ORDER BY paginas DESC LIMIT 3;

-- TODO: muestra los 2 primeros socios ordenados por ciudad.
-- * Plantilla:
-- SELECT nombre, ciudad FROM socios ORDER BY ciudad ASC LIMIT 2;

-- TODO: muestra los prestamos mas recientes primero.
-- * Plantilla:
-- SELECT prestamo_id, fecha_prestamo FROM prestamos ORDER BY fecha_prestamo DESC;

-- * Regla mental:
-- * 1) SELECT
-- * 2) FROM
-- * 3) ORDER BY
-- * 4) LIMIT
