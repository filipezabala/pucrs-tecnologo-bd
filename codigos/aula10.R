############################
###         PUCRS        ###
### ESTATÍSTICA APLICADA ###
###        AULA 10       ###
###   FILIPE J. ZABALA   ###
############################

# https://github.com/filipezabala/pucrs-tecnologo-bd

### VIDEO 10.1
# Definições. Objeto 'ts'. Modelo estrutural. Função decompose.

# https://filipezabala.com/ea/analise-de-series-temporais.html
# http://www.stat.yale.edu/~lc436/papers/Harvey_Peters1990.pdf

# série simulada
set.seed(987654321); x <- rnorm(108)
xts <- ts(x, start = c(2010,1), frequency = 12)
plot(xts)

plot(decompose(xts))
plot(decompose(xts, type = 'multiplicative'))
?decompose

# série co2
m <- decompose(co2)
plot(m)


## example taken from Kendall/Stuart
x <- c(-50, 175, 149, 214, 247, 237, 225, 329, 729, 809,
       530, 489, 540, 457, 195, 176, 337, 239, 128, 102, 232, 429, 3,
       98, 43, -141, -77, -13, 125, 361, -45, 184)
x <- ts(x, start = c(1951, 1), end = c(1958, 4), frequency = 4)
m <- decompose(x)
plot(m)



### VIDEO 10.2
# Estacionariedade e diferenciação. Teste Aumentado de Dickey–Fuller.

# https://otexts.com/fpp3/stationarity.html

# Global CH4 Monthly Means, https://gml.noaa.gov/ccgg/trends_ch4/
library(tidyverse)
myData <- read_table('https://gml.noaa.gov/webdata/ccgg/trends/ch4/ch4_mm_gl.txt',
                  skip = 63)

cn <- colnames(myData)[-1]
myData <- myData[,-8]
colnames(myData) <- cn
myData

# convertendo para série temporal
ch4 <- ts(myData$average, start = c(1983,7), frequency = 12)
ch4
class(ch4)

trend <- ts(myData$trend, start = c(1983,7), frequency = 12)
trend
class(trend)

# gráficos
plot(ch4)
lines(trend, col = 'red')
plot(decompose(ch4))

# Teste Aumentado de Dickey–Fuller.
library(tseries)
citation('tseries')
adf.test(ch4)
adf.test(ch4, alternative = 'explosive')

# diferenciação
diff(1:10)


### VIDEO 10.3
#  Autocorrelação e autocorrelação parcial. Método BOx & Jenkins.

# https://otexts.com/fpp3/acf.html

# diferenciação
diff(ch4)
plot(diff(ch4), type='l')
plot(decompose(diff(ch4)))

adf.test(diff(ch4))
adf.test(diff(ch4), alternative = 'explosive')

par(mfrow=c(1,2))
acf(ch4)
pacf(ch4)

fit2 <- arima(ch4, order = c(1,1,0))
summary(fit1)

par(mfrow=c(1,2))
acf(fit1$residuals)
pacf(fit1$residuals)


fit2 <- arima(ch4, order = c(1,1,0), seasonal = list(order = c(1,0,1)))
summary(fit2)
par(mfrow=c(1,2))
acf(fit2$residuals)
pacf(fit2$residuals)


library(forecast)
fit0 <- auto.arima(ch4)
summary(fit0)

### CHECKPOINT 10.1
# Uma série temporal pode ser definida por: 
  
# A. qualquer sequência de tempo. 
# B. qualquer conjunto de observações ordenadas no tempo. v
# C. todas as observações de um universo finito. 
# D. pontos aleatoriamente distribuídos sobre uma média.
# E. Todas estão corretas



### VIDEO 10.4
#  Modelos ARIMA, ETS, TBATS, NNETAR, Prophet. Pacotes forecast e jurimetrics.

# https://otexts.com/fpp3/arima.html
# https://otexts.com/fpp3/ets.html
# https://otexts.com/fpp3/complexseasonality.html
# https://otexts.com/fpp3/nnetar.html
# https://otexts.com/fpp3/prophet.html

library(forecast)
fit.arima <- auto.arima(ch4)
fit.ets <- ets(ch4)
fit.tbats <- tbats(ch4)
fit.nn <- nnetar(ch4)

# https://github.com/filipezabala/jurimetrics
fitj <- jurimetrics::fits(ch4, show.sec.graph = TRUE)
fitj



### VIDEO 10.5
# CRAN Task View: Time Series Analysis. Pacotes por Rob Hyndman.

# https://cran.r-project.org/web/views/TimeSeries.html
# https://robjhyndman.com/software/
# https://archive-beta.ics.uci.edu/


# modelando Global CH4 Monthly Means, https://gml.noaa.gov/ccgg/trends_ch4/
fits(ch4, show.sec.graph = TRUE)



# https://archive.ics.uci.edu/ml/datasets/Hungarian+Chickenpox+Cases
temp <- tempfile()
download.file('https://archive.ics.uci.edu/ml/machine-learning-databases/00580/hungary_chickenpox.zip',
              temp)
myData <- read.csv(unz(temp, 'hungary_chickenpox.csv'))
unlink(temp)
# myData <- read.csv('~/Downloads/hungary_chickenpox/hungary_chickenpox.csv')
myData <- janitor::clean_names(myData)
head(myData)
myData$total <- rowSums(myData[-1])
head(myData)

hc <- lapply(myData[-1], ts, start = c(2005,1,03), end = c(2014,12,29),
             frequency = 52)
length(hc)
par(mfrow=c(3,7))
lapply(hc, plot)


par(mfrow=c(1,1))
plot(hc$total)
ini <- Sys.time()
fit <- jurimetrics::fits(hc$total, show.sec.graph = TRUE)
Sys.time()-ini # Time difference of 12.84305 secs



### CHECKPOINT 10.2
# Sobre os modelos de regressão de séries temporais, é possível afirmar: 
  
# A. Não podem ser estimados em séries estacionárias.
# B. Somente estão definidos para séries com tendência significativa.
# C. Possuem estimação dos parâmetros que depende das regras de negócio.
# D. Possuem diversas classes desenvolvidas, atendendo a uma ampla gama de problemas.
# E. Todas estão corretas.



#### PARA SABER MAIS
# Hyndman & Killick (2022) - CRAN Task View: Time Series Analysis
# https://cran.r-project.org/web/views/TimeSeries.html 

# Hyndman & Athanasopoulos (2021) - Forecasting: Principles and Practice
# https://otexts.com/fpp3/

# Harvey & Peters (1990) - Estimation Procedures for Structural Time Series Models
# http://www.stat.yale.edu/~lc436/papers/Harvey_Peters1990.pdf

# Hyndman's software
# https://robjhyndman.com/software/ 