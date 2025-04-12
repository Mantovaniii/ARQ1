# riscv-semana2.asm
# Trechos de código da aula teórica da semana 2
# Objetivos: 
#    -Entender o funcionamento do computador simplificado
#    -Contato inicial com programação assembly RISC-V
#


.data	#Aqui é onde sao declaradas as variaveis na memoria
x: .word 5,6,7	         # 3 inteiros (5, 6, 7)
y: .string "ufscar"	 # string "ufscar"
z: .string "computacao"  # string "computacao"
k: .word 55		 # inteiro 55

memDados: .word  7,1,25,3,4,5,6,7,8,9 # 10 numeros armazenados na memoria // como se fosse um vetor
abc: .word 55			      # inteiro 55
pulaLinha: .string "\n\r"	      # string que pula linha


.text # Aqui começa a parte executavel do codigo, o main


main:

       ######## PARTE A: - Instruções de adição / subtração:
       #Inicialização de registradores
       addi t1, zero, 0 
       addi t2, zero, 5 
       addi t3, zero, 36
       addi t4, zero, 4
       #Aqui ele adicionou todos os valores a zero mais um valor, ou seja, ele inicalizou os valores
       
       add t1, t2, t3 # t1 = t2 + t3 =>   5 + 36 = 41 
       
       sub t1, t2, t3 # t1 = t2 - t3 =>   5 - 36 = -31
       
       add t1, t2, t3 # Repete a ação de somar o t2 com t3 
       
       sub t1, t1, t4 # t1 = t1 - t4 =>   41 - 4 = 37 
       
       li a7, 1 # codigo de serviço 1 (print inteiro)
       mv a0,t1 # move t1 (37) para a0 (argumento do sistema)
       ecall    # faz o sistema imprimir
       
       li a7,4 # codigo de serviço 4 (print string)
       la a0, pulaLinha # carrega o endereço da strign pulaLinha
       ecall # imprime "\n\r"
       
       li a7, 1 # print inteiro de novo
       mv a0,t1 
       ecall
       
       
       
       
       ######## PARTE B: - InstruÃ§Ãµes multiplicaÃ§Ã£o / divisÃ£o
       #InicializaÃ§Ã£o de registradores
       addi s1, zero, 100
       addi s2, zero, 60 
       addi s3, zero, 20
       addi s4, zero, 15
       
       
       
       #InstruÃ§Ãµes multiplicaÃ§Ã£o / divisÃ£o
       
       mul s3, s1, s2 # 100 * 60 = 6000 (multiplicacao normal)
       mulh s4, s1, s2 # s4 vai receber a parte alta de 100*60 mas como esse produto é pequeno s4 será zero
       
       div  s3, s1, s2  # s3 = s1/s2 = 1(inteiro)
       rem  s4, s1, s2  # s4 = s1%s2 = 40(resto da divisao)




	######## PARTE C: -Instruções Lógicas (and, or, xor)
	#Inicilaiza registradores com valores
	li t0, 0x0F0F	# t0 = 0000 1111 0000 1111
	li t1, 0x00FF	# t1 = 0000 0000 1111 1111
	
	# Operação AND
	and t2, t0, t1	# t2 = t0 AND t1 0000 0000 0000 1111
	
	# Operação OR
	or t3, t0, t1 # t3 = 0000 1111 1111 1111
	
	# Operação XOR
	xor t4, t0, t1 # t4 = 0000 1111 1111 0000
	
	#EXTRA - Operação NOT
	li t5, -1 #0xFFFFFFFF = 0x11111111111111111111111111111111 que quando feito um xor, nega o valor
	xor t6, t0, t5 # t6 = not(t0)
	
	######## PARTE D: -Instruções de acesso à  memória (lw, sw)
	 la t1, memDados  # la: instrução para armazenar em t1 o endereço de um dado na memória de dados.
	 la t2, abc
	 lw s3, 16(t1) #foi alterado o valor de 8 (que mostrava o valor de 25) para 16 que agora mostra, em s3, o valor de 4
	
	
	
	
	######## PARTE E: -ProgramaÃ§Ã£o: desvio condicional (if-then, if-then-else)
	addi s0,zero,0
	addi s1,zero,0
	
	back:
	beq s1,s0, iguais
	j fim
	
	iguais:
	addi s0,s0,1
	addi s1,s1,2
	j back
	
	
	######## PARTE F: -Programação: loops (for, while)

	addi s8, zero, 0
	add s7, zero, zero
	addi t6, zero, 10
	for:
		beq s7, t6, done
		add s8, s8, s7
		addi s7, s7, 1
		j for
	done:
		add s0, zero, s8
		add s1, zero, zero
		addi t0, zero, 128
	while:
		beq s0, t0, fim
		addi s0, s0, 1
		j while



        # Exit program
        
        fim:
        li a7, 10
        ecall


