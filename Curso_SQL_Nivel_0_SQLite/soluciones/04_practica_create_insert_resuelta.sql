-- ============================================================
-- ! Soluciones practica 04: CREATE TABLE e INSERT
-- ============================================================
-- * Nota: esta practica crea tablas nuevas fuera del esquema base.

DROP TABLE IF EXISTS talleres;
DROP TABLE IF EXISTS salas_estudio;

-- * 1) Crear tabla salas_estudio
CREATE TABLE IF NOT EXISTS salas_estudio (
    sala_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    plazas INTEGER NOT NULL
);

-- * 2) Insertar una fila
INSERT INTO salas_estudio (sala_id, nombre, plazas)
VALUES (1, 'Sala Norte', 12);

-- * 3) Insertar varias filas
INSERT INTO salas_estudio (sala_id, nombre, plazas)
VALUES
(2, 'Sala Centro', 8),
(3, 'Sala Silencio', 20);

-- * 4) Comprobar datos
SELECT * FROM salas_estudio;

-- * 5) Crear tabla talleres
CREATE TABLE IF NOT EXISTS talleres (
    taller_id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    duracion_horas INTEGER NOT NULL
);

-- * 6) Insertar datos en talleres
INSERT INTO talleres (taller_id, titulo, duracion_horas)
VALUES
(1, 'Lectura rapida', 2),
(2, 'Club de misterio', 1);

-- * 7) Comprobar datos
SELECT * FROM talleres;
