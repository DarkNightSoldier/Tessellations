<p align="center"><img src="https://alejandrohiguera.codes/POO2020/banner-ing.svg" width="100%"></p>

# Tessellations: Conjunto de juegos de tipo Tile-Matching con uso de poliformas

**Autores:**  Raúl Mauricio Peña Losada y Alejandro Higuera Castro

**Fecha de publicación:** 8 de octubre de 2020

**Fecha de modificación:** 7 de diciembre de 2020

**Elaborado para:** 2016375-Programación Orientada a Objetos

**Diapositivas disponibles aquí** [https://alejandrohiguera.codes/SlidesOOP](https://alejandrohiguera.codes/SlidesOOP)

**Versión:** 2

## Contenido
1. [Introducción](#1-introducción)
2. [Objetivo](#2-objetivo)
3. [Estructura del programa](#3-estructura-del-programa)
   - [Clase Board](#31-clase-board)
   - [Clase Polyform](#32-clase-polyform)
  4.  [Creación y representación de una poliforma](#4-creación-y-representación-de-la-poliforma)
  5.  [Características principales del proyecto](#5-caracteristicas-principales-del-proyecto)
  6.  [Conclusiones](#6-conclusiones)
  7.  [Implementaciones futuras](#7-implementaciones-futuras-y-limitaciones)
  8.  [Referencias](#8-referencias)
   
## 1. Introducción

Como segunda y tercera entrega para el curso de Programación Orientada a Objetos desarrollamos un conjunto de juegos de Tile Matching bajo el paradigma de programación orientada a objetos.

Se espera que este proyecta sirva como base para crear aún muchos más tipos de juegos de tile matching que los presentados aquí.

## 2. Objetivo

- Emplear el paradigma de [programación orientada a objetos](https://github.com/objetos/objects) para implementar uno o varios juegos basados en [polyominoes](https://en.wikipedia.org/wiki/Polyomino), como [Pentomino puzzles](https://en.wikipedia.org/wiki/Pentomino#Constructing_rectangular_dimensions) o el [tetris](https://en.wikipedia.org/wiki/Tetris), entre otros.

## 3. Estructura del programa
<p align="center"><img src="https://alejandrohiguera.codes/POO2020/P2/UML.png" width="100%"></p>
El programa se compone de 5 clases: Polyform, Board, HexagonalBoard,SquareBoard y CircleBoard.

La clase Polyform se encuentra contenida en la definición de la clase Board, y de esta clase derivan las clases hijas HexagonalBoard y SquareBoard.

### 3.1. Clase Board
Las funciones básicas para la implementación  de cualquier juego de Tile Matching se encuentran en la clase Board. 

Algunas de las funcionalidades incluidas en esta clase son:
- Verificar la viabilidad de un movimiento.
- Dibujar la poliforma.
- Teselar un tablero.
- Almacenar la representación de un tablero con celdas de valores enteros.
- Eliminar celdas y columnas.
- Verificación de celdas.
- Generación de poliformas de forma aleatoria.
- Almacenamiento de puntaje
- Etiquetado de la poliforma.

### 3.2. Clase Polyform

Las funciones básicas para la implementación  de cualquier poliforma (Polystick, polyiamond, polydrafter, polyomino, polyhex, entre otros). 

Algunas de las funcionalidades incluidas en esta clase son:Algunas de las funcionalidades incluidas en esta clase son:
    - Previsualizar un movimiento de la poliforma (Caída, rotación, reflexión, desplazamiento e intercambio de celdas).
    - Obtener un arreglo con las posiciones de la poliforma en el tablero que se encuentra.
    - Generar una poliforma a partir de un cadena de texto que tiene una representación equivalente a una matrix bidimensional.
    - Generar una matrix bidimensional asociada a la poliforma.

## 4. Creación y representación de la poliforma
La creación de la poliforma se realiza con un String asociado a la matriz que representa la poliforma.

**Ejemplo:** La cadena de texto  ``` 440-044-000 ```  tiene las siguientes características:
Su representación equivalente matricial es:
<p align="center"><img src="https://alejandrohiguera.codes/POO2020/P2/matrix2.png" width="25%"></p>
Sus posibles representaciones gráficas son:
<p align="center"><img src="https://alejandrohiguera.codes/POO2020/P2/possiblepolyforms.png" width="100%"></p>

## 5. Características principales del proyecto
- Las clases Board y Polyform sirven para la implementación de diversos juegos del género TileMatching, funcionan como la API del conjunto.
- Creación visual intuitiva de la poliforma de acuerdo a lo mostrado en 4.
- Muy pocas líneas de código si se necesitan hacer varios juegos con diversas poliformas y dinámicas.
- Representación común para diversos tipos de poliformas.
- Rápida implementación de los juegos que se deseen..
- Las clases Board y Polyform se encuentran totalmente documentadas con JavaDoc, así son relativamente fáciles de usar para quien desee implementarlas.
- Derivación de clases hijas a partir de la clase Board, no es necesario que se hagan muchas clases para la implementación de un conjunto de juegos.
- Los movimientos se aplican sobre el arreglo correspondiente a la figura.
- Desplazamiento celda a celda de la poliforma.
- Los métodos drawPolyform() y drawFigure() al ser abstractos se pueden implementar para teselar cualquier forma a criterio del programador. Esto va muy de la mano del polimorfismo que se requiere para implementar poliformas con distintas figuras.
- Los tableros pueden personalizarse en tamaño y ubicación donde se muestran, así incluso por ejemplo para hacer la previsualización de la siguiente figura del juego del Tetris se usa otro tablero.
- Barra lateral con las variables asociadas al juego, totalmente personalizable.
- Uso de arreglos mixtos (Areglos de ArrayList de enteros) y arreglos bidimensionales de enteros.
- Movimiento de la figura mediante una previsualización con ```public ArrayList<Integer>[]previewMovement(String type) ```  y su verificación en el tablero con   ```protected boolean verifyPositions(ArrayList<Integer>[]positionArray)```.
 - Uso de modificadores de acceso , para que algunos métodos solamente puedan ser ejecutados por la clase padre e hija.
 
## 6. Conclusiones
- El conjunto de juegos del género Tile Matching comparten una cantidad considerable de métodos y atributos, por ello es pertinente hacer una heriencia a la hora de hacer un conjunto de juegos de este tipo con el fin de evitar escribir más líneas de código.
- La clases Polyform y Board, abstraen el concepto de poliforma como una figura que tiene una representación matricial cuadrada y una teselación. Lo cual permite, la coexistencia de distintos tipos de poliformas en un mismo ambiente de programación.
- A grandes rasgos gran parte de la estructura del proyecto se conserva respecto a la versión 1, en concordancia con el objetivo del proyecto de proveer un fácil y rápido despliegue para el desarrollo simultáneo de múltiples juegos de Tile Matching.
- La implementación de un algoritmo recursivo para la revisión de bloques vecinos fue prudente, dado que el tamaño del tablero no es amplio y la función resulta más corta de implementar que con un algoritmo iterativo como se pensó en primer momento, esto tomando como referencia la función para el *2048* que ya se había implementado, pero chequea vecinos en todas las direcciones.

## 7. Implementaciones futuras y limitaciones
- Implementación con otros tipos de poliformas (Polidiamantes, polydrafter, poliábolo, policubo, poliominoide).

- Juegos del tipo Tile Matching con funciones como bloqueo de celda, celdas bonus, entre otros.

- Implementación de juegos que usen PShapes de manera amplia, siguiendo el camino del TileMatching.

 #### Limitaciones
 
 - Implementación del movimiento de una poliforma con teselación compleja.
     
 - Dado que está en Processing el JavaDoc no se muestra de forma interactiva.
     
- El SameGame requiere un frameRate superior a 70 fps dada la cantidad de operaciones que se ejecutan para la verificación de las celdas y la recursión que se usa.
     
 - Dada la recursión que se usa no sería posible cambiar el tamaño del tablero a uno muy amplio para el SameGame, pues arrojaría error de Recursión (Este error ya fue       probado).
      
- En el SpaceTris no resulta igual de fácil para el jugador completar una línea.
      
- Se probó la libreria de Sage pero no podía ser instalada con el manejador de paquetes de Python (PIP), debía ser instalada directamente en el equipo. Adicionalmente se probó con algunos tetrominos de prueba y no arrojó resultado para teselaciones posibles.

## 8. Referencias

1. Juegos Hexagonales - Ganaysa. Recuperado de: https://play.google.com/store/apps/details?id=air.Ganaysa.HexaNumbersGames

2. Jean Pierre Charalambos - p5.polyomino.js. Recuperado de  https://github.com/objetos/p5.polyomino.js

3. Geeks for Geeks - Rotate a matrix by 90 degree in clockwise direction without using any extra space. Recuperado de
https://www.geeksforgeeks.org/rotate-a-matrix-by-90-degree-in-clockwise-direction-without-using-any-extra-space/

4. Polyform - Wikipedia. Recuperado de  https://en.wikipedia.org/wiki/Polyform

