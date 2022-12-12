############################
###         PUCRS        ###
### ESTATÍSTICA APLICADA ###
###        AULA 8        ###
### HÉLIO H. BITTENCOURT ###
###   FILIPE J. ZABALA   ###
############################

### VIDEO 8.1
# Correlação universal e amostral. Teste para a correlação. 


### VIDEO 8.2
# Definição do modelo RLS. Estimação dos parâmetros. 


### VIDEO 8.3
# Erro padrão dos coeficientes estimados. Pontos de alavanca ou influentes. Análise dos resíduos. 


### CHECKPOINT 8.1
# Em uma análise de regressão linear simples em que o consumo de energia elétrica 
# por domicílio é função da renda familiar dessa residência, é correto afirmar: 
  
# A. a renda familiar da residência é a variável independente. V
# B. presume-se que um aumento do consumo de energia elétrica por domicílio tem como consequência uma elevação da renda familiar. 
# C. presume-se que 100% das variações do consumo de energia elétrica do domicílio são explicadas por variações da renda familiar. 
# D. o coeficiente angular da reta estimada descreve o valor do consumo de energia elétrica por domicílio que estaria associado a uma família com renda igual a zero. 
# E. o grau de ajustamento da reta estimada em relação aos dados é medido pelo coeficiente de determinação. 



### VIDEO 8.4
# Definição do modelo RLM. Estimação dos parâmetros. 


### VIDEO 8.5
# Variáveis binárias/dicotômicas. Regressão logística binomial. 


### CHECKPOINT 8.2
# Deseja-se estimar o total de carboidratos existentes em um lote de 500.000 g 
# de macarrão integral. Para esse fim, foi retirada uma amostra aleatória simples 
# constituída por 5 pequenas porções desse lote, conforme a tabela seguinte, que 
# mostra a quantidade x amostrada, em gramas, e a quantidade de carboidratos 
# encontrada, y, em gramas. 
# Considerando-se o modelo de regressão linear na forma y = αx + ε, em que ε denota
# o erro aleatório com média nula e variância V, e α representa o coeficiente angular, 
# a estimativa de mínimos quadrados ordinários do coeficiente α é igual a 

# A. 50 
# B. 10 
# C. 1,0 
# D. 0,5 
# E. 0,4 

x <- c(100,80,90,120,110)
y <- c(60,40,40,50,60)
lm(y ~ x)

#### PARA SABER MAIS
# Kunin (2018) - Seeing Theory
# https://seeing-theory.brown.edu/ 

# UC Irvine Machine Learning Repository
# http://archive.ics.uci.edu/ml/index.php 

