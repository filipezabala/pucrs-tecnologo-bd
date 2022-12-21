############################
###         PUCRS        ###
### ESTATÍSTICA APLICADA ###
###        AULA 7        ###
###   FILIPE J. ZABALA   ###
############################

# https://github.com/filipezabala/pucrs-tecnologo-bd


### VIDEO 7.1
# Espaço paramétrico. Definição das hipóteses. Hipóteses uni e bilaterais. 
# A estatística do teste.

# https://filipezabala.com/eb/inferencia-classica.html#teste-de-hip%C3%B3teses-1



### VIDEO 7.2
# Testes para a proporção. Definição e cálculo do p-value. 

# https://filipezabala.com/eb/inferencia-classica.html#teste-de-hip%C3%B3teses-1

n = 25
x = 10
(p = x/n)
pi0 = 0.5

(zt <- (p-pi0)/sqrt(pi0*(1-pi0)/n))

2*0.1587

### VIDEO 7.3
# Decidindo com o p-value. Tipos de erro. Testes para a média. Software JASP.

# https://filipezabala.com/eb/inferencia-classica.html#param%C3%A9tricos-univariados


set.seed(314); x = rpois(30, 2)
mean(x)
mu0 = 0.4
t.test(x, alternative = 'greater', mu = mu0)
DescTools::ZTest(x, alternative = 'greater', mu = mu0, sd_pop = sd(x))

### CHECKPOINT 7.1

# O preenchimento automático de garrafas de água de uma determinada marca segue 
# o modelo de distribuição normal com média μ desconhecida e desvio padrão 
# conhecido igual a σ = 20 mL. Em uma amostra de 4 garrafas, foi encontrado o 
# volume médio de 485 mL. Aplicando-se o teste de hipótese: 
  # H0: μ = 500 ml 
  # H1: μ < 500 ml 
# Com base na amostra obtida, a conclusão do teste é que se rejeita H0 com 
  
# A. 1% de significância. 
# B. 3% de significância, mas não com 1% de significância. 
# C. 5% de significância, mas não com 3% de significância. 
# D. 7% de significância, mas não com 10% de significância. 
# E. 7% de significância, mas não com 5% de significância. V
  
  

### VIDEO 7.4
# Testes bivariados. Comparação de proporções, médias e variâncias. 

# https://filipezabala.com/eb/inferencia-classica.html#param%C3%A9tricos-bivariados

x <- 1:10
y <- c(7:20)
nx <- length(x)
ny <- length(y)
var(y)
var(x)
(Fmax <- var(y)/var(x))
var.test(y,x)

## VIDEO 7.5
# Testes de hipóteses bayesianos. Fatores de Bayes. Testes multivariados. ANOVA. Kurskall-Wallis. 

# https://filipezabala.com/eb/inferencia-bayesiana.html#teste-de-hip%C3%B3teses
# https://sites.stat.washington.edu/raftery/Research/PDF/kass1995.pdf
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7610527/
# https://filipezabala.com/eb/inferencia-classica.html#param%C3%A9tricos-multivariados
# https://filipezabala.com/eb/inferencia-classica.html#n%C3%A3o-param%C3%A9tricos-multivariados

# dados
x <- c(8,10,9,10,9, 7,8,5,8,5, 4,8,7,5,7)
g <- as.factor(rep(1:3, each = 5))
(k <- length(unique(g))) # número de grupos
boxplot(x ~ g)

# validando suposições, veja ?by
by(x,g,shapiro.test)  # S2, normalidade
car::leveneTest(x,g)  # S3, homogeneidade de variâncias

# pela função aov
summary(anova1 <- aov(x ~ g))

# Post-hoc
stats::TukeyHSD(anova1)



### CHECKPOINT 7.2
# Considere duas populações normais e independentes. Para uma delas é extraída 
# uma amostra aleatória simples de tamanho n = 5 e para a outra com m = 4. 
# As duas amostras são apresentadas a seguir: 
# X1 = 4, X2 = 5, X3 = 7, X4 = 8 e X5 = 11 para a população X 
# Y1 = 8, Y2 = 11, Y3 = 19 e Y4 = 22 para a população Y 
# Suponha que o objetivo final é testar se o quociente das variâncias populacionais 
# de Y e X (respectivamente) pode ser considerado igual a 1. 
# Assim, o valor observado da estatística do teste supondo Ho verdadeira será: 
  
# A. 24/52 ou 52/24. 
# B. 90/52 ou 52/90. 
# C 96/52 ou 52/96. 
# D. 9/52 ou 52/9. V
# E. 1 

n <- 5
m <- 4
x <- c(4,5,7,8,11)
y <- c(8,11,19,22)
var(x)
var(y)

MASS::fractions(var(y)/var(x))
var.test(y,x)

MASS::fractions(var(x)/var(y))
var.test(x,y)



### PARA SABER MAIS
# Magnusson (2022) - Understanding p-values Through Simulations - An Interactive Visualization
# https://rpsychologist.com/pvalue/

# Keysers, Gazzola & Wagenmakers (2020) - Using Bayes factor hypothesis testing in neuroscience 
# o establish evidence of absence
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7610527/

# Pereira & Stern (2020) - The e-value: a fully Bayesian significance measure for precise statistical 
# hypotheses and its research program
# https://doi.org/10.1007/s40863-020-00171-7

# Gannon, Pereira & Polpo (2019) - Blending Bayesian and Classical Tools to Define Optimal 
# Sample-Size-Dependent Significance Levels
# https://www.tandfonline.com/doi/full/10.1080/00031305.2018.1518268

# Bernett (1999) - Comparative Statistical Inference, Third Edition
# https://onlinelibrary.wiley.com/doi/book/10.1002/9780470316955

# Kass & Raftery (1995) - Bayes Factors
# https://sites.stat.washington.edu/raftery/Research/PDF/kass1995.pdf

# Pereira & Wechsler (1993) - On the concept of P-value
# https://www.jstor.org/stable/pdf/43600839.pdf

# Berger (1985) - Statistical Decision Theory and Bayesian Analysis
# https://www.springer.com/gp/book/9780387960982

# Efron (1979) - Bootstrap Methods: Another Look at the Jackknife
# http://www.jstor.org/stable/2958830
