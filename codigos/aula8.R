############################
###         PUCRS        ###
### ESTATÍSTICA APLICADA ###
###        AULA 8        ###
###   FILIPE J. ZABALA   ###
############################

# https://github.com/filipezabala/pucrs-tecnologo-bd



### VIDEO 8.1
# Correlação universal e amostral. Teste para a correlação.

# https://filipezabala.com/eb/correg.html

dr <- read.table('https://filipezabala.com/data/drinks.txt', header = T)
head(dr)
cor(dr$temp, dr$gar)
cor.test(dr$temp, dr$gar)



### VIDEO 8.2
# Definição do modelo RLS. Estimação dos parâmetros. Análise de diagnóstico.

# https://filipezabala.com/eb/rls.html

sx = sum(dr$temp)
sx2 = sum(dr$temp^2)
sy = sum(dr$gar)
sy2 = sum(dr$gar^2)
sxy = sum(dr$temp*dr$gar)
n = nrow(dr)

(b1 = (n*sxy - sx*sy)/(n*sx2 - sx^2))
(b0 = sy/n - b1*(sx/n))

plot(dr$temp, dr$gar)
abline(a = b0, b = b1, col = 'red')

fit = lm(dr$gar ~ dr$temp)
summary(fit)


### VIDEO 8.3
# Pontos de alavanca ou influentes. Análise dos resíduos. 
# Definição do modelo RLM. Estimação dos parâmetros.

fit0 = lm(dr$gar ~ dr$temp - 1)
summary(fit0)
abline(a = 0, b = fit0$coefficients[1], col = 'blue')

xobs = 39
5.35819*39


par(mfrow=c(2,2))
plot(fit, which=1:4)
plot(fit0, which=1:4)

AIC(fit)
AIC(fit0)


# libs
library(readxl)

# arquivo
url1 = 'http://archive.ics.uci.edu/ml/machine-learning-databases/00242/ENB2012_data.xlsx'
download.file(url1, 'temp.xlsx', mode = 'wb')
energy = read_excel('temp.xlsx')

# dando uma olhada nas variáveis
str(energy)

# modelo saturado
fit0 = lm(Y1 ~ X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8, data = energy)
summary(fit0)


### CHECKPOINT 8.1
# Em uma análise de regressão linear simples em que o consumo de energia elétrica 
# por domicílio é função da renda familiar dessa residência, é correto afirmar: 
  
# A. presume-se que um aumento do consumo de energia elétrica por domicílio tem como consequência uma elevação da renda familiar. 
# B. presume-se que 100% das variações do consumo de energia elétrica do domicílio são explicadas por variações da renda familiar. 
# C. o coeficiente angular da reta estimada descreve o valor do consumo de energia elétrica por domicílio que estaria associado a uma família com renda igual a zero. 
# D. o grau de ajustamento da reta estimada em relação aos dados é medido pelo coeficiente de determinação. 
# E. a renda familiar da residência é a variável independente. V



### VIDEO 8.4
# Modelo saturado. Método de stepwise. Variáveis binárias/dicotômicas. Regressão logística binomial. 

# libs
library(readxl)

# arquivo
url1 = 'http://archive.ics.uci.edu/ml/machine-learning-databases/00242/ENB2012_data.xlsx'
download.file(url1, 'temp.xlsx', mode = 'wb')
energy = read_excel('temp.xlsx')

# dando uma olhada nas variáveis
str(energy)

# modelo saturado
fit0 = lm(Y1 ~ X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8, data = energy)
summary(fit0)

# filtrando as variáveis com stepwise
fit1 = step(fit0)
summary(fit1)

# binárias
n <- 20
(y <- c(rep(0,n), rep(1,n)))
(taby <- table(y))
prop.table(taby)

library(tidyverse)
set.seed(1); (x1 <- c(rbinom(n,1,.2), rbinom(n,1,.9)))  # gerando sequência pseudoaleatória
by(y,x1,table) %>%   # contando o número de zeros e uns em y separado por x1
  lapply(prop.table) # calculando as proporções 

set.seed(1); (x2 <- rbinom(2*n,1,.5)) # simulando valores de X2

by(y,x2,table) %>%  # contando os zeros e uns de y, separados pelos valores de X2
  lapply(prop.table) # transformando a contagem em proporção


# modelo 1
x1 <- as.factor(x1)  # convertendo em fator para usar a função glm
fit1 <- glm(y ~ x1, family = 'binomial') # ajustando modelo logístico
summary(fit1) # detalhamento do modelo

# modelo 2
x2 <- as.factor(x2)  # convertendo em fator para usar a função glm
fit2 <- glm(y ~ x2, family = 'binomial') # ajustando modelo logístico
summary(fit2) # detalhamento do modelo

### VIDEO 8.5
# Redução de dimensionalidade.

# https://filipezabala.com/ea/reducao-dimensionalidade.html

head(iris)

# Ex. 7.1
library(ggfortify)
x <- read.table('https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data', sep = ',')
x2 <- x[,-c(1,2)]

head(x)
table(x$V2)

head(x2)

cp <- prcomp(x2, scale = T)
library(ggfortify)
autoplot(cp, data = x, colour = 'V2', 
         loadings = T, loadings.label = T, type = 'raw')


### CHECKPOINT 8.2
# Deseja-se estimar o total de carboidratos existentes em um lote de 500.000 g 
# de macarrão integral. Para esse fim, foi retirada uma amostra aleatória simples 
# constituída por 5 pequenas porções desse lote, conforme a tabela seguinte, que 
# mostra a quantidade x amostrada, em gramas, e a quantidade de carboidratos 
# encontrada, y, em gramas. 
# Considerando-se o modelo de regressão linear na forma y = αx + ε, em que ε denota
# o erro aleatório com média nula e variância V, e α representa o coeficiente angular. 
# A estimativa de mínimos quadrados ordinários do coeficiente α é igual a 

# A. 50 
# B. 10 
# C. 1,0 
# D. 0,5  V
# E. 0,4 

x <- c(100,80,90,120,110)
y <- c(60,40,40,50,60)
plot(x,y)

sxy = sum(x*y)
sx2 = sum(x^2)
b1 = sxy/sx2
b1

lm(y ~ x - 1)


#### PARA SABER MAIS
# Kunin (2018) - Seeing Theory
# https://seeing-theory.brown.edu/ 

# UC Irvine Machine Learning Repository
# http://archive.ics.uci.edu/ml/index.php 

