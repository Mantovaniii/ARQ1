

#Inicia os valores para s0 e s1
addi s0,zero,1
addi s1,zero 5

#Subtrai o valores de s1 por s0 e guarda em s2
sub s2,s1,s0 # 14-10 = 4 = s2

#Loop para que o codigo só acabe quando s2 for igual a s0
for:
blt s0,s2,fim
bne s2,s0,dif
j fim

#Aqui ele adiciona 1 ao valor de s2 para que ele retorne para o loop for e repita até que s2 seja igual a s0
dif:
addi s2,s2,1
j for


fim:
addi s3,zero,1 #Se s3 for 1, mostra que acabou o codigo