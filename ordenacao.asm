.data
array:      .byte 4, 3, 9, 5, 2, 1
		# 3, 4, 5, 2, 1, 9   
		# 3, 4, 2, 1, 5, 9   
		# 3, 2, 1, 4, 5, 9   
		# 2, 1, 3, 4, 5, 9   
		# 1, 2, 3, 4, 5, 9   
tamanho:    .byte 6               
msg:        .asciiz "Array ordenado: "
espaco:     .asciiz " "

.text
main:
    lb $s0, tamanho        
    addiu $t0, $s0, -1    

loop_externo:
    blez $t0, fim_da_ordenacao

    la $t1, array       
    move $t2, $t0          

loop_interno:
    blez $t2, fim_loop_interno

    lb $t3, 0($t1)          
    lb $t4, 1($t1)          

    ble $t3, $t4, nao_troca 

    sb $t4, 0($t1)        
    sb $t3, 1($t1)        

nao_troca:
    addiu $t1, $t1, 1      
    addiu $t2, $t2, -1     
    j loop_interno

fim_loop_interno:
    addiu $t0, $t0, -1      
    j loop_externo

fim_da_ordenacao:
    li $v0, 4
    la $a0, msg
    syscall

    la $t0, array     
    lb $t1, tamanho    

loop_impressao:
    blez $t1, fim_do_programa
    lb $a0, ($t0)
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    addiu $t0, $t0, 1
    addiu $t1, $t1, -1
    j loop_impressao

fim_do_programa:
    li $v0, 10
    syscall
