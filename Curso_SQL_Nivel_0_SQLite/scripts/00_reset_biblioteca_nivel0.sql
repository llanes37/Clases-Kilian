-- ============================================================
-- ! Curso SQL Nivel 0 (SQLite) - Script base
-- ============================================================
-- ! AVISO: este script BORRA y CREA tablas
-- * Ejecutalo al principio para dejar la base lista para practicar.
-- * Como ejecutar en VS Code:
-- *   1) Ctrl + Shift + P
-- *   2) SQLite: Run Query
-- *   3) Elige tu archivo .db (por ejemplo biblioteca_nivel0.db)
-- *
-- * Consejo: si algo se rompe, vuelve a ejecutar este script y listo.

-- * En SQLite las claves foraneas se pueden activar con PRAGMA.
-- * No es obligatorio para Nivel 0, pero ayuda a evitar errores de datos.
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS prestamos;
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS socios;

CREATE TABLE socios (
    socio_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    ciudad TEXT NOT NULL,
    telefono TEXT
);

CREATE TABLE libros (
    libro_id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    genero TEXT NOT NULL,
    paginas INTEGER NOT NULL,
    disponible TEXT NOT NULL CHECK (disponible IN ('SI', 'NO'))
);

CREATE TABLE prestamos (
    prestamo_id INTEGER PRIMARY KEY,
    socio_id INTEGER NOT NULL,
    libro_id INTEGER NOT NULL,
    fecha_prestamo TEXT NOT NULL,
    devuelto TEXT NOT NULL CHECK (devuelto IN ('SI', 'NO')),
    FOREIGN KEY (socio_id) REFERENCES socios(socio_id),
    FOREIGN KEY (libro_id) REFERENCES libros(libro_id)
);

INSERT INTO socios (socio_id, nombre, ciudad, telefono) VALUES
(1, 'Ana Ruiz', 'Madrid', '600111111'),
(2, 'Luis Perez', 'Sevilla', NULL),
(3, 'Marta Gil', 'Madrid', '600333333'),
(4, 'Diego Leon', 'Valencia', '600444444'),
(5, 'Elena Soto', 'Bilbao', NULL),
(6, 'Pablo Marin', 'Malaga', '600666666');

INSERT INTO libros (libro_id, titulo, genero, paginas, disponible) VALUES
(1, 'El bosque azul', 'Fantasia', 220, 'SI'),
(2, 'SQL para principiantes', 'Tecnologia', 180, 'NO'),
(3, 'Viaje al centro', 'Aventura', 310, 'SI'),
(4, 'La ultima clase', 'Drama', 140, 'NO'),
(5, 'Cuentos del norte', 'Fantasia', 95, 'SI'),
(6, 'Aprender tablas', 'Tecnologia', 260, 'SI');

INSERT INTO prestamos (prestamo_id, socio_id, libro_id, fecha_prestamo, devuelto) VALUES
(1, 1, 2, '2026-02-10', 'NO'),
(2, 2, 4, '2026-02-11', 'SI'),
(3, 1, 3, '2026-02-12', 'SI'),
(4, 3, 2, '2026-02-14', 'NO'),
(5, 4, 1, '2026-02-15', 'SI');

-- ============================================================
-- * Dataset pensado para practicar (casos utiles)
-- ============================================================
-- * Hay socios sin telefono (telefono = NULL).
-- * Hay un socio sin prestamos (para practicar LEFT JOIN mas adelante si quieres).
-- * Hay libros que nunca se han prestado.
-- * Hay prestamos devueltos y no devueltos.

-- ============================================================
-- * Checks rapidos (deben dar numeros > 0)
-- ============================================================
SELECT COUNT(*) AS total_socios FROM socios;
SELECT COUNT(*) AS total_libros FROM libros;
SELECT COUNT(*) AS total_prestamos FROM prestamos;

SELECT 'Base lista para practicar' AS mensaje;
