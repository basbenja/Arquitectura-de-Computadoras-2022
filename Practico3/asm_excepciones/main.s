.text
.org 0x0000

ADD X29, XZR, XZR // Opcode invalido
ADD X30, XZR, XZR // Exc externa

STUR X1, [X0, #0]       // MEM 0:0x1
STUR X2, [X0, #8]       // MEM 1:0x2
STUR X3, [X16, #0]      // MEM 2:0x3
ADD X3, X4, X5
STUR X3, [X0, #24]      // MEM 3:0x9
SUB X3, X4, X5
STUR X3, [X0, #32]      // MEM 4:0xFFFFFFFFFFFFFFFF
SUB X4, XZR, X10
STUR X4, [X0, #40]      // MEM 5:0xFFFFFFFFFFFFFFF6
ADD X4, X3, X4
STUR X4, [X0, #48]      // MEM 6:0xFFFFFFFFFFFFFFF5
CBNZ x2, loop1          // OPCODE INVALIDO
SUB X5, X1, X3
STUR X5, [X0, #56]      // MEM 7:0x2
AND X5, X10, XZR
STUR X5, [X0, #64]      // MEM 8:0x0
AND X5, X10, X3
STUR X5, [X0, #72]      // MEM 9:0xA
AND X20, X20, X20
STUR X20, [X0, #80]     // MEM 10:0x14
ORR X6, X11, XZR
CBNZ x2, loop1    // OPCODE INVALIDO
STUR X6, [X0, #88] // MEM 11:0xB
ORR X6, X11, X3
STUR X6, [X0, #96] // MEM 12:0xFFFFFFFFFFFFFFFF
LDUR X12, [X0, #0]
ADD X7, X12, XZR
STUR X7, [X0, #104] // MEM 13:0x1
STUR X12, [X0, #112] // MEM 14:0x1
ADD XZR, X13, X14
STUR XZR, [X0, #120] // MEM 15:0x0
CBZ X0, loop1
STUR X21, [X0, #128] // MEM 16:0x0(si falla CBZ =21)
loop1:
    STUR X21, [X0, #136] // MEM 17:0x15
    ADD X2, XZR, X1
loop2:
    SUB X2, X2, X1
    ADD X24, XZR, X1
    STUR X24, [X0, #144] // MEM 18:0x1 y MEM 19=0x1
    ADD X0, X0, X8
    CBZ X2, loop2
    cbnz x2, loop1    // OPCODE INVALIDO

infloop:
    cbz xzr, infloop

.org 0xD8
    mrs X28, S2_0_C2_C0_0 // ESR --> X28
    sub X28, X28, X1      // 0 si EStatus es 0001 (interrupción externa)
    cbz X28, extIRQ
    // Opcode inválido
    ADD X29, X29, X1
    STUR X29, [X16, #216] // X29 <--> MEM[29]
    ERET
extIRQ:
    ADD X30, X30, X1
    STUR X30, [X16, #224] // X30 <--> MEM[30]
    ERET
