// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@16896
D=A
@1
M=D

(MAIN)
@SCREEN
D=A
@0
M=D

@24576
D=M
@OUT
D;JEQ
@FILL
0;JMP

(FILL)
@0
A=M// 点灯させる位置
M=-1// 点灯

@24576
D=M
@MAIN
D;JEQ

@0
MD=M+1// かうんた
@1
D=M-D
@MAIN
D;JLT// 終了
@FILL
0;JMP

(OUT)
@0
A=M// 消灯させる位置
M=0// 消灯

@24576
D=M
@MAIN
D;JGT

@0
MD=M+1// かうんた
@1
D=M-D
@MAIN
D;JLT// 終了
@OUT
0;JMP