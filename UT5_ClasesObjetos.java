/*
 * ******************************************************************************************
 *  📚 CURSO DE PROGRAMACIÓN EN JAVA - AUTOR: Joaquín Rodríguez Llanes
 *  📅 FECHA: 2025
 *  🔹 UNIDAD 5: CLASES Y OBJETOS EN JAVA (Programación Orientada a Objetos)
 *  🔐 REPOSITORIO PRIVADO EN GITHUB (USO EDUCATIVO EXCLUSIVO)
 * ******************************************************************************************
 *
 *  En esta práctica aprenderás a:
 *
 *  ✅ Comprender qué es una CLASE y qué es un OBJETO.
 *  ✅ Crear tus propias clases con atributos y métodos.
 *  ✅ Usar constructores para inicializar objetos.
 *  ✅ Aplicar encapsulación con private, getters y setters.
 *  ✅ Crear objetos y llamar a sus métodos desde main().
 *
 *  🚀 ¡Explora, experimenta y mejora el código!
 * ******************************************************************************************
 */

// * ════════════════════════════════════════════════════════════════
// * 📖 TEORÍA: ¿QUÉ ES LA PROGRAMACIÓN ORIENTADA A OBJETOS (POO)?
// * ════════════════════════════════════════════════════════════════
//
// ? La POO es un paradigma de programación que organiza el código
// ? alrededor de "objetos" del mundo real, en vez de solo funciones.
// ?
// ? Imagina que quieres modelar una PERSONA en tu programa:
// ?   - ¿Qué TIENE una persona?  → nombre, edad       (ATRIBUTOS)
// ?   - ¿Qué HACE una persona?   → presentarse, hablar (MÉTODOS)
// ?
// ? En Java, usamos una CLASE como plantilla para definir eso.

// * ════════════════════════════════════════════════════════════════
// * 📖 TEORÍA: CLASE vs OBJETO
// * ════════════════════════════════════════════════════════════════
//
// ? 🟢 CLASE = el PLANO (la plantilla, el molde)
// ?   - Define QUÉ atributos y métodos tendrán los objetos.
// ?   - Se escribe UNA vez.
// ?   - Ejemplo: la clase "Persona" define que toda persona tiene nombre y edad.
// ?
// ? 🟠 OBJETO = la INSTANCIA concreta (lo que creas a partir del plano)
// ?   - Tiene valores REALES (nombre = "Joaquín", edad = 30).
// ?   - Se pueden crear MUCHOS objetos de la misma clase.
// ?   - Se crea con la palabra clave: new
// ?
// ? Analogía sencilla:
// ?   CLASE Persona  →  es como el plano de una casa
// ?   OBJETO persona1 = new Persona("Ana", 25)  →  es la casa ya construida

// * ════════════════════════════════════════════════════════════════
// * 📖 TEORÍA: CONSTRUCTOR
// * ════════════════════════════════════════════════════════════════
//
// ? Un CONSTRUCTOR es un método especial que se ejecuta automáticamente
// ? cuando haces "new NombreClase(...)".
// ?
// ? Reglas del constructor:
// ?   1. Tiene el MISMO nombre que la clase.
// ?   2. NO devuelve nada (ni void ni nada).
// ?   3. Sirve para dar valores iniciales a los atributos.
// ?
// ? Ejemplo: public Persona(String nombre, int edad) { ... }

// * ════════════════════════════════════════════════════════════════
// * 📖 TEORÍA: ENCAPSULACIÓN (private + getters + setters)
// * ════════════════════════════════════════════════════════════════
//
// ? Los atributos se declaran PRIVATE para que nadie los modifique
// ? directamente desde fuera. Esto protege los datos.
// ?
// ? Para leer un atributo  → usamos un GETTER:  getNombre()
// ? Para escribir un atributo → usamos un SETTER: setNombre("Ana")
// ?
// ! ¿Por qué no acceder directo?
// !   persona.edad = -5;      ← ¡Permitido! Datos corruptos
// !   persona.setEdad(-5);    ← El setter lo RECHAZA con validación
// ?
// ? La palabra clave THIS se refiere al objeto actual:
// ?   this.nombre = nombre;  → "mi atributo = el parámetro que me pasan"

// Definimos la clase principal
public class UT5_ClasesObjetos {
    public static void main(String[] args) {
        // Crear un objeto de la clase Persona
        Persona persona1 = new Persona("Joaquín", 30);
        persona1.mostrarInformacion(); // Llamamos al método

        // Modificamos los atributos con setters
        persona1.setNombre("Ana");
        persona1.setEdad(25);

        // Mostramos la información actualizada
        persona1.mostrarInformacion();

        // ! ✅ TAREA PARA EL ALUMNO:
        // * Crea otra clase llamada `Coche` con los atributos `marca`, `modelo` y
        // `velocidad`.
        // * Implementa un método `acelerar()` que incremente la velocidad del coche.
        // * En `main()`, crea un objeto `Coche`, establece valores y prueba el método
        // `acelerar()`.
    }
}

// Definimos la clase Persona
class Persona {
    // * ⚠️ Atributos (variables de instancia)
    private String nombre;
    private int edad;

    // * ✅ Constructor (inicializa los atributos al crear el objeto)
    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    // * 🛠️ Getters y Setters (Encapsulación: acceso controlado a los atributos)
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        if (edad > 0) {
            this.edad = edad;
        } else {
            System.out.println("⚠️ La edad no puede ser negativa.");
        }
    }

    // * ✅ Método para mostrar la información del objeto
    public void mostrarInformacion() {
        System.out.println("Nombre: " + nombre + " | Edad: " + edad);
    }
}
