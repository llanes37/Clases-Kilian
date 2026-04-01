# Resumen maestro del temario: UD8 Java, UD8 PL/SQL I y UD9 clases de uso comun

## Fuentes analizadas

- `UD8.pdf`
- `UD8 PL-SQL I.pdf`
- `UD9 (2).pdf`
- `Plataforma_SQL_Retro.html`

## Objetivo de este documento

Este material unifica en un solo punto el contenido principal del temario entregado. La idea es que sirva como guia de estudio, chuleta de repaso y base para generar practicas, ejercicios o scripts SQL/PL-SQL dentro de la plataforma.

## Mapa global del temario

### Bloque Java

1. Definicion de clase.
2. Miembros de una clase.
3. Diferencia entre metodo de clase y metodo de instancia.
4. Metodos sobrecargados.
5. Creacion de objetos o instancias.
6. Constructores.
7. Destruccion de objetos.
8. Asignacion de objetos.
9. Clases wrapper.
10. Clase `Object`.
11. Clase `String`.

### Bloque PL/SQL

1. Introduccion a PL/SQL.
2. Bloque anonimo.
3. Sintaxis basica.
4. Variables, constantes y tipos.
5. Operadores.
6. Instrucciones de control.
7. Interaccion con el usuario.
8. Funciones SQL y cursores.
9. Programas almacenados.
10. Procedimientos.
11. Funciones.
12. Subprogramas locales.
13. Recursividad.

---

## UD8 Java: clases, objetos y ciclo de vida

### 1. Que es una clase

Una clase es una plantilla. Define:

- que datos tendran los objetos: atributos
- que podran hacer: metodos
- como se inicializan: constructores

Sintaxis general:

```java
[acceso] [tipoDeClase] class NombreClase [extends Superclase] [implements Interface1, Interface2] {
    // atributos
    // metodos
}
```

Elementos importantes:

- `public`: visible desde cualquier paquete.
- sin modificador: visible solo dentro del paquete.
- `final`: la clase no puede heredarse.
- `abstract`: la clase puede tener herederos, pero no puede instanciarse.
- `extends`: herencia de una superclase.
- `implements`: implementacion de interfaces.

### 2. Miembros de una clase

Una clase tiene dos grandes tipos de miembros:

- atributos
- metodos

Ejemplo:

```java
class Persona {
    private String nombre;
    private int edad;

    public void presentarse() {
        System.out.println("Hola, soy " + nombre);
    }
}
```

#### Modificadores de acceso de los miembros

- `public`: accesible desde cualquier lugar.
- `private`: accesible solo desde la propia clase.
- `protected`: accesible desde la clase, el paquete y las subclases.
- sin modificador: acceso de paquete.

#### Otros modificadores relevantes

- `static`: pertenece a la clase, no al objeto.
- `final`: no cambia o no puede redefinirse.
- `abstract`: obliga a redefinir en subclases.
- `throws`: declara excepciones.
- `native` y `synchronized`: aparecen en el temario como modificadores especiales de metodo.

### 3. Metodo de clase vs metodo de instancia

El temario diferencia claramente dos ideas:

- metodo de clase: se llama con el nombre de la clase y suele ser `static`
- metodo de instancia: se llama sobre un objeto concreto

Ejemplo:

```java
class Calculadora {
    public static int sumar(int a, int b) {
        return a + b;
    }
}

class Yeti {
    public void alimentar() {
        System.out.println("Yeti alimentado");
    }
}
```

Uso:

```java
int r = Calculadora.sumar(3, 4); // metodo de clase

Yeti y = new Yeti();
y.alimentar(); // metodo de instancia
```

Cuando un metodo de instancia trabaja con el propio objeto, usa `this`.

### 4. Sobrecarga de metodos

Un metodo esta sobrecargado cuando existe varias veces en la misma clase con:

- distinto numero de parametros
- o distinto tipo de parametros

No basta con cambiar solo el tipo de retorno.

Ejemplo:

```java
class Impresora {
    public void imprimir(String texto) {}
    public void imprimir(int numero) {}
    public void imprimir(String texto, int copias) {}
}
```

### 5. Crear objetos o instancias

Crear un objeto implica:

1. declarar la referencia
2. reservar memoria con `new`
3. ejecutar el constructor

Ejemplo:

```java
Persona p;
p = new Persona();
```

Que hace `new`:

- reserva memoria para el objeto
- inicializa sus atributos a valores por defecto
- llama al constructor correspondiente

### 6. Constructores

Un constructor:

- tiene el mismo nombre que la clase
- no devuelve ningun valor
- se ejecuta al crear el objeto con `new`
- puede estar sobrecargado

Ejemplo:

```java
class Persona {
    private String nombre;
    private int edad;

    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }
}
```

Ideas clave del tema:

- si no defines ningun constructor, Java aporta uno por defecto sin parametros
- el constructor no se hereda
- no puede declararse `final`, `static` ni `abstract`

### 7. Destruccion de objetos

El PDF menciona:

- `finalize()`
- recolector de basura o garbage collector
- eliminacion automatica cuando un objeto pierde todas sus referencias

Conviene estudiar esto con dos niveles:

- nivel temario: un objeto se destruye cuando deja de ser referenciado y el recolector de basura libera memoria
- nivel Java actual: `finalize()` se considera obsoleto en Java moderno y no debe usarse como mecanismo normal de limpieza

### 8. Asignacion de objetos y referencias

Esta parte es critica porque suele provocar errores conceptuales.

Crear una nueva referencia no siempre significa crear un nuevo objeto.

Ejemplo:

```java
Persona p1 = new Persona("Ana", 20);
Persona p2 = p1;
```

Aqui:

- solo existe un objeto
- hay dos referencias apuntando al mismo objeto
- si modificas el objeto a traves de `p2`, tambien veras el cambio desde `p1`

### 9. Resumen tecnico de UD8 Java

- clase = molde
- objeto = instancia real
- atributo = dato
- metodo = comportamiento
- `static` = de clase
- no `static` = de instancia
- `new` = crea objeto y llama al constructor
- `this` = referencia al objeto actual
- sobrecarga = mismo nombre, distinta firma
- referencia != objeto

---

## UD8 PL/SQL I: lenguaje procedural sobre Oracle

### 1. Que es PL/SQL

PL/SQL significa `Procedural Language / SQL`.

Es una extension procedural de SQL usada en Oracle para combinar:

- manipulacion de datos con SQL
- logica procedural propia de un lenguaje de programacion

El material destaca que PL/SQL:

- esta integrado en el servidor Oracle
- permite almacenar programas como objetos de base de datos
- sirve tanto para desarrollo como para administracion

### 2. Tipos de bloques PL/SQL

El temario distingue tres bloques principales:

1. Bloque anonimo.
2. Subprogramas almacenados.
3. Disparadores o triggers.

Los dos que se desarrollan con detalle en el PDF son:

- bloque anonimo
- programas almacenados: procedimientos y funciones

### 3. Estructura de un bloque anonimo

```sql
DECLARE
    -- declaraciones opcionales
BEGIN
    -- sentencias ejecutables
EXCEPTION
    -- tratamiento de errores opcional
END;
/
```

Zonas del bloque:

- `DECLARE`: variables, constantes, cursores, excepciones
- `BEGIN`: logica ejecutable
- `EXCEPTION`: control de errores
- `END;`: cierre del bloque

### 4. Identificadores, variables y constantes

#### Identificadores

Segun el temario:

- maximo 30 caracteres
- deben comenzar por letra
- luego pueden incluir letras, numeros, `$`, `#` y `_`
- no distinguen mayusculas y minusculas

#### Variables

Se declaran en `DECLARE` y sirven para:

- guardar resultados de consultas
- almacenar calculos intermedios
- controlar la logica del programa

Sintaxis base:

```sql
nombre_variable tipo_dato;
nombre_variable tipo_dato := valor_inicial;
nombre_variable tipo_dato DEFAULT valor_inicial;
nombre_variable tipo_dato NOT NULL := valor_inicial;
```

#### Constantes

```sql
nombre_constante CONSTANT tipo_dato := valor;
```

#### Tipos del temario

El PDF enumera tipos como:

- `NUMBER`
- `VARCHAR2`
- `CHAR`
- `DATE`
- `BOOLEAN`
- `BINARY_INTEGER`
- `FLOAT`
- `INTEGER`
- `RECORD`

#### Tipado por referencia

Muy importante para examen y practica:

```sql
v_dept_no EMPLE.DEPT_NO%TYPE;
v_empleado EMPLE%ROWTYPE;
```

Ventajas:

- reutilizas el tipo de una columna
- evitas errores si cambia el diseno de la tabla
- `ROWTYPE` permite declarar una variable con toda una fila

Nota del tema:

- `%TYPE` y `%ROWTYPE` heredan el tipo
- no heredan valores por defecto ni restricciones `NOT NULL`

### 5. Operadores

#### Aritmeticos

- `+`
- `-`
- `*`
- `/`

#### Relacionales

- `=`
- `<`
- `>`
- `<=`
- `>=`
- `<>`
- `LIKE`
- `IN`
- `BETWEEN`
- `IS NULL`

#### Logicos

- `AND`
- `OR`
- `NOT`

#### Concatenacion

```sql
cadena1 || cadena2
```

### 6. Instrucciones de control

#### Asignacion

En PL/SQL se asigna con `:=`

```sql
importe := 1000;
valor := importe * 0.15;
```

#### Alternativa `IF`

```sql
IF condicion THEN
    sentencias;
ELSIF otra_condicion THEN
    sentencias;
ELSE
    sentencias;
END IF;
```

#### Bucle `LOOP`

```sql
LOOP
    sentencias;
    EXIT WHEN condicion;
END LOOP;
```

#### Bucle `WHILE`

```sql
WHILE condicion LOOP
    sentencias;
END LOOP;
```

#### Bucle `FOR`

```sql
FOR i IN 1..10 LOOP
    sentencias;
END LOOP;
```

Tambien puede usarse `REVERSE`.

### 7. Salida y entrada de datos

PL/SQL no esta pensado para dialogar directamente con el usuario como un lenguaje de consola tradicional.

El PDF destaca:

- `DBMS_OUTPUT.PUT_LINE(...)` para mostrar informacion
- `SET SERVEROUTPUT ON` para habilitar la salida en SQL*Plus o SQL Developer
- variables de sustitucion de SQL*Plus como mecanismo de entrada
- parametros de procedimientos y funciones como entrada formal

Ejemplo:

```sql
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola mundo');
END;
/
```

### 8. Funciones SQL dentro de PL/SQL

Se pueden usar funciones SQL normales dentro de bloques PL/SQL.

El temario remarca una idea:

- las funciones de agrupamiento se usan dentro de sentencias `SELECT`

### 9. Cursores

Un cursor representa el area de memoria asociada al resultado de una consulta.

El material diferencia:

- cursores implicitos: cuando la sentencia devuelve una sola fila
- cursores explicitos: cuando la consulta puede devolver varias filas

#### Cursor implicito con `SELECT ... INTO`

```sql
DECLARE
    v_dept_no EMPLE.DEPT_NO%TYPE;
    v_total   NUMBER(10,2);
BEGIN
    SELECT dept_no, SUM(salario)
    INTO v_dept_no, v_total
    FROM EMPLE
    WHERE dept_no = 20
    GROUP BY dept_no;

    DBMS_OUTPUT.PUT_LINE('Departamento: ' || v_dept_no || ' Total: ' || v_total);
END;
/
```

Punto importante:

- `SELECT ... INTO` debe devolver una sola fila
- si no devuelve ninguna o devuelve varias, Oracle lanza excepciones

### 10. Programas almacenados

Los subprogramas almacenados son bloques PL/SQL con nombre.

Tipos:

- procedimientos
- funciones

Ventajas:

- se compilan y almacenan en la base de datos
- pueden reutilizarse
- separan logica de negocio y reutilizacion

### 11. Procedimientos

Un procedimiento es un subprograma que ejecuta acciones y no esta obligado a devolver un valor.

Sintaxis general:

```sql
CREATE OR REPLACE PROCEDURE nombre (
    parametro modo tipo,
    parametro modo tipo
) AS
    -- declaraciones locales
BEGIN
    -- instrucciones
EXCEPTION
    -- control de errores
END nombre;
/
```

#### Modos de parametros

- `IN`: entrada. Se comporta como constante.
- `OUT`: salida. Debe pasarse una variable.
- `IN OUT`: entrada y salida.

#### Llamada a procedimientos

El tema recoge tres formas:

- notacion posicional
- notacion nominal
- notacion mixta

Ejemplos:

```sql
EXECUTE gestionDept(10, 'MADRID');
EXECUTE gestionDept(localidad => 'MADRID', nDept => 10);
```

#### Idea practica

El PDF incluye como ejemplo un procedimiento para multiplicar numeros y propone ejercicios como:

- mostrar empleado y localidad
- cambiar oficio de un empleado
- informar del oficio anterior y del nuevo

### 12. Funciones

Una funcion es un subprograma que devuelve un valor mediante `RETURN`.

Sintaxis general:

```sql
CREATE OR REPLACE FUNCTION nombre (
    parametro modo tipo
) RETURN tipo_dato AS
    -- declaraciones locales
BEGIN
    -- instrucciones
    RETURN expresion;
EXCEPTION
    -- control de errores
END nombre;
/
```

Las funciones pueden invocarse como parte de una expresion:

```sql
IF cadenaReves(frase) = frase THEN
    DBMS_OUTPUT.PUT_LINE('PALINDROMO');
END IF;
```

El temario incluye ejemplos de:

- multiplicacion de numeros
- cambio de oficio con retorno del valor anterior
- factorial recursivo

### 13. Estado de compilacion y vistas utiles

El PDF menciona estas utilidades para revisar y recompilar programas:

- `SHOW ERRORS`
- `USER_OBJECTS`
- `USER_SOURCE`
- `ALTER PROCEDURE nombre COMPILE;`
- `ALTER FUNCTION nombre COMPILE;`

Conceptos:

- `VALID`: disponible para uso
- `INVALID`: necesita recompilarse por cambios en objetos dependientes o errores

### 14. Subprogramas locales

Se declaran dentro de otro bloque o subprograma, en la parte declarativa.

Se usan cuando:

- la logica no va a reutilizarse fuera
- quieres encapsular pasos internos
- deseas dividir el bloque principal en tareas pequenas

### 15. Recursividad

El temario cierra con factorial recursivo:

```sql
CREATE OR REPLACE FUNCTION factorial (n NUMBER)
RETURN NUMBER AS
BEGIN
    IF n <= 1 THEN
        RETURN 1;
    ELSE
        RETURN n * factorial(n - 1);
    END IF;
END factorial;
/
```

### 16. Resumen tecnico de UD8 PL/SQL

- PL/SQL = SQL + logica procedural
- unidad basica = bloque
- asignacion = `:=`
- salida = `DBMS_OUTPUT.PUT_LINE`
- una fila = `SELECT ... INTO`
- muchas filas = cursor explicito
- procedimiento = ejecuta acciones
- funcion = devuelve valor
- `IN`, `OUT`, `IN OUT` = modos de parametros
- `CREATE OR REPLACE` = recompila o crea el objeto

---

## UD9 Java: wrappers, Object y String

### 1. Clases wrapper

Las wrappers son envoltorios orientados a objetos para tipos primitivos.

Relacion habitual:

- `int` -> `Integer`
- `double` -> `Double`
- `char` -> `Character`
- `boolean` -> `Boolean`

Sirven para:

- tratar primitivos como objetos
- usar colecciones y APIs que requieren objetos
- convertir entre cadenas y numeros

#### Metodos y operaciones destacadas

- `intValue()`, `doubleValue()`, etc.
- `parseInt()`, `parseDouble()`, etc.
- `toString()`

#### Boxing y unboxing

Desde Java 5, el proceso puede hacerse automaticamente.

```java
int x = 56;
Integer objEntero = x; // autoboxing
int y = objEntero;     // unboxing
```

### 2. Clase `Object`

Toda clase Java hereda de `Object`.

El tema se centra sobre todo en dos metodos:

- `equals()`
- `toString()`

#### `equals()`

Firma:

```java
boolean equals(Object obj)
```

En `Object`, dos objetos solo son iguales si son exactamente el mismo objeto en memoria.

Por eso, si no redefinimos `equals()`:

```java
Yeti a = new Yeti();
Yeti b = new Yeti();

System.out.println(a == b);      // false
System.out.println(a.equals(b)); // false
```

Si el diseno de la clase dice que dos objetos son iguales por contenido, entonces hay que sobrescribir `equals()`.

Ejemplo conceptual del temario:

- dos `Yeti` pueden considerarse iguales si comparten propiedades como color y sexo

#### `toString()`

Firma:

```java
String toString()
```

Debe devolver una representacion textual util del objeto. Si no se redefine, el resultado por defecto suele ser poco informativo.

Ejemplo:

```java
@Override
public String toString() {
    return "Yeti{color='" + color + "', sexo='" + sexo + "'}";
}
```

### 3. Clase `String`

El PDF explica dos formas de trabajar con cadenas:

```java
String str1 = "abc";
String str2 = new String("abc");
```

Aunque el contenido sea el mismo, no siempre se comportan igual con `==`.

#### Caso 1: literales

```java
String str1 = "abc";
String str2 = "abc";
```

- `str1.equals(str2)` -> `true`
- `str1 == str2` -> `true`

Esto ocurre porque ambos pueden apuntar al mismo literal internado en memoria.

#### Caso 2: `new String(...)`

```java
String str1 = "abc";
String str2 = new String("abc");
```

- `str1.equals(str2)` -> `true`
- `str1 == str2` -> `false`

Regla de examen:

- `equals()` compara contenido
- `==` compara referencias

### 4. Actividades propuestas en el PDF

El material plantea ejercicios del tipo:

- construir nombre completo a partir de nombre y apellidos
- pedir datos por teclado y mostrarlos en mayusculas y minusculas
- dar formato correcto a nombres
- contar caracteres de una cadena
- detectar si una cadena tiene una o varias palabras
- transformar digitos concretos dentro de una cadena

### 5. Resumen tecnico de UD9

- wrapper = objeto que encapsula un primitivo
- autoboxing = primitivo a wrapper
- unboxing = wrapper a primitivo
- `Object` es la raiz de la jerarquia
- `equals()` debe redefinirse si la igualdad es por contenido
- `toString()` debe redefinirse para mostrar informacion util
- en `String`, `equals()` compara texto y `==` compara referencia

---

## Relaciones entre los tres bloques

### Java UD8 y UD9

Se complementan de forma directa:

- UD8 te ensena a crear tus propias clases
- UD9 te ensena como funcionan clases base ya hechas por Java

En otras palabras:

- primero aprendes a definir clases, atributos, metodos y objetos
- despues aprendes a mejorar su comportamiento con `equals()`, `toString()` y el uso correcto de `String` y wrappers

### Java y PL/SQL

Aunque son mundos distintos, hay paralelismos didacticos:

- clase Java <-> programa almacenado con nombre
- constructor <-> inicializacion de estado al crear/ejecutar
- metodo <-> procedimiento o funcion
- atributo <-> variable o columna
- llamada a metodo <-> llamada a procedimiento o funcion

La diferencia principal es que:

- Java modela objetos y comportamiento en memoria
- PL/SQL modela logica de negocio cerca de la base de datos Oracle

---

## Errores tipicos que conviene evitar

### En Java

- confundir clase con objeto
- creer que copiar una referencia crea un objeto nuevo
- usar `==` para comparar `String`
- pensar que cambiar el tipo de retorno basta para sobrecargar un metodo
- olvidar que `static` pertenece a la clase

### En PL/SQL

- usar `=` en vez de `:=` para asignar
- olvidar `SET SERVEROUTPUT ON`
- usar `SELECT ... INTO` cuando la consulta devuelve varias filas
- declarar parametros con tamano en procedimientos y funciones
- no diferenciar `IN`, `OUT` e `IN OUT`

---

## Guia express para examen o repaso rapido

### Si te preguntan por clases y objetos

Responde con esta idea:

> una clase es la plantilla y un objeto es la instancia creada con `new`

### Si te preguntan por `static`

Responde con esta idea:

> un miembro `static` pertenece a la clase y se usa sin necesidad de crear objetos

### Si te preguntan por `equals()` y `==`

Responde con esta idea:

> `==` compara si dos referencias apuntan al mismo objeto, mientras `equals()` compara igualdad logica o de contenido si esta redefinido

### Si te preguntan por un bloque PL/SQL

Recuerda esta estructura:

```sql
DECLARE
BEGIN
EXCEPTION
END;
/
```

### Si te preguntan por procedimiento y funcion

- procedimiento: realiza acciones
- funcion: devuelve un valor

---

## Material complementario generado para esta carpeta

Se ha preparado un script de apoyo con ejemplos listos para Oracle:

- `scripts/UD8_PLSQL_Bloques_y_Programas.sql`

Ese fichero contiene:

- bloques anonimos
- variables y constantes
- condicionales y bucles
- `SELECT ... INTO`
- procedimientos
- funciones
- subprogramas locales
- recursividad

---

## Conclusiones finales

Este temario trabaja tres ideas centrales:

1. En Java, aprender a modelar el mundo con clases y objetos.
2. En Java, entender como se comportan objetos base como `Object`, wrappers y `String`.
3. En Oracle, usar PL/SQL para construir logica procedural y programas almacenados cerca de la base de datos.

Si este documento se convierte despues en material interactivo dentro de la plataforma, la progresion mas coherente seria:

1. teoria resumida
2. ejemplo corto
3. ejercicio guiado
4. solucion SQL o Java
5. mini reto final

Con eso el temario queda listo para transformarse en practicas, pruebas y contenido navegable.
