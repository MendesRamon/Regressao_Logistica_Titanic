#####################  REGRESSÃO LOGÍSTICA ###################################################################################################################

##############################################################################################################################################################
#####################  Regressão  logística  Simples #########################################################################################################
##############################################################################################################################################################

#####################  Case Titanic ##########################################################################################################################
#
#setando diretório
setwd("C:/Users/Lenovo/Desktop/R/3 - MODELOS ESTATÍSTICOS/BASE")
#verificando o caminho do diretório
getwd()
#carregando o arquivo
Dados <- read.csv2("Dados Titanic.csv")

#MODELO 1: Análise de sobrevivência entre os sexos masculino e feminino
modelo1<-glm(Dados$Sobrevivente~Dados$Sexo, family=binomial(link = "logit"));modelo1
summary(modelo1)
#odds é o valor exponencial do b0
odds <- exp(-2.478)
odds
#interpretação da odds:
#a chance de sobrevivência do sexo feminino para o masculina cai ~92%
odds - 1

#quando passa do masculino para o feminino as chances de sobrevivência aumenta
#~12 vezes
1/odds

#MODELO 2: Análise de idade
modelo2 <- glm(Dados$Sobrevivente~Dados$Idade, family = binomial(link="logit"));modelo2
#o beta 1 está negativo, quanto maior a idade menor a chance de sobrevivência

#odds da razão de chance
exp(-0.01096)

#MODELO 3: Análise das classes (qualitativas)
modelo3 <- glm(Dados$Sobrevivente~Dados$Classe, family=binomial(link="logit"));modelo3
#classe dos valores classe
class(Dados$Classe)
#o beta 1 indica que quanto maior a classe menor a chance de sobrevivência,
#neste caso a classe é ordinal(a, b, c...) então quanto mais próximo da classe c


#criando uma coluna Classe como categórico
Dados$Classecat <- as.factor(Dados$Classe) #fator classe categorico

#analisando como classes categóricas
modelo3 <- glm(Dados$Sobrevivente~Dados$Classecat, family=binomial(link="logit"));modelo3

#cria-se um coeficiente para cada classe

 
#classe B
exp(-0.7261)- 1 
#a medida que passa da classe A para B a chance de sobrevivência -52% (diminui)

#classe C
exp(-1.8009) - 1
#a medida que passa da classe B para C a chance de sobrevivência -83% (diminui)


##############################################################################################################################################################
#####################  Regressão logística  Multipla #########################################################################################################
##############################################################################################################################################################


#Modelo 4:
modelo4 <- glm(Dados$Sobrevivente~Dados$Sexo + Dados$Idade + Dados$Irmãos + Dados$Pais + Dados$Classecat, family = binomial(link="logit"));modelo4
summary(modelo4)
#categoria pais não se mostrou significativa

modelo5 <- glm(Dados$Sobrevivente~Dados$Sexo + Dados$Idade + Dados$Irmãos + Dados$Classecat, family = binomial(link="logit"));modelo5
summary(modelo5)


#calculando a probabilidade de uma pessoa do sexo feminino com idade de 10 anos
#que viajou sozinha (sem irmão) na primeira classe
#exp(intercepto - variavel idade *idade)/(1+exp((intercepto - variavel idade *idade)))
ProbY <- exp(4.334201-0.044760*10)/(1-exp(4.334201-0.044760*10))
ProbY 

#a probabilidade minha de sobreviver se tivesse viajado com um irmão na classe C
ProbY <- exp(4.334201-2.627679-0.044760*32-0.380190-2.652618)/(1-exp(4.334201-2.627679-0.044760*32-0.380190-2.652618))
ProbY