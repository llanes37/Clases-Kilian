/*
 * ******************************************************************************************
 *  📚 CURSO DE PROGRAMACIÓN EN JAVA - AUTOR: Joaquín Rodríguez Llanes
 *  📅 FECHA: 2025
 *  🔹 REPOSITORIO PRIVADO EN GITHUB (ACCESO SOLO PARA ALUMNOS AUTORIZADOS)
 *  ❌ PROHIBIDA SU DISTRIBUCIÓN SIN PERMISO DEL AUTOR
 * ******************************************************************************************
 */
/*
 * ==========================================================================================
 *  UNIDAD 3 | BUCLES EN JAVA
 * ==========================================================================================
 *  Los bucles permiten repetir instrucciones sin escribir el mismo codigo
 *  una y otra vez.
 *
 *  En este archivo trabajaras:
 *  - Bucle `for`.
 *  - Bucle `while`.
 *  - Bucle `do-while`.
 *  - Ejemplos practicos organizados en funciones.
 *
 *  Idea clave:
 *  - Un bucle se utiliza cuando una accion debe repetirse varias veces,
 *    ya sea un numero conocido de repeticiones o mientras se cumpla
 *    una determinada condicion.
 *
 *  Objetivo de la practica:
 *  - Ejecutar, observar y modificar cada ejemplo para entender cuando
 *    conviene usar cada tipo de bucle.
 *
 *  Recomendacion:
 *  - Si quieres probar un unico ejemplo, comenta temporalmente el resto
 *    de llamadas dentro de `main`.
 * ==========================================================================================
 */

 import java.util.Scanner; // 📌 Importamos Scanner para leer datos del usuario

 public class UT3_Bucles {
     public static void main(String[] args) {
         Scanner sc = new Scanner(System.in); // 🛠️ Creamos un objeto Scanner para recibir datos del usuario
 
         // 🔵 **Ejecutar fragmentos de código en distintos IDEs**
         // 🔹 En **Visual Studio Code**, comenta otras secciones usando `/* ... */`
         // 🔹 En **NetBeans**, usa `Ctrl + Shift + F6` para ejecutar solo el archivo actual.
         // 🔹 En **IntelliJ IDEA**, usa `Run Configuration` para ejecutar secciones específicas.
 
         // 🟢 Llamamos a las funciones para ejecutar cada tipo de bucle
         ejemploFor();
         ejemploWhile();
         ejemploDoWhile();
         ejercicioFinal();
 
         // ? Cerramos el Scanner
         sc.close();
     }
 
     // * 📖 TEORÍA: BUCLES EN JAVA
     // ────────────────────────────────────────────────────────────
     // ? Los bucles permiten repetir una acción varias veces sin escribir código repetitivo.
     // ? Existen tres tipos principales de bucles en Java:
 
     /*
      * 1️⃣ **FOR**: Se usa cuando sabemos cuántas veces queremos repetir una acción.
      * 2️⃣ **WHILE**: Se usa cuando no sabemos cuántas veces se repetirá, pero hay una condición.
      * 3️⃣ **DO-WHILE**: Similar a `while`, pero siempre se ejecuta al menos una vez.
      */
 
     // * 📖 TEORÍA: Uso de `if`, `else if` y `else` dentro de bucles
     // ────────────────────────────────────────────────────────────
     // ✅ `if` permite ejecutar un bloque de código si se cumple una condición.
     // ✅ `else if` permite evaluar otras condiciones adicionales dentro del bucle.
     // ✅ `else` se ejecuta si ninguna de las condiciones anteriores se cumple.
 
     // * ✨ EJEMPLO 1: Uso del bucle `for`
     public static void ejemploFor() {
         System.out.println("\n🔄 **Ejemplo de bucle FOR: Contar del 1 al 5**");
         for (int i = 1; i <= 5; i++) { // 🔹 Inicialización, condición y actualización en una línea.
             if (i == 3) {
                 System.out.println("⚠ Atención, llegamos al número 3");
             } else {
                 System.out.println("Número: " + i);
             }
         }
     }
 
     // * ✨ EJEMPLO 2: Uso del bucle `while`
     public static void ejemploWhile() {
         System.out.println("\n🔄 **Ejemplo de bucle WHILE: Contar hasta que el usuario ingrese 0**");
         Scanner sc = new Scanner(System.in); // 📌 Nuevo Scanner para lectura de datos.
         int numero;
 
         System.out.print("👉 Ingresa un número (0 para salir): ");
         numero = sc.nextInt();
 
         while (numero != 0) { // 🔹 El bucle sigue hasta que el usuario ingrese 0.
             if (numero % 2 == 0) {
                 System.out.println("✅ El número " + numero + " es par.");
             } else {
                 System.out.println("❌ El número " + numero + " es impar.");
             }
 
             System.out.print("👉 Ingresa otro número (0 para salir): ");
             numero = sc.nextInt();
         }
 
         System.out.println("🚪 Saliste del bucle.");
     }
 
     // * ✨ EJEMPLO 3: Uso del bucle `do-while`
     public static void ejemploDoWhile() {
         System.out.println("\n🔄 **Ejemplo de bucle DO-WHILE: Menú interactivo**");
         Scanner sc = new Scanner(System.in);
         int opcion;
 
         do {
             System.out.println("\n📌 Menú de opciones:");
             System.out.println("1. Saludar");
             System.out.println("2. Mostrar un número aleatorio");
             System.out.println("3. Salir");
             System.out.print("👉 Selecciona una opción: ");
             opcion = sc.nextInt();
 
             switch (opcion) {
                 case 1:
                     System.out.println("👋 ¡Hola, bienvenido!");
                     break;
                 case 2:
                     int aleatorio = (int) (Math.random() * 100);
                     System.out.println("🎲 Número aleatorio: " + aleatorio);
                     break;
                 case 3:
                     System.out.println("🚪 Saliendo del programa...");
                     break;
                 default:
                     System.out.println("⚠ Opción inválida, intenta nuevamente.");
             }
         } while (opcion != 3); // 🔹 El bucle se repite hasta que el usuario elige salir.
     }
 
     // * 📖 EJERCICIO FINAL: Combinación de bucles y condicionales
     public static void ejercicioFinal() {
         System.out.println("\n🎯 **Ejercicio Final: Comprobador de múltiplos con bucles**");
 
         Scanner sc = new Scanner(System.in);
         int numero;
 
         do {
             System.out.print("\n👉 Ingresa un número positivo (0 para salir): ");
             numero = sc.nextInt();
 
             if (numero == 0) {
                 System.out.println("🚪 Saliendo del programa...");
                 break;
             }
 
             // 🔽 Evaluamos si el número es múltiplo de 3, de 5, o de ambos.
             if (numero % 3 == 0 && numero % 5 == 0) {
                 System.out.println("🔥 " + numero + " es múltiplo de 3 y de 5.");
             } else if (numero % 3 == 0) {
                 System.out.println("🔹 " + numero + " es múltiplo de 3.");
             } else if (numero % 5 == 0) {
                 System.out.println("🔸 " + numero + " es múltiplo de 5.");
             } else {
                 System.out.println("❌ " + numero + " no es múltiplo de 3 ni de 5.");
             }
 
         } while (numero != 0);
 
         System.out.println("🚀 ¡Ejercicio completado!");
     }
 }
