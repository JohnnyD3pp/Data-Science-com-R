# Aula 02 - Organizando e visualizando dados

#_________________________________________________________________________

# 1 - Indicando diretorio de trabalho ----

# Pode ser via ctrl + shift + H ou executar o comando abaixo:
setwd("C:/Users/kayla.abreu/OneDrive - ESPM/Documentos/Base de Dados CDD")

#_________________________________________________________________________

# 2 - Ativando o pacote tidyverse ----

# Para ativar um comando selecionamos a linha e usamos ctrl + enter, ou run
library(tidyverse)

#_________________________________________________________________________

# 3 - Leitura de dados .CSV ----

# nome_desejado = read_csv("nome_arquivo.csv")
dados = read_csv("Aula 02.csv")

#_________________________________________________________________________

# 4 - Eliminando linhas com dados ausentes (NA) ----

# Criar uma copia da base de dados para fazer alteracoes
# nome_desejado=drop_na(nome_dataframe)
dados1 = drop_na(dados)

#_________________________________________________________________________

# 5 - Como saber as categorias ou valores de uma variavel ----

# unique(nome_dataframe$nome_variavel) dataframe = base de dados
unique(dados1$Profissao)

#_________________________________________________________________________

# 6 - Filtro em uma coluna da base de dados (1 condicao) ----

# nomedesejado = filter(nome_dataframe, variavel de filtro e condicao de filtro)

# Tarefa 1: Filtre apenas os administradores dessa base de dados e salve em um novo dataframe chamado dados2.
adms = filter(dados1,Profissao=="Administrador")

#_________________________________________________________________________

# 7 - Filtro em uma coluna da base de dados com mais de uma condicao ----

# Filtre a base de dados apenas para as profissC5es Administrador, MC)dico e Professor. Salve em um novo dataframe chamado dados2.

# Temos que usar OU, pois ao usar E, o programa entende que uma mesma pessoa deve ter as 3 profissC5es, dessa forma ele irC! levar qualquer pessoa que obtenha uma das 3 profissC5es
dados2 = filter(dados1, Profissao=="Administrador" | Profissao=="Medico" | Profissao=="Professor")

# Remover apenas um environment
rm(nome_base_de_dados)

#_________________________________________________________________________

# 8 - Contagem e porcentagem das categorias de uma variavel qualitativa ----

# nome_objeto = table(nome_dataframe$nome_variavel)
contagem = table(dados2$Valor_minimo)

# prop.table(table(nome_dataframe$nome_variavel))*100
porcentagem = prop.table(contagem)*100

print(contagem) # Vemos qual contagem C) a do sim e qual C) a do nao
print(porcentagem)

#_________________________________________________________________________

# 9 - Juntando objetos em colunas ou linhas de uma tabela ----

# Colocar os nomes dos objetos nas colunas (GrC!fico de colunas)
tabela1 = cbind(contagem, porcentagem)

# Colocas os nomes dos objetos nas linhas (GrC!fico de linhas)
tabela2 = rbind(contagem, porcentagem)

# Visualizar a tabela pronta
View(nome_tabela1)

#_________________________________________________________________________

# 10 - Arredondamento de valores ----

# Arredondar um numero para tantas casas decimais
round(nome_objeto, n_casas_decimais)

# Arredondar um numero e guardar no objeto (exemplo pratico)
porcentagem = round(porcentagem, 2)

#_________________________________________________________________________

# 11 - Alterar os nomes das linhas e das colunas da tabela ----

# Usamos rownames() e colnames()

# Para alterar linhas usamos:
rownames(nome_tabela)=c(nome_linha1, nome_linha2, etc)

# Para alterar colunas usamos:
colnames(nome_tabela)=c(nome_coluna1, nome_coluna2, etc)

#_________________________________________________________________________

# 12 - Recodificacao de uma variavel ----

# Para recodificar as categorias de uma variC!vel, C) MAIS SEGURO criar um objeto com a recodificaC'C#o utilizando o seguinte comando:
nome_objeto=recode(nome_dataframe$variavel,'valor original1'='valor 
novo1','valor original2'='valor novo2', etc)

PagRecodificado = recode(dados2$Comportamento_pagamento, 'Baixo_gasto_Pagamentos_pequeno_valor' = 'GastoP_PagP', 'Baixo_gasto_Pagamentos_medio_valor' = 'GastoP_PagM', 'Baixo_gasto_Pagamentos_alto_valor' = 'GastoP_PagG', 'Alto_gasto_Pagamentos_pequeno_valor' = 'GastoG_PagP', 'Alto_gasto_Pagamentos_medio_valor' = 'GastoG_PagM', 'Alto_gasto_Pagamentos_alto_valor' = 'GastoG_PagG')

# Ver resultados (elementos) dentro da variC!vel nova
unique(PagRecodificado)

#_________________________________________________________________________

# 13 - Incluir uma coluna nova na base de dados ----

# Inclua na base dados2 uma nova variC!vel chamada Comportamento1 que  contenha as categorias recodificadas no item anterior e que foram armazenadas noobjeto PagRecodificado

# nome_dataframe$nomevariavel_nova = nome_objeto 
dados2$Comportamento1 = PagRecodificado

#________________________________________________________________________

# 14 - Criando uma nova tabela com a nova coluna ----

# Montar uma tabela com a contagem e a % do comportamento de pagamento do cliente apenas para Administrador, MC)dico e Professor (ou seja, com a base dados3)

# Contando o total de variaveis e sua respectiva porcentagem 
contagem_pag = table(dados2$Comportamento1)
porcentagem_pag = prop.table(contagem_pag)*100

# Arredondando o valor da porcentagem
porcentagem_pag = round(porcentagem_pag, 2)

# Criando a tabela (GrC!fico de colunas)
tabela_pag = cbind(contagem_pag, porcentagem_pag)

# Alterando o nome das colunas da tabela
colnames(tabela_pag)=c('Contagem_Pagamentos', '%_Pagamentos')

# Visualizar a tabela
View(tabela_pag)

#_________________________________________________________________________

# 15 - Ordenacao das categorias de uma variavel qualitativa ----

# Ordene corretamente as categorias da variC!vel relacionada ao comportamento de pagamento do cliente (Comportamento1) e refaC'a a tabela

# nome_dataframe$variavel=factor(nome_dataframe$variavel,levels=c("categoria1","categoria2", etc))

dados2$Comportamento1 = factor(dados2$Comportamento1, levels=c('GastoP_PagP', 'GastoP_PagM', 'GastoP_PagG', 'GastoG_PagP', 'GastoG_PagM', 'GastoG_PagG'))

#_________________________________________________________________________

# 16 - Grafico de pizza ----

# Pizza com porcentagens: 
# contagem=table(nome_dataframe$variavel) 
# porcentagem=round(prop.table(contagem)*100,2) 
# pie(porcentagem) 

# Pizza com contagens:
# contagem=table(nome_dataframe$variavel) 
# pie(contagem)

# Tarefa (8) - Construa um grC!fico de pizza indicando se apenas o valor mC-nimo do cartC#o de crC)dito foi pago ou nC#o pelos clientes
pie(contagem)

#_________________________________________________________________________

# 17 - Grafico de pizza com valores ----

rotulos=paste(names(porcentagem),"\n",porcentagem,sep="","%")
pie(porcentagem, 
  main="Pagamento de valor minimo de fatura", # Titulo
  labels=rotulos)

#_________________________________________________________________________

# 18 - Grafico de colunas ----

# Tarefa (9) - Construa um grC!fico de colunas sobre o comportamento de pagamento do cliente

# contagem_pag=table(nome_dataframe$variavel) 
# porcentagem_pag=round(prop.table(contagem)*100,2) 
barplot(porcentagem_pag)

#_________________________________________________________________________

# 19 - Grafico de colunas com valores ----

# Nosso eixo Y nC#o estC! indo do comeco ao final da coluna, ele termina antes da coluna, temos que ajusta-lo
# Usamos (ylim = c(inicio, fim)), o fim deve sempre ser um valor maior

# +2 para que o texto fique 2 posicoes acima da coluna, assim nC#o fica obstruido pela coluna

x = barplot(porcentagem_pag, # Temos que guardar o grafico em uma variavel
  ylim=c(0,40), # Mexe no limite Y do grafico, para ajustar
  main="Distribuicao do comportamento de pagamento") 
  text(x,porcentagem_pag+2,labels=paste(porcentagem_pag,sep="","%"))

#_________________________________________________________________________

# 20 - Selecionando colunas da base de dados ----

# nome_desejado=select(nome_dataframe, nome_variC!vel 1, nome_variC!vel 2, etc)

# TAREFA (10):  Use o comando select() para criar um subconjunto dos dados chamado dados3 que inclua somente as colunas relacionadas C  idade do cliente (Idade), profissC#o (Profissao), renda anual (Renda), nC:mero de contas bancC!rias (Contas), quantidade de outros cartC5es de crC)dito que possui (Cartoes), nC:mero de emprC)stimos (Emprestimos), se paga o valor mC-nimo do cartC#o ou nC#o (Valor_minimo), comportamento de pagamento do cliente (Comportamento1), saldo mensal (Saldo_Mensal), salC!rio base mensal (Base_Mensal) e valor mensal investido (Investimento). 
dados3 = select(dados2, Idade, Profissao, Renda, Contas, Cartoes, Emprestimos, Valor_minimo, Comportamento1, Saldo_Mensal, Base_Mensal, Investimento)

#_________________________________________________________________________

# 21 - Criando, modificando ou delentando colunas ----

# Crie uma coluna nova no dataframe dados4 chamada prop_saldo que armazenarC! qual a proporC'C#o do salC!rio base mensal que o saldo mensal do cliente representa. Visualize a nova coluna. 
dados3 = mutate(dados3, prop_saldo = Saldo_Mensal/Base_Mensal)
  
#_________________________________________________________________________
  
# 22 - Modificando uma coluna ja existente ----
  
# nome_dataframe=mutate(nome_dataframe, nome_coluna_existente=funC'C#o com as variC!veis existentes)

# Modifique a coluna prop_saldo criada na tarefa anterior no dataframe dados3 para que os valores sejam armazenados como porcentagem (0 a 100) e nC#o em proporC'C#o. 
dados3 = mutate(dados3, prop_saldo = Saldo_Mensal/Base_Mensal*100)

#_________________________________________________________________________

# 23 - Obtendo medidas-resumo ----
  
# nome_objeto=summarise(nome_dataframe, "nome_no_output1" = nome_funC'C#o1(variC!vel), "nome_no_output2" = nome_funC'C#o2(variC!vel))
tab_renda = summarise(dados3, 'Renda MC)dia' = mean(Renda), 'Renda Mediana' = median(Renda), 'DP Renda' = sd(Renda))

#_________________________________________________________________________
  
# 24 - Agrupando dados por uma variC!vel qualitativa ----
  
# nome_desejado=group_by(nome_dataframe, variC!vel de agrupamento) 
grupo_profissao = group_by(dados3, Profissao)

# Medidas resumo separadas por profissC5es
tab_renda = summarise(grupo_profissao, 'Renda MC)dia' = mean(Renda), 'Renda Mediana' = median(Renda), 'DP Renda' = sd(Renda))

#_________________________________________________________________________

# 25 - Aplicando uma funC'C#o(C5es) em mC:ltiplas colunas ----

# Aplicando uma C:nica funC'C#o

# across(c(nome_coluna1,nome_coluna2, etc), funC'C#o, nomes desejados)
# Deve ser usada juntamente ao summarise, no lugar do nome_output = fn
tab_medias = summarise(grupo_profissao, across(c(Renda, Saldo_Mensal, Base_Mensal), mean, .names='MC)dia_{.col}'))

# Como usamos apenas uma funC'C#o o mais recomendado C) utilizar a funC'C#o: .names="nomedesejado_{.col}

#_________________________________________________________________________

# 26 - Aplicando mais de uma C:nica funC'C#o em mC:ltiplas colunas ----

tab_resumo = summarise(grupo_profissao, across(c(Renda, Saldo_Mensal, Base_Mensal), list('MC)dia' = mean, 'Mediana' = median, 'DP' = sd), .names='{.col}.{.fn}'))

# Agora usando mais de uma funC'C#o o mais recomendado C) utlizar a funC'C#o: .names="{.col}.{.fn}

#_________________________________________________________________________

# 27 - Aplicando uma ou mais funC'C5es para todas as colunas de uma mesma classe ----

# Para aplicar apenas para variC!veis nC:mericas, utilizamos a funC'C#o: across(where(is.numeric), list(nome_desejado1=funC'C#o1, nome_desejado2=funC'C#o2, etc), nomes desejados) 
tab_resumo2 = summarise(dados3, across(where(is.numeric), list('MC)dia'= mean, 'Mediana' = median, 'DP' = sd), .names='{.col}.{.fn}'))