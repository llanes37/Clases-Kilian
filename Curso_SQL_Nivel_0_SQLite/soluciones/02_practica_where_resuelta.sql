-- ============================================================
-- ! Soluciones practica 02: filtrar con WHERE
-- ============================================================

-- * 1) Libros del genero Fantasia
SELECT titulo
FROM libros
WHERE genero = 'Fantasia';

-- * 2) Libros con mas de 200 paginas
SELECT titulo, paginas
FROM libros
WHERE paginas > 200;

-- * 3) Socios sin telefono (NULL)
SELECT nombre, telefono
FROM socios
WHERE telefono IS NULL;

-- * 4) Prestamos no devueltos
SELECT prestamo_id, devuelto
FROM prestamos
WHERE devuelto = 'NO';

-- * 5) Nombres que empiezan por A (LIKE)
SELECT nombre
FROM socios
WHERE nombre LIKE 'A%';

-- * 6) Libros con menos de 200 paginas
SELECT titulo, paginas
FROM libros
WHERE paginas < 200;
