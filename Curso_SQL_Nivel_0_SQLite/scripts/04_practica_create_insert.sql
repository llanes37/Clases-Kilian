-- ============================================================
-- ! Practica 04: crear una tabla e insertar datos
-- ============================================================
-- * Meta: construir una tabla muy simple desde cero.
-- * Esta practica SI cambia la base de datos (crea tablas nuevas).
-- * Si repites la practica, estas lineas dejan el entorno limpio.

DROP TABLE IF EXISTS talleres;
DROP TABLE IF EXISTS salas_estudio;

-- ? Ejemplo guiado
CREATE TABLE IF NOT EXISTS salas_estudio (
    sala_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    plazas INTEGER NOT NULL
);
-- * Como leer esto:
-- *   - sala_id identifica cada sala (no se repite)
-- *   - nombre no puede ser NULL
-- *   - plazas es un numero obligatorio

-- TODO: inserta una fila con sala_id 1, nombre 'Sala Norte' y 12 plazas.
-- * Plantilla:
-- INSERT INTO salas_estudio (sala_id, nombre, plazas)
-- VALUES (1, 'Sala Norte', 12);

-- TODO: inserta dos filas mas en una sola sentencia:
-- TODO: 'Sala Centro' con 8 plazas
-- TODO: 'Sala Silencio' con 20 plazas
-- * Plantilla:
-- INSERT INTO salas_estudio (sala_id, nombre, plazas)
-- VALUES
-- (2, 'Sala Centro', 8),
-- (3, 'Sala Silencio', 20);

-- TODO: consulta todas las filas de salas_estudio.
-- * Plantilla:
-- SELECT * FROM salas_estudio;

-- TODO: crea otra tabla llamada talleres con:
-- TODO: taller_id, titulo, duracion_horas
-- * Plantilla:
-- CREATE TABLE talleres (
--   taller_id INTEGER PRIMARY KEY,
--   titulo TEXT NOT NULL,
--   duracion_horas INTEGER NOT NULL
-- );

-- TODO: inserta dos talleres inventados.
-- * Plantilla:
-- INSERT INTO talleres (taller_id, titulo, duracion_horas)
-- VALUES
-- (1, '...', 2),
-- (2, '...', 1);

-- TODO: consulta la tabla talleres.
-- * Plantilla:
-- SELECT * FROM talleres;

-- * Consejo:
-- * Despues de cada CREATE o INSERT, comprueba el resultado con SELECT.
-- ? Si te da "UNIQUE constraint failed":
-- * Has repetido una PK. Solucion: vuelve a ejecutar el script (ya hace DROP) o cambia el id.
