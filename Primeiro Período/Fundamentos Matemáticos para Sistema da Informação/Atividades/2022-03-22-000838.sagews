︠bf7a55a1-ce68-4736-994f-a507ae5e2d92︠
#Criar um problema de programação linear p.
#Aqui estarei usando o parâmetro 'maximization' como FALSE já que é um problema de minimização de custos.
p = MixedIntegerLinearProgram(maximization=False)

# Declarar as variáveis e associar a p
# Não precisarei inserir entre as restrições que as quantidades de x
#são não negativas, pois em 'p' já estarei considerando a condição de
#não negatividade com o parâmetro 'nonnegative' igual a 'True'.
x = p.new_variable(real=True,nonnegative=True)

#Adicionando as restrições ao problema
p.add_constraint(x[1,1]+x[1,2]+x[1,3]+x[1,4]+x[1,5]<=100)
p.add_constraint(x[2,1]+x[2,2]+x[2,3]+x[2,4]+x[2,5]<=120)
p.add_constraint(x[3,1]+x[3,2]+x[3,3]+x[3,4]+x[3,5]<=120)
p.add_constraint(x[1,1]+x[2,1]+x[3,1]==40)
p.add_constraint(x[1,2]+x[2,2]+x[3,2]==50)
p.add_constraint(x[1,3]+x[2,3]+x[3,3]==70)
p.add_constraint(x[1,4]+x[2,4]+x[3,4]==90)
p.add_constraint(x[1,5]+x[2,5]+x[3,5]==90)

#Definindo a função objetivo
#aqui irei inserir a função de custo que será minimizada
p.set_objective(4*x[1,1]+1*x[1,2]+2*x[1,3]+6*x[1,4]+9*x[1,5]+
                6*x[2,1]+4*x[2,2]+3*x[2,3]+5*x[2,4]+7*x[2,5]+
                5*x[3,1]+2*x[3,2]+6*x[3,3]+4*x[3,4]+8*x[3,5])

#Função para resolver o problema
f=p.solve()
sol = p.get_values(x)

#Imprima o valor de f(x) e o vetor solução
print ("Custo mínimo de transporte para os armazéns:", f)
print ("")
for key in sorted(sol.keys()):
       print ("Variável X", key,'=',sol[key])
︡64145d39-3fb3-4178-ac78-8ad5d907804d︡{"stdout":"Custo mínimo de transporte para os armazéns: 1400.0\n"}︡{"stdout":"\n"}︡{"stdout":"Variável X (1, 1) = 10.0\nVariável X (1, 2) = 50.0\nVariável X (1, 3) = 40.0\nVariável X (1, 4) = 0.0\nVariável X (1, 5) = 0.0\nVariável X (2, 1) = 0.0\nVariável X (2, 2) = 0.0\nVariável X (2, 3) = 30.0\nVariável X (2, 4) = 0.0\nVariável X (2, 5) = 90.0\nVariável X (3, 1) = 30.0\nVariável X (3, 2) = 0.0\nVariável X (3, 3) = 0.0\nVariável X (3, 4) = 90.0\nVariável X (3, 5) = 0.0\n"}︡{"done":true}
︠bb5669be-d28a-4a7c-81d6-2e9bfc96ba4b︠

︡5d30e129-0f38-4fa8-96ec-acd6bc7f3da0︡
︠17956314-ecf5-465f-92b2-0b1ee5d3bf33s︠
#Criar um problema de programação linear p.
#Aqui estarei usando o parâmetro 'maximization' como TRUE já que é um problema de maximização de lucros.
p = MixedIntegerLinearProgram(maximization=True)

# Declarar as variáveis e associar a p
# Não precisarei inserir entre as restrições que as quantidades de x
#são não negativas, pois em 'p' já estarei considerando a condição de
#não negatividade com o parâmetro 'nonnegative' igual a 'True'.
x = p.new_variable(real=True,nonnegative=True)

#Adicionando as restrições ao problema
p.add_constraint(6*x[1,1]+4*x[2,1]<=120)
p.add_constraint(3*x[1,2]+4*x[2,2]<=180)

#Definindo a função objetivo
#aqui irei inserir a função de custo que será minimizada
p.set_objective(30000*x[1,1]+30000*x[1,2]+ 40000*x[2,1]+40000*x[2,2])

#Função para resolver o problema
f=p.solve()
sol = p.get_values(x)

#Imprima o valor de f(x) e o vetor solução
print ("Lucro máximo da produção:", f)
print ("")
for key in sorted(sol.keys()):
       print ("Variável X", key,'=',sol[key])



︡25bf21d0-7b62-4111-85e7-3c2b097618ef︡{"stdout":"Lucro máximo da produção: 3000000.0\n"}︡{"stdout":"\n"}︡{"stdout":"Variável X (1, 1) = 0.0\nVariável X (1, 2) = 0.0\nVariável X (2, 1) = 30.0\nVariável X (2, 2) = 45.0\n"}︡{"done":true}
︠55666839-2891-41d2-aee5-62f00055100a︠
︡f6f8c0fe-19e6-4982-862c-308da8fe06ef︡
︠42d4f0a2-1efc-44db-9435-4ad7a39251a4s︠
#Criar um problema de programação linear p.
#Aqui estarei usando o parâmetro 'maximization' como TRUE já que é um problema de maximização de lucros.

p = MixedIntegerLinearProgram(maximization=False)
x = p.new_variable(real=True,nonnegative=True)

p.add_constraint(20*x[1,1]+50*x[1,2]>=200)
p.add_constraint(50*x[2,1]+10*x[2,2]>=150)
p.add_constraint(30*x[3,1]+30*x[3,2]>=210)

p.set_objective(10*x[1,1]+10*x[2,1]+10*x[3,1]+
                5*x[1,2]+5*x[2,2]+5*x[2,3])
#Função para resolver o problema
f=p.solve()
sol = p.get_values(x)

#Imprima o valor de f(x) e o vetor solução
print ("Custo mínimo da ração:", f)
print ("")
for key in sorted(sol.keys()):
       print ("Variável X", key,'=',sol[key])

︡daa5fadf-8812-4b1f-b4d5-bbbc1b26124f︡{"stdout":"Custo mínimo da ração: 50.0\n"}︡{"stdout":"\n"}︡{"stdout":"Variável X (1, 1) = 0.0\nVariável X (1, 2) = 4.0\nVariável X (2, 1) = 3.0\nVariável X (2, 2) = 0.0\nVariável X (2, 3) = 0.0\nVariável X (3, 1) = 0.0\nVariável X (3, 2) = 7.0\n"}︡{"done":true}
︠19feaa5e-e4ae-44e8-bd9f-597d0a85151d︠

︡fc9a401b-50d8-415d-bab9-64f3b1861e08︡
︠4e98169a-1760-47fc-b33c-404cc32cc061s︠
#Criar um problema de programação linear p.
#Aqui estarei usando o parâmetro 'maximization' como TRUE já que é um problema de maximização de lucros.

p = MixedIntegerLinearProgram(maximization=True)
x = p.new_variable(real=True,nonnegative=True)

p.add_constraint(x[1]+x[2]+x[5]>=0.5)
p.add_constraint(x[3]+x[4]+x[6]<=0.5)
p.add_constraint(x[1]<=0.25)
p.add_constraint(x[2]<=0.25)
p.add_constraint(x[3]<=0.25)
p.add_constraint(x[4]<=0.25)
p.add_constraint(x[5]<=0.25)
p.add_constraint(x[6]<=0.25)
p.add_constraint(x[1]+x[2]+x[3]+x[4]+x[5]+x[6]==1)

p.set_objective(0.087*x[1]+0.095*x[2]+0.12*x[3]+ 0.09*x[4] + 0.13*x[5] + 0.2*x[6])
#Função para resolver o problema
f=p.solve()
sol = p.get_values(x)

#Imprima o valor de f(x) e o vetor solução
print ("Taxa de retorno da carteira de ações:", f)
print ("")
for key in sorted(sol.keys()):
       print ("Variável X", key,'=',sol[key])

︡c5d7a869-c90c-46e9-9061-9990f37a9ad5︡{"stdout":"Taxa de retorno da carteira de ações: 0.13624999999999998\n"}︡{"stdout":"\n"}︡{"stdout":"Variável X 1 = 0.0\nVariável X 2 = 0.25\nVariável X 3 = 0.25\nVariável X 4 = 0.0\nVariável X 5 = 0.25\nVariável X 6 = 0.25\n"}︡{"done":true}
︠f22abdd6-b4b0-49c7-9753-11b38d6db07c︠









