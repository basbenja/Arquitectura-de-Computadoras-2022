 	.text
 	.org 0x0000

// original 
// 	add x1,x0,x1
// infLoop:  
// 	cbz XZR infLoop

// ejercicio 2a
// N = 20
// SUB X2, X0, X20 // X2 = -N (en este caso N = 20)
// ADD X3, X0, X0  // X3 = 0
// loop:
//     STUR X3, [X0, 0]
//     ADD X0, X0, X8
//     ADD X3, X3, X1
//     ADD X2, X2, X1
//     CBZ X2, infLoop
//     CBZ XZR, loop
// infLoop:
//     CBZ XZR, infLoop

/* 
Excercise 2b
N = 20, el resultado se tiene que guardar en la dirección X20 (recordar que empieza desde 0)
*/

// First, excercise 2a (initialize memory)
/*
SUB X2, X0, X20 // X2 = -N (en este caso N = 20)
ADD X3, X0, X0  // X3 = 0
ej2a:
    STUR X3, [X0, 0]
    ADD X0, X0, X8
    ADD X3, X3, X1
    ADD X2, X2, X1
    CBZ X2, ej2b
    CBZ XZR, ej2a
ej2b:
    SUB X0, X0, X0      // X0 goes back to value 0
    ADD X4, X0, X0      // Accumulator
    SUB X2, X0, X19     // Iteration variable
    loop:
        LDUR X3, [X0, 0]
        ADD X0, X0, X8
        ADD X4, X4, X3
        ADD X2, X2, X1
        CBZ X2, store
        CBZ XZR, loop
store:
    STUR X4, [X0]
infLoop:
    CBZ XZR, infLoop
*/

/* 
Excercise 2c
Multiplication between registers X16 and X17 and
save result in X0
*/

// 17 * 16 = 17 * 2**4
mult:
    ADD X17, X17, X17
    SUB X2, X2, X1
    CBZ X2, store
    CBZ XZR, mult
store:
    STUR X17, [X0]
infLoop:
    CBZ XZR, infLoop
