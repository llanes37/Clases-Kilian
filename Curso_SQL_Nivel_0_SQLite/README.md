# Curso SQL Nivel 0 con SQLite (Guia Completa)

> Curso ultra basico para empezar desde cero de verdad, sin saltos raros.

Este curso no intenta ensenarte "todo SQL". Primero te ensena algo mas importante: entender una tabla, leer datos, hacer preguntas simples y perder el miedo.

## Contenido (en este README)

1. Que es este curso y para quien es
2. Instalacion en Visual Studio Code (extensiones)
3. Crear la base de datos SQLite `.db`
4. Como ejecutar sentencias y scripts `.sql` en VS Code
5. Ruta completa del curso (paso a paso)
6. Chuleta Nivel 0 (muy corta)
7. Errores tipicos y como arreglarlos
8. Mini test final (para comprobar dominio)
9. Guia rapida para darlo en clase (opcional)

## Que hace diferente a este curso

1. Solo usa SQLite (un archivo `.db`, sin servidor).
2. Solo usa un caso simple: una biblioteca.
3. Primero aprendes a leer datos, luego a crear.
4. Cada bloque tiene una idea principal.
5. Los scripts llevan comentarios tipo Better Comments:
   - `-- !` mision o parte importante
   - `-- *` explicacion clara
   - `-- ?` pregunta para pensar
   - `-- TODO:` lo que debe hacer el alumno

## Para quien es

- Alumnos que nunca han usado SQL.
- Alumnos que se bloquean con demasiada teoria.
- Personas que prefieren practicar con ejemplos pequenos.

## Lo que sabras hacer al terminar

1. Leer una tabla con `SELECT`.
2. Elegir columnas concretas.
3. Filtrar filas con `WHERE`, `LIKE` e `IS NULL`.
4. Ordenar y limitar resultados (`ORDER BY`, `LIMIT`).
5. Crear una tabla sencilla (`CREATE TABLE`) e insertar datos (`INSERT`).
6. Relacionar tablas con un `JOIN` basico.
7. Contar y agrupar (`COUNT`, `GROUP BY`).

## Instalacion en Visual Studio Code (extensiones)

Instala estas dos extensiones:

1. `SQLite` de `alexcvzz.vscode-sqlite`
2. `SQLite Viewer` de `qwtel.sqlite-viewer`

Para instalarlas:

1. Abre Visual Studio Code.
2. Pulsa `Ctrl + Shift + X`.
3. Busca `SQLite` e instala la de `alexcvzz`.
4. Busca `SQLite Viewer` e instala la de `qwtel`.

Para que sirve cada una:

- `SQLite`: ejecutar sentencias y scripts `.sql` sobre tu `.db`
- `SQLite Viewer`: abrir el `.db` y ver tablas/filas de forma visual

## Crear la base de datos (archivo .db)

En SQLite, la base de datos es un archivo.

Nombre recomendado:

- `biblioteca_nivel0.db`

Pasos:

1. Abre VS Code en la carpeta `Curso_SQL_Nivel_0_SQLite`.
2. Pulsa `Ctrl + Shift + P`.
3. Escribe `SQLite: Open Database`.
4. Selecciona o crea el archivo `biblioteca_nivel0.db` dentro de esta carpeta.

## Ejecutar SQL en VS Code (lo importante)

Hay dos formas simples.

### A) Ejecutar un archivo completo (.sql)

Sirve para lanzar un script entero como:

- `scripts/00_reset_biblioteca_nivel0.sql`
- `scripts/01_practica_select.sql`

Pasos:

1. Abre el archivo `.sql`.
2. Pulsa `Ctrl + Shift + P`.
3. Escribe `SQLite: Run Query`.
4. Elige la base `biblioteca_nivel0.db`.

### B) Ejecutar solo una consulta concreta

Sirve para probar una query pequena sin lanzar todo el archivo.

Pasos:

1. Selecciona con el raton una consulta (por ejemplo un `SELECT ...`).
2. Clic derecho.
3. `Run Query`.

## Ruta completa del curso (paso a paso)

La ruta real del curso son estos scripts. Este README te da la teoria minima y el orden exacto.

### Paso 0: Preparar la base de datos (obligatorio)

- Ejecuta: `scripts/00_reset_biblioteca_nivel0.sql`
- Objetivo: crear las tablas `socios`, `libros`, `prestamos` e insertar datos de ejemplo.

Comprobacion rapida (debe funcionar):

```sql
SELECT COUNT(*) FROM socios;
SELECT COUNT(*) FROM libros;
SELECT COUNT(*) FROM prestamos;
```

### Paso 1: Ver datos con SELECT

- Practica: `scripts/01_practica_select.sql`
- Solucion: `soluciones/01_practica_select_resuelta.sql`

Teoria minima:

- `SELECT` es para leer (no cambia nada).
- `*` significa "todas las columnas".

Ejemplos:

```sql
SELECT * FROM socios;
SELECT nombre, ciudad FROM socios;
SELECT titulo AS libro, genero AS tipo FROM libros;
```

Checkpoint (dominio minimo):

- puedes sacar columnas concretas sin mirar la solucion

### Paso 2: Buscar y filtrar con WHERE

- Practica: `scripts/02_practica_where.sql`
- Solucion: `soluciones/02_practica_where_resuelta.sql`

Teoria minima:

- `WHERE` filtra filas.
- texto: usa comillas `'Madrid'`
- vacios: `IS NULL` (no `= NULL`)

Ejemplos:

```sql
SELECT nombre FROM socios WHERE ciudad = 'Madrid';
SELECT titulo FROM libros WHERE genero = 'Fantasia';
SELECT nombre FROM socios WHERE telefono IS NULL;
SELECT nombre FROM socios WHERE nombre LIKE 'A%';
```

Checkpoint:

- puedes escribir 3 filtros distintos (texto, numero, NULL)

### Paso 3: Ordenar y limitar

- Practica: `scripts/03_practica_order_limit.sql`
- Solucion: `soluciones/03_practica_order_limit_resuelta.sql`

Teoria minima:

- `ORDER BY` ordena resultados.
- `LIMIT` limita filas devueltas.

Ejemplos:

```sql
SELECT titulo, paginas FROM libros ORDER BY paginas DESC;
SELECT titulo, paginas FROM libros ORDER BY paginas DESC LIMIT 3;
```

Checkpoint:

- puedes sacar "top 3" sin mirar la solucion

### Paso 4: Crear una tabla e insertar datos

- Practica: `scripts/04_practica_create_insert.sql`
- Solucion: `soluciones/04_practica_create_insert_resuelta.sql`

Teoria minima:

- `CREATE TABLE` crea una estructura.
- `INSERT` mete filas.
- siempre comprueba con `SELECT`.

Ejemplos:

```sql
CREATE TABLE salas_estudio (
  sala_id INTEGER PRIMARY KEY,
  nombre TEXT NOT NULL,
  plazas INTEGER NOT NULL
);

INSERT INTO salas_estudio (sala_id, nombre, plazas)
VALUES (1, 'Sala Norte', 12);
```

Checkpoint:

- puedes crear una tabla nueva e insertar 2-3 filas

### Paso 5: Relacionar tablas con JOIN

- Practica: `scripts/05_practica_join.sql`
- Solucion: `soluciones/05_practica_join_resuelta.sql`

Teoria minima:

- `JOIN` une tablas para dejar de ver ids sueltos.
- la regla mental: une por columnas id relacionadas.

Ejemplo:

```sql
SELECT p.prestamo_id, s.nombre, l.titulo
FROM prestamos p
JOIN socios s ON p.socio_id = s.socio_id
JOIN libros l ON p.libro_id = l.libro_id;
```

Checkpoint:

- puedes sacar nombre + titulo en una misma salida

### Paso 6: Contar y agrupar

- Practica: `scripts/06_practica_group_by.sql`
- Solucion: `soluciones/06_practica_group_by_resuelta.sql`

Teoria minima:

- `COUNT(*)` cuenta filas.
- `GROUP BY` agrupa filas parecidas.

Ejemplos:

```sql
SELECT COUNT(*) AS total_libros FROM libros;
SELECT genero, COUNT(*) AS total FROM libros GROUP BY genero;
```

Checkpoint:

- puedes responder "cuantos por genero" y "cuantos por ciudad"

### Paso 7: Mini proyecto final

- Practica: `scripts/99_miniproyecto_final.sql`
- Solucion: `soluciones/99_miniproyecto_final_resuelto.sql`

Objetivo:

- demostrar que ya puedes consultar, filtrar, ordenar, unir y contar sin copiar todo

## Chuleta Nivel 0 (muy corta)

```sql
-- Ver todo
SELECT * FROM tabla;

-- Ver columnas concretas
SELECT col1, col2 FROM tabla;

-- Filtrar
SELECT * FROM tabla WHERE col = 'texto';
SELECT * FROM tabla WHERE col IS NULL;
SELECT * FROM tabla WHERE col LIKE 'A%';

-- Ordenar y limitar
SELECT * FROM tabla ORDER BY col DESC LIMIT 3;

-- Unir tablas
SELECT * FROM a JOIN b ON a.id = b.a_id;

-- Contar y agrupar
SELECT COUNT(*) FROM tabla;
SELECT col, COUNT(*) FROM tabla GROUP BY col;
```

## Errores tipicos (y arreglo rapido)

1. "no such table ..."
   - primero ejecuta `scripts/00_reset_biblioteca_nivel0.sql`
2. "no such column ..."
   - revisa si escribiste bien el nombre de la columna
3. No sale nada (0 filas)
   - no es error: tu filtro no coincide con los datos
4. Texto sin comillas
   - usa `WHERE ciudad = 'Madrid'`
5. `= NULL`
   - usa `IS NULL`

## Mini test final (sin mirar soluciones)

Haz estas 10 tareas. Si sacas 8 sin ayuda, dominas el Nivel 0.

1. Lista `socios` (nombre y ciudad).
2. Lista `libros` (titulo y genero).
3. Socios de Madrid.
4. Socios sin telefono.
5. Libros de Fantasia.
6. Libros con mas de 200 paginas.
7. Top 2 libros mas largos.
8. Prestamos no devueltos (solo `prestamo_id`).
9. Prestamos no devueltos mostrando `nombre` del socio y `titulo` del libro (JOIN).
10. Cuenta libros por genero (GROUP BY).

## Guia rapida para darlo en clase (opcional)

- Duracion orientativa: 2 a 4 horas totales, segun ritmo.
- Ritmo recomendado:
  - 10 min reset + ver tablas
  - 25 min SELECT
  - 25 min WHERE
  - 15 min ORDER/LIMIT
  - 30 min CREATE/INSERT
  - 25 min JOIN
  - 20 min GROUP BY
  - 20 min mini proyecto/test
- Regla para avanzar:
  - si el alumno puede resolver 3 TODO seguidos sin abrir soluciones, puede pasar al siguiente paso
