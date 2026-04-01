-- ============================================================================
-- UD8 PL/SQL I - Bloques y programas almacenados
-- Material de apoyo construido a partir del temario analizado.
-- Enfocado a Oracle SQL*Plus / SQL Developer.
--
-- Nota:
-- Algunos ejemplos usan las tablas clasicas EMPLE y DEPART del temario.
-- Ajusta nombres de tablas y columnas si en tu esquema real cambian.
-- ============================================================================

SET SERVEROUTPUT ON;

-- ============================================================================
-- 1. Bloque anonimo minimo
-- ============================================================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola mundo desde PL/SQL');
END;
/

-- ============================================================================
-- 2. Variables, constantes y operaciones
-- ============================================================================

DECLARE
    v_importe      NUMBER(8,2) := 1000;
    v_iva          CONSTANT NUMBER(4,2) := 0.21;
    v_total        NUMBER(8,2);
    v_provincia    VARCHAR2(20) DEFAULT 'SEVILLA';
BEGIN
    v_total := v_importe + (v_importe * v_iva);

    DBMS_OUTPUT.PUT_LINE('Provincia: ' || v_provincia);
    DBMS_OUTPUT.PUT_LINE('Importe base: ' || v_importe);
    DBMS_OUTPUT.PUT_LINE('Total con IVA: ' || v_total);
END;
/

-- ============================================================================
-- 3. IF / ELSIF / ELSE
-- ============================================================================

DECLARE
    v_nota NUMBER := 7;
BEGIN
    IF v_nota >= 9 THEN
        DBMS_OUTPUT.PUT_LINE('Sobresaliente');
    ELSIF v_nota >= 7 THEN
        DBMS_OUTPUT.PUT_LINE('Notable');
    ELSIF v_nota >= 5 THEN
        DBMS_OUTPUT.PUT_LINE('Aprobado');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Suspenso');
    END IF;
END;
/

-- ============================================================================
-- 4. Bucle LOOP + EXIT WHEN
-- ============================================================================

DECLARE
    v_i     NUMBER := 1;
    v_suma  NUMBER := 0;
BEGIN
    LOOP
        v_suma := v_suma + v_i;
        v_i := v_i + 1;

        EXIT WHEN v_i > 100;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Suma de los 100 primeros naturales (LOOP): ' || v_suma);

    IF MOD(v_suma, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('La suma es par');
    ELSE
        DBMS_OUTPUT.PUT_LINE('La suma es impar');
    END IF;
END;
/

-- ============================================================================
-- 5. Bucle WHILE
-- ============================================================================

DECLARE
    v_i     NUMBER := 1;
    v_suma  NUMBER := 0;
BEGIN
    WHILE v_i <= 100 LOOP
        v_suma := v_suma + v_i;
        v_i := v_i + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Suma de los 100 primeros naturales (WHILE): ' || v_suma);
END;
/

-- ============================================================================
-- 6. Bucle FOR
-- ============================================================================

DECLARE
    v_suma NUMBER := 0;
BEGIN
    FOR i IN 1..100 LOOP
        v_suma := v_suma + i;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Suma de los 100 primeros naturales (FOR): ' || v_suma);
END;
/

-- ============================================================================
-- 7. SELECT INTO con %TYPE y %ROWTYPE
-- ============================================================================

DECLARE
    v_dept_no   EMPLE.DEPT_NO%TYPE := 20;
    v_total     NUMBER(10,2);
BEGIN
    SELECT dept_no, SUM(salario)
    INTO v_dept_no, v_total
    FROM EMPLE
    WHERE dept_no = 20
    GROUP BY dept_no;

    DBMS_OUTPUT.PUT_LINE('Departamento: ' || v_dept_no || ' | Total salarios: ' || v_total);
END;
/

DECLARE
    v_empleado EMPLE%ROWTYPE;
BEGIN
    SELECT *
    INTO v_empleado
    FROM EMPLE
    WHERE emp_no = 7369;

    DBMS_OUTPUT.PUT_LINE('Empleado: ' || v_empleado.apellido || ' | Oficio: ' || v_empleado.oficio);
END;
/

-- ============================================================================
-- 8. Departamento 10 y localidad pedida
-- ============================================================================

DECLARE
    v_nombre_depart DEPART.dnombre%TYPE;
BEGIN
    SELECT dnombre
    INTO v_nombre_depart
    FROM DEPART
    WHERE dept_no = 10;

    DBMS_OUTPUT.PUT_LINE('Departamento 10: ' || v_nombre_depart);
END;
/

DECLARE
    v_dept_no  DEPART.dept_no%TYPE := 20;
    v_loc      DEPART.loc%TYPE;
BEGIN
    SELECT loc
    INTO v_loc
    FROM DEPART
    WHERE dept_no = v_dept_no;

    DBMS_OUTPUT.PUT_LINE('Localidad del departamento ' || v_dept_no || ': ' || v_loc);
END;
/

-- ============================================================================
-- 9. Procedimiento simple de multiplicacion
-- ============================================================================

CREATE OR REPLACE PROCEDURE multiplica_numeros (
    p_num1 IN NUMBER,
    p_num2 IN NUMBER
) AS
    v_producto NUMBER;
BEGIN
    v_producto := p_num1 * p_num2;
    DBMS_OUTPUT.PUT_LINE('El producto es: ' || v_producto);
END multiplica_numeros;
/

EXECUTE multiplica_numeros(13, 26);

-- ============================================================================
-- 10. Funcion simple de multiplicacion
-- ============================================================================

CREATE OR REPLACE FUNCTION f_multiplica_numeros (
    p_num1 IN NUMBER,
    p_num2 IN NUMBER
) RETURN NUMBER AS
BEGIN
    RETURN p_num1 * p_num2;
END f_multiplica_numeros;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Funcion multiplicar: ' || f_multiplica_numeros(13, 26));
END;
/

-- ============================================================================
-- 11. Procedimiento ver_empleado
-- ============================================================================

CREATE OR REPLACE PROCEDURE ver_empleado (
    p_emp_no IN EMPLE.emp_no%TYPE
) AS
    v_apellido EMPLE.apellido%TYPE;
    v_loc      DEPART.loc%TYPE;
BEGIN
    SELECT e.apellido, d.loc
    INTO v_apellido, v_loc
    FROM EMPLE e
    JOIN DEPART d ON d.dept_no = e.dept_no
    WHERE e.emp_no = p_emp_no;

    DBMS_OUTPUT.PUT_LINE('El empleado ' || v_apellido || ' trabaja en ' || v_loc);
END ver_empleado;
/

EXECUTE ver_empleado(7369);

-- ============================================================================
-- 12. Procedimiento cambia_oficio
-- ============================================================================

CREATE OR REPLACE PROCEDURE cambia_oficio (
    p_emp_no          IN  EMPLE.emp_no%TYPE,
    p_nuevo_oficio    IN  EMPLE.oficio%TYPE,
    p_oficio_anterior OUT EMPLE.oficio%TYPE
) AS
BEGIN
    SELECT oficio
    INTO p_oficio_anterior
    FROM EMPLE
    WHERE emp_no = p_emp_no;

    UPDATE EMPLE
    SET oficio = p_nuevo_oficio
    WHERE emp_no = p_emp_no;

    DBMS_OUTPUT.PUT_LINE(
        TO_CHAR(p_emp_no) || ' * Oficio anterior: ' || p_oficio_anterior ||
        ' * Oficio nuevo: ' || p_nuevo_oficio
    );
END cambia_oficio;
/

DECLARE
    v_oficio_anterior EMPLE.oficio%TYPE;
BEGIN
    cambia_oficio(7369, 'ANALISTA', v_oficio_anterior);
END;
/

-- ============================================================================
-- 13. Funcion f_cambia_oficio
-- ============================================================================

CREATE OR REPLACE FUNCTION f_cambia_oficio (
    p_emp_no       IN EMPLE.emp_no%TYPE,
    p_nuevo_oficio IN EMPLE.oficio%TYPE
) RETURN EMPLE.oficio%TYPE AS
    v_oficio_anterior EMPLE.oficio%TYPE;
BEGIN
    SELECT oficio
    INTO v_oficio_anterior
    FROM EMPLE
    WHERE emp_no = p_emp_no;

    UPDATE EMPLE
    SET oficio = p_nuevo_oficio
    WHERE emp_no = p_emp_no;

    RETURN v_oficio_anterior;
END f_cambia_oficio;
/

DECLARE
    v_anterior EMPLE.oficio%TYPE;
BEGIN
    v_anterior := f_cambia_oficio(7369, 'VENDEDOR');
    DBMS_OUTPUT.PUT_LINE('7369 * Oficio anterior: ' || v_anterior || ' * Oficio nuevo: VENDEDOR');
END;
/

-- Si solo estas practicando y no quieres conservar los cambios sobre EMPLE:
ROLLBACK;

-- ============================================================================
-- 14. Subprograma local
-- ============================================================================

CREATE OR REPLACE PROCEDURE p_demo_local AS
    PROCEDURE p_saluda (p_texto IN VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Subprograma local: ' || p_texto);
    END p_saluda;
BEGIN
    p_saluda('ejecucion interna correcta');
END p_demo_local;
/

EXECUTE p_demo_local;

-- ============================================================================
-- 15. Recursividad: factorial
-- ============================================================================

CREATE OR REPLACE FUNCTION factorial (
    p_n IN NUMBER
) RETURN NUMBER AS
BEGIN
    IF p_n <= 1 THEN
        RETURN 1;
    ELSE
        RETURN p_n * factorial(p_n - 1);
    END IF;
END factorial;
/

CREATE OR REPLACE PROCEDURE prueba_factorial (
    p_n IN NUMBER
) AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Factorial de ' || p_n || ' = ' || factorial(p_n));
END prueba_factorial;
/

EXECUTE prueba_factorial(5);

-- ============================================================================
-- 16. Revision del estado de compilacion
-- ============================================================================

SHOW ERRORS;

SELECT object_name, object_type, status
FROM user_objects
WHERE object_type IN ('PROCEDURE', 'FUNCTION')
ORDER BY object_type, object_name;

SELECT name, type, line, text
FROM user_source
WHERE name IN (
    'MULTIPLICA_NUMEROS',
    'F_MULTIPLICA_NUMEROS',
    'VER_EMPLEADO',
    'CAMBIA_OFICIO',
    'F_CAMBIA_OFICIO',
    'P_DEMO_LOCAL',
    'FACTORIAL',
    'PRUEBA_FACTORIAL'
)
ORDER BY name, line;

-- Si hiciera falta recompilar manualmente:
-- ALTER PROCEDURE multiplica_numeros COMPILE;
-- ALTER FUNCTION factorial COMPILE;
