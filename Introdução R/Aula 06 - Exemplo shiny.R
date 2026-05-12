# 01 - Leitura dos dados ----
library(tidyverse)
setwd("C:/Users/kayla.abreu/OneDrive - ESPM/Documentos/Base de Dados CDD")

library(readxl)
dados=read_xlsx("Aula 05.xlsx")

# Criando um dados2 somente com renda menor que 100k
dados2=filter(dados, Renda<100000)

# 02 - Ativando o shiny ----
library(shiny)

#-----------------------------------------------------------------------

# 03 - Criando um histograma interativo ----
# Interface com o usuario (ui)

# Um slider que vai de 5 a 15, e começa no 10. Faixas é um nome qualquer
ui = fluidPage(
  sliderInput("faixas", "Número de faixas: ",5,15,10),
  # Como vamos chamar o gráfico
  plotOutput("grafico")
)

#-----------------------------------------------------------------------

# O que deve ser feito com as informações da ui? ----

# O input$faixas indica que o tamanho varia de acordo com o número de faixas escolhidas pelo usuário

server = function(input,output){
  output$grafico = renderPlot({
    ggplot(dados2, aes(x = Renda,y=(after_stat(count)/sum(after_stat(count)))*100)) +
      geom_histogram(fill="hotpink", color="white", bins=input$faixas) + 
      labs(title = "Distribuição de Renda", x = "Renda (dólares)", y = "% de clientes") + theme_bw()
  })
}

#-----------------------------------------------------------------------

# 04 - Solicitando que o app seja executado: ----

shinyApp(ui,server)