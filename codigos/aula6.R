############################
###         PUCRS        ###
### ESTATÍSTICA APLICADA ###
###        AULA 6        ###
### HÉLIO H. BITTENCOURT ###
###   FILIPE J. ZABALA   ###
############################

# https://github.com/filipezabala/pucrs-tecnologo-bd


### VIDEO 6.1
# Uma perspectiva do curso e do material. Formalização dos conceitos de Inferências Clássica e Bayesiana. 
# (Função de) Verossimilhança. Princípio da verossimilhança.

# https://onlinelibrary.wiley.com/doi/book/10.1002/9780470317105
# https://filipezabala.com
# https://filipezabala.com/eb/introducao.html
# https://filipezabala.com/eb/inferencia-bayesiana.html
# https://filipezabala.com/eb/inferencia-bayesiana.html#fun%C3%A7%C3%A3o-de-verossimilhan%C3%A7a
# https://filipezabala.com/eb/inferencia-bayesiana.html#princ%C3%ADpio-da-verossimilhan%C3%A7a


### VIDEO 6.2
# Probabilidade condicional e o teorema de Bayes. Priori, verossimilhança e posteriori. Operação bayesiana. 

# https://filipezabala.com/eb/probabilidade.html#probabilidade-condicional
# https://filipezabala.com/eb/probabilidade.html#teorema-da-probabilidade-total-e-o-teorema-de-bayes
# https://filipezabala.com/eb/inferencia-bayesiana.html

# Exemplo 3.20 (Teorema de Bayes) Suponha uma caixa com três moedas, uma equilibrada e duas com duas faces cara. 
# A probabilidade condicional de a moeda sorteada ter sido a equilibrada pode ser calculada. Para isso pode-se definir  
# A1: 'a moeda retirada é equilibrada', A2: 'a moeda retirada tem duas caras' e A3: 'o resultado final é cara'
# e aplicar a regra de Bayes, resultando em

pa1 = 1/3
pa2 = 2/3
pba1 = 1/2
pba2 = 1
(pa1b = (pa1*pba1)/(pa1*pba1+pa2*pba2))

# Exercício 3.8 Obtenha Pr(A2|B) pela Eq. (3.28) e verfique que  Pr(A2|B) = 1-Pr(A1|B).


### VIDEO 6.3
# Estimação pontual. Estimadores não viesados e de máxima verossimilhança. Média, mediana e moda da distribuição posteriori.

# https://filipezabala.com/eb/inferencia-classica.html#estima%C3%A7%C3%A3o-pontual-1
# https://filipezabala.com/eb/inferencia-bayesiana.html#estima%C3%A7%C3%A3o-pontual

# E(X) = \sum_{x} x.p(x)
# E(aX+bY+c) = aE(X)+bE(Y)+c
# E(\sum_X) = \sum_E(X)
# V(X) = E(X^2) - [E(X)]^2
# V(\sum_X) = \sum_V(X)
# V(aX+b) = a^2.V(X)


### CHECKPOINT 6.1
# As principais escolas de Inferência Estatística são 

# A. Clássica e Bayesiana
# B. Fiduciária e Bayesiana 
# C. Clássica e Fiduciária 
# D. Fundamentalista e Fiduciária 
# E. Aplicada e Fundamentalista 



### VIDEO 6.4
# Estimação por intervalo. Proporção, média, variância e desvio padrão. Intervalos de credibilidade.

# https://filipezabala.com/eb/inferencia-classica.html#intervalo-de-confian%C3%A7a
# https://filipezabala.com/eb/inferencia-bayesiana.html#intervaloregi%C3%A3o-de-credibilidade

n <- 10
m <- 1.63
s <- 0.05                       # 's' amostral
t <- abs(qt(0.025, n-1))        # |-2.2621572|
(e <- t*s/sqrt(n))              # Margem de erro


### VIDEO 6.5
# Como decidir se uma moeda pode ser considerada equilibrada? Intervalos de confiança como regras 
# de decisão sob H0. 

# https://filipezabala.com/eb/inferencia-classica.html#acidc
# https://filipezabala.com/eb/inferencia-classica.html#teste-de-hip%C3%B3teses-1



### CHECKPOINT 6.2

# Considere que na curva normal padrão ( Z ) a probabilidade P(-2 ≤ Z ≤ 2) = 95%. 
# Uma amostra aleatória de tamanho 400 é extraída de uma população normalmente
# distribuída e de tamanho infinito. Dado que a variância desta população é igual 
# a 64, obtém-se, com base na amostra, um intervalo de confiança de 95% para a
# média da população. A amplitude deste intervalo é 
# 
# A. 0,8 
# B. 6,4 
# C. 1,6 V
# D. 12,8 
# E. 3,2


(e <- 2*sqrt(64/400))
2*e

### PARA SABER MAIS
# How To Update Your Beliefs Systematically - Bayes’ Theorem 
# https://youtu.be/R13BD8qKeTg

# Bayes theorem, the geometry of changing beliefs 
# https://youtu.be/HZGCoVF3YvM

# Probability is not Likelihood. Find out why!!!
# https://youtu.be/pYxNSUDSFH4

# Keysers, Gazzola & Wagenmakers (2020) - Using Bayes factor hypothesis testing in neuroscience 
# to establish evidence of absence
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7610527/

# Fienberg (2006) - When Did Bayesian Inference Become "Bayesian"?
# https://projecteuclid.org/journals/bayesian-analysis/volume-1/issue-1/When-did-Bayesian-inference-become-Bayesian/10.1214/06-BA101.pdf 

# Press (2003) - Subjective and Objective Bayesian Statistics: Principles, Models, and Applications, Second Edition
# https://onlinelibrary.wiley.com/doi/book/10.1002/9780470317105

# Seidenfeld (1992) - R. A. Fisher's Fiducial Argument and Bayes' Theorem
# https://www.jstor.org/stable/2246072

# Bayes (1763) - An Essay Towards Solving a Problem in the Doctrine of Chances
# https://www.ias.ac.in/article/fulltext/reso/008/04/0080-0088

