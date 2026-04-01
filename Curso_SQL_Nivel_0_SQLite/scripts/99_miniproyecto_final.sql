-- ============================================================
-- ! Mini proyecto final (Nivel 0)
-- ============================================================
-- * Meta: demostrar que ya sabes leer, filtrar, ordenar, unir y contar.
-- * Requisito: antes ejecuta scripts/00_reset_biblioteca_nivel0.sql
-- * Consejo:
-- *   - intenta resolver sin abrir soluciones
-- *   - si te atascas, simplifica: primero un SELECT, luego WHERE, luego ORDER/LIMIT
-- * Si lo repites, puedes limpiar primero la tabla final.

DROP TABLE IF EXISTS ordenadores;

-- TODO: 1) Muestra todos los libros con titulo y genero.
-- * Plantilla:
-- SELECT titulo, genero FROM libros;

-- TODO: 2) Muestra los socios de Madrid.
-- * Plantilla:
-- SELECT nombre, ciudad FROM socios WHERE ciudad = 'Madrid';

-- TODO: 3) Muestra los 2 libros mas largos.
-- * Plantilla:
-- SELECT titulo, paginas FROM libros ORDER BY paginas DESC LIMIT 2;

-- TODO: 4) Muestra los socios sin telefono.
-- * Plantilla:
-- SELECT nombre, telefono FROM socios WHERE telefono IS NULL;

-- TODO: 5) Muestra los prestamos no devueltos con nombre del socio.
-- * Pista: JOIN con socios.

-- TODO: 6) Muestra los prestamos no devueltos con nombre del socio y titulo del libro.
-- * Pista: JOIN con socios y libros.

-- TODO: 7) Cuenta cuantos socios hay en total.
-- * Plantilla:
-- SELECT COUNT(*) AS total_socios FROM socios;

-- TODO: 8) Cuenta cuantos libros hay por genero.
-- * Plantilla:
-- SELECT genero, COUNT(*) AS total FROM libros GROUP BY genero;

-- TODO: 9) Crea una tabla llamada ordenadores con:
-- TODO: ordenador_id, aula, operativo

-- TODO: 10) Inserta 3 ordenadores y consultalos.

-- * Si completas esto sin copiar todo, ya no estas en nivel cero total.
