# Booth's Algorithm

![Visitor badge](https://visitor-badge.laobi.icu/badge?page_id=luisalejandrobf.BoothsAlgorithm&left_text=Views)

[English](#booths-algorithm) | [Español](#algoritmo-de-booth)

## About the Repository

This repository contains an implementation of **Booth's algorithm** for **signed binary multiplication**, tailored for the **PDUA processor**, an educational architecture developed by the **Pontificia Universidad Javeriana**.

The algorithm is written in **assembly language** for the PDUA, and the corresponding **binary instructions** are provided to run directly on the processor.

🔗 **PDUA Processor Simulation**: You can interact with the processor architecture through the following CircuitVerse project:  
[https://circuitverse.org/users/91271/projects/pdua-arquitectura_i-sistemas-9f0128d2-6821-40e8-a549-ca3114e69272](https://circuitverse.org/users/91271/projects/pdua-arquitectura_i-sistemas-9f0128d2-6821-40e8-a549-ca3114e69272)

---

## Contents

- `BoothsAlgorithm.asm`: Assembly code implementing Booth's algorithm.
- `BinaryBoothsAlgorithm`: Binary instructions generated from the assembly code.
- `AlgorithmTests/`: Folder with unit tests for key functionalities of the algorithm.

---

## Usage

To execute the algorithm on the PDUA processor:

1. Load the binary instructions (`booth_algorithm_binary.txt`) into the PDUA processor using the [CircuitVerse simulation](https://circuitverse.org/users/91271/projects/pdua-arquitectura_i-sistemas-9f0128d2-6821-40e8-a549-ca3114e69272).
2. Run the simulation and step through the execution.
3. Verify the result of the signed binary multiplication.

⭐️ **Found it useful? Give it a star and help spread the word!** ⭐️

---

# Algoritmo de Booth

[English](#booths-algorithm) | [Español](#algoritmo-de-booth)

## Acerca del Repositorio

Este repositorio contiene una implementación del **algoritmo de Booth** para la **multiplicación binaria con signo**, diseñada para el **procesador PDUA**, una arquitectura educativa desarrollada por la **Pontificia Universidad Javeriana**.

El algoritmo está escrito en **lenguaje ensamblador** para el PDUA, y se incluye su correspondiente versión en **instrucciones binarias** para su ejecución directa.

🔗 **Simulación del procesador PDUA**: Puedes interactuar con la arquitectura del procesador a través del siguiente proyecto en CircuitVerse:  
[https://circuitverse.org/users/91271/projects/pdua-arquitectura_i-sistemas-9f0128d2-6821-40e8-a549-ca3114e69272](https://circuitverse.org/users/91271/projects/pdua-arquitectura_i-sistemas-9f0128d2-6821-40e8-a549-ca3114e69272)

---

## Contenido

- `BoothsAlgorithm.asm`: Código ensamblador que implementa el algoritmo de Booth.
- `BinaryBoothsAlgorithm`: Instrucciones binarias generadas a partir del ensamblador.
- `AlgorithmTests/`: Carpeta con pruebas unitarias para funcionalidades clave del algoritmo.

---

## Uso

Para ejecutar el algoritmo en el procesador PDUA:

1. Carga las instrucciones binarias (`booth_algorithm_binary.txt`) en el procesador PDUA usando la [simulación en CircuitVerse](https://circuitverse.org/users/91271/projects/pdua-arquitectura_i-sistemas-9f0128d2-6821-40e8-a549-ca3114e69272).
2. Ejecuta la simulación paso a paso.
3. Verifica el resultado de la multiplicación binaria con signo.

⭐️ **¿Te resultó útil? ¡Dale una estrella y ayúdanos a difundirlo!** ⭐️
