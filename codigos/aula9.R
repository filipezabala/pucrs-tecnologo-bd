############################
###         PUCRS        ###
### ESTATÍSTICA APLICADA ###
###        AULA 9        ###
###   FILIPE J. ZABALA   ###
############################

# https://github.com/filipezabala/pucrs-tecnologo-bd

### VIDEO 9.1
# Simulação. O Método de Monte Carlo. A distribuição uniforme. Função 'set.seed'.

# https://filipezabala.com/ea/simulacao.html
# https://filipezabala.com/eb/probabilidade.html#uniforme

set.seed(200000); runif(10)

# R base
par(mfrow=c(3,3))
for(i in 1:9){
  set.seed(i); u <- runif(1000)
  hist(u); rug(u)
}

mean(runif(100))


### VIDEO 9.2
# Binomial, Poisson, normal, exponencial. Função 'sample'. 

# https://filipezabala.com/eb/probabilidade.html#r-como-um-conjunto-de-tabelas-estat%C3%ADsticas

curve(dunif(x))
curve(dnorm(x), -3, 3)

punif(2, 1, 5)

qunif(0.25, 1, 5)


rn = rnorm(10000)
hist(rn, 30, probability = T)
curve(dnorm(x), add = TRUE)

?base::sample

x <- 1:12
sample(x) # a random permutation
sort(sample(x, replace = TRUE))
sample(x, 3)

# bootstrap resampling -- only if length(x) > 1 !
sample(x, replace = TRUE)

### VIDEO 9.3
# Método da Transformação Inversa. Amostragem com rejeição.

# https://filipezabala.com/ea/simulacao.html#m%C3%A9todo-da-transforma%C3%A7%C3%A3o-inversa
# https://filipezabala.com/ea/simulacao.html#amostragem-com-rejei%C3%A7%C3%A3o

# Passo 1: uniforme em [0,1]
set.seed(1); u <- runif(1000)
hist(u); rug(u)

# Passo 2: exponencial de taxa 3
lambda <- 3
x <- -log(1-u)/lambda
hist(x, 15, probability = TRUE); rug(x)
curve(dexp(x, rate = 3), col = 'red', add = TRUE)


# Amostragem por rejeição
# gráficos
curve(dexp(x, 1), 0, 10, col = 4, ylab = 'Densidade')
segments(0, 1, 10, 1, col = 1)
legend('right', c('10*g(x) Uniforme(0,10)', 'f(x) Exponencial(1)'), lty = 1, 
       col = c(1, 4), bty = 'n')

# elementos da simulação
fdist <- vector()
lambda <- 1
g <- 1/10
k <- 10
M <- 1000
j <- 0

# loop
ini <- Sys.time()
for(i in 1:M){
  
  # Passo 1: Simular U ~ Unif(0,1)
  set.seed(i); (U <- runif(1, 0, 1))
  
  # Passo 2: Simular um candidato X ~ g, i.e., X ~ Unif(0,10)
  set.seed(i+1); (X <- runif(1, 0, 10))
  
  # Apresentando X no gráfico
  rug(X)
  
  # Avaliando f no ponto candidato X
  f <- lambda*exp(-lambda*X)
  
  # Passo 3: decidindo se o candidato entra ou não na amostra
  # Se U > f/(k*g) indicar com um x vermelho, X não entra como ponto de f
  if(U > f/(k*g)){
    points(X, U, pch = 'x', col = 'red')
  }
  # Se U <= f/(k*g)), indicar com um x verde, X entra como ponto de f
  if(U <= f/(k*g)){
    points(X, U, pch = 'x', col = 'green')
    j <- j+1
    fdist[j] <- X
  }
  # print(i/M)
}

### CHECKPOINT 9.1
# Qual distribuição de probabilidade embasa o Método de Monte Carlo? 
  
# A. Normal 
# B. Exponencial 
# C. Binomial 
# D. Poisson 
# E. Uniforme V

# https://www.dam.brown.edu/people/dem/0123017505/MetropolisUlamJASA1949.pdf 


### VIDEO 9.4
# Bootstrap. Exemplos.

# https://filipezabala.com/ea/simulacao.html#bootstrap

sample(1:10, 10, replace = TRUE)

# gerando as re-amostras via bootstrap
library(bootstrap)
n <- 20
set.seed(321); x <- rnorm(n, mean = 1.69, sd = 0.12)
round(x,2)
round(mean(x),2)
theta <- function(x){mean(x)}
results <- bootstrap::bootstrap(x, 1000, theta)

# intervalo de confiança via bootstrap
m_boot <- mean(results$thetastar)
li_boot <- quantile(results$thetastar, .025)
ls_boot <- quantile(results$thetastar, .975)
round(c(li_boot, ls_boot), 5)

# intervalo de confiança assintótico
li_ass <- mean(x)-1.96*sqrt(var(x)/n)
ls_ass <- mean(x)+1.96*sqrt(var(x)/n)
round(c(li_ass, ls_ass), 5)

# gráficos
hist(results$thetastar, 25, main = 'Estimativas via bootstrap')
abline(v = m_boot, col = 'red')
abline(v = li_boot, col = 'blue')
abline(v = ls_boot, col = 'blue')

# https://github.com/filipezabala/desempateTecnico

library(desempateTecnico)
bayes(c(.4,.3,.3), 1000)




### VIDEO 9.5
# Aplicando a abordagem de aprendizado de máquina (treino-teste)

B <- 1000
acc <- vector(length = B)

for(i in 1:B){
  # amostra de treino: 60%
  prop_train <- 0.6
  n <- nrow(iris)
  set.seed(i); itrain <- sort(base::sample(1:n, floor(prop_train*n)))
  
  train <- iris[itrain,]
  test <- iris[-itrain,]
  
  # modelo de regressão logística multinomial
  fit <- nnet::multinom(Species ~ ., data = train)
  # summary(fit)
  
  # predição
  pred <- predict(fit, test)
  
  # matriz de confusão
  (cm <- table(pred, test[,5]))
  
  # relatório via caret::confusionMatrix
  # caret::confusionMatrix(cm)
  
  acc[i] <- sum(diag(cm))/sum(cm)
}

hist(acc)
summary(acc)


### CHECKPOINT 9.2
# Pode-se afirmar sobre o método de bootstrap: 

# A. É utilizado para estimação de taxas e cálculos de insolvência. 
# B. Depende de amostras sem reposição. 
# C. Requer o uso de distribuições de probabilidade multivariadas. 
# D. Está baseado no teorema de Bayes, que indica a robustez das convergências 
# de medidas assimétricas obtidas a partir da curva de Gauss. 
# E. Pode ser utilizado na estimação da variância da mediana amostral e de parâmetros de regressões.


# http://www.jstor.org/stable/2958830

#### PARA SABER MAIS
# Peng (2022) - R Programming for Data Science
# https://bookdown.org/rdpeng/rprogdatascience/simulation.html 

# Izbicki & Santos (2020) - Aprendizado de máquina: uma abordagem estatística
# http://www.rizbicki.ufscar.br/AME.pdf 

# Holmes & Huber (2019) - Modern Statistics for Modern Biology
# https://web.stanford.edu/class/bios221/labs/simulation/Lab_3_simulation.html 

# Efron (1979) - Bootstrap Methods: Another Look at the Jackknife
# http://www.jstor.org/stable/2958830

# Metropolis & Ulam (1949) - The Monte Carlo Method 
# https://www.dam.brown.edu/people/dem/0123017505/MetropolisUlamJASA1949.pdf 

