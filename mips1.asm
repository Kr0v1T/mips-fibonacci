# fib.asm - Subtracao dos dois ultimos termos de Fibonacci (apenas impares)
# Simulador: MARS (MIPS32)

.data
msg_pede: .asciiz "Digite n (maior que 2 e menor que 35): "
msg_erro: .asciiz "Valor invalido! O numero deve ser maior que 2 e menor que 35.\n"
msg_iter: .asciiz "Iteracao "

.text
.globl main

main:
ler_n:
    li   $v0, 4
    la   $a0, msg_pede
    syscall

    li   $v0, 5             
    syscall
    move $t0, $v0            

    ble  $t0, 2, invalido    
    bge  $t0, 35, invalido   
    j    valido

invalido:
    li   $v0, 4
    la   $a0, msg_erro
    syscall
    j    ler_n

valido:
    li   $t1, 0             
    li   $t2, 1              
    li   $t3, 3             

laco:
    bgt  $t3, $t0, fim      

    addu $t4, $t1, $t2       
    subu $t5, $t4, $t2       

    move $t1, $t2            
    move $t2, $t4           

    andi $t6, $t5, 1         
    beq  $t6, $zero, proximo 

    li   $v0, 4
    la   $a0, msg_iter
    syscall

    li   $v0, 1              
    move $a0, $t3
    syscall

    li   $v0, 11             
    li   $a0, 58
    syscall

    li   $v0, 11             
    li   $a0, 32
    syscall

    li   $v0, 1              
    move $a0, $t5
    syscall

    li   $v0, 11             
    li   $a0, 10
    syscall

proximo:
    addi $t3, $t3, 1       
    j    laco

fim:
    li   $v0, 10
    syscall