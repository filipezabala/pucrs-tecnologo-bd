url0 <- 'https://raw.githubusercontent.com/filipezabala/pucrs-tecnologo-bd/main/dados/Anexo_Projeto_fifa_world_national_teams_versa%CC%83o_oficial%2020241.csv'
fifa <- read.csv(url0, sep = ';')
str(fifa)
head(fifa)
