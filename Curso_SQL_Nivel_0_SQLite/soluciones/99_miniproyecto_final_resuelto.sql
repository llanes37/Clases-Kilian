-- ============================================================
-- ! Solucion mini proyecto final (Nivel 0)
-- ============================================================

DROP TABLE IF EXISTS ordenadores;

-- * 1) Libros (titulo y genero)
SELECT titulo, genero
FROM libros;

-- * 2) Socios de Madrid
SELECT nombre, ciudad
FROM socios
WHERE ciudad = 'Madrid';

-- * 3) Top 2 libros mas largos
SELECT titulo, paginas
FROM libros
ORDER BY paginas DESC
LIMIT 2;

-- * 4) Socios sin telefono
SELECT nombre, telefono
FROM socios
WHERE telefono IS NULL;

-- * 5) Prestamos no devueltos con nombre del socio
SELECT p.prestamo_id, s.nombre
FROM prestamos p
JOIN socios s ON p.socio_id = s.socio_id
WHERE p.devuelto = 'NO';

-- * 6) Prestamos no devueltos con nombre y titulo
SELECT p.prestamo_id, s.nombre, l.titulo
FROM prestamos p
JOIN socios s ON p.socio_id = s.socio_id
JOIN libros l ON p.libro_id = l.libro_id
WHERE p.devuelto = 'NO';

-- * 7) Contar socios
SELECT COUNT(*) AS total_socios
FROM socios;

-- * 8) Contar libros por genero
SELECT genero, COUNT(*) AS total_libros
FROM libros
GROUP BY genero;

-- * 9) Crear tabla ordenadores
CREATE TABLE IF NOT EXISTS ordenadores (
    ordenador_id INTEGER PRIMARY KEY,
    aula TEXT NOT NULL,
    operativo TEXT NOT NULL
);

-- * 10) Insertar 3 ordenadores y comprobar
INSERT INTO ordenadores (ordenador_id, aula, operativo)
VALUES
(1, 'Aula 1', 'Windows'),
(2, 'Aula 2', 'Linux'),
(3, 'Biblioteca', 'Windows');

SELECT * FROM ordenadores;
