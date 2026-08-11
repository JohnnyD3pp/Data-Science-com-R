# Aula 01 - Ambientacao no Rstudio

# 1 - Criando Objetos no R ----

#_______________________________________________________________________

# Objeto com numeros armazenados

# nome_objeto = conteudo desejado / n = 10
n = 10
N = 20 # Objetos diferentes

# nome_objeto ,_ conteudo_desejado
num <- 30

# conteudo_desejado -> nome_objeto
n + num -> resultado

#_______________________________________________________________________

# Objeto com textos armazenados

# nome_objeto = 'conteudo desejado'
a = 'Selmini'

# nome_objeto <- 'conteudo desejado'
b <- 'Rafa'

# 'conteudo desejado' -> nome_objeto
'Surian' -> c

#_______________________________________________________________________

# Objetos que contenham mais de 1 conteudo ou texto

# Usamos c()
# nome_objeto = c('conteudo', 'conteudo2', etc)
obj1 = c('abc', 'def')

# nome_objeto <- c('conteudo', 'conteudo2', etc)
obj2 <- c('hij', 'klm')

# c('conteudo', 'conteudo2', etc) -> nome_objeto
c('nop', 'qrs') -> obj3

alunos = c('Johnny', 'Brad') # Ao mudar os valores e executar denovo
notas = c(10, 9.5) # os valores são atualizados, como um novo objeto

#_______________________________________________________________________

# 2 - Mostrando o conteudo do objeto ----

# print(nome_objeto)
# nome_objeto
print(alunos)
notas