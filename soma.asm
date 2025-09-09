.data
numero1:    .word 2003
numero2:    .word 2006
numero3:    .word 2003

.text
main:
    lw $t0, numero1    
    lw $t1, numero2 
    lw $t3, numero3

    add $t2, $t0, $t1  
    add $t2, $t2, $t3	
    
    move $a0, $t2     
    li $v0, 1
    syscall       

fim:
    li $v0, 10
    syscall
