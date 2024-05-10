# Regressão Logística - Case Titanic

Dados: <https://www.kaggle.com/c/titanic/data>

Estudo de caso de chance de sobrevivência no nafrágio do novio Titanic. O naufrágio do Titanic é um dos acidentes mais trágicos da história. Em 15 de abril de 1912, em sua viagem inaugural, o Titanic afundou depois de colidir com um iceberg, matando 1502 de 2224 passageiros e tripulantes <https://pt.wikipedia.org/wiki/Naufr%C3%A1gio_do_RMS_Titanic>.

Para este estudo foi utilizado a ferramenta R Stúdio e a  técnica estatística *Regressão Logística*.

Regressão logística é uma técnica estatística utilizada para modelar a relação entre uma variável dependente categórica e uma ou mais variáveis independentes, que podem ser categóricas ou contínuas. Ela é frequentemente usada em problemas de classificação, onde o objetivo é prever a probabilidade de uma observação pertencer a uma determinada categoria.


Análise de sobrevivência entre os sexos masculino e feminino, quando é rodado o modelo, encontramos a *odds* de 0.08391088. Significa que, a chance de sobrevivência passando do sexo feminino para o masculina cai ~ -92%.

Ao passar do masculina para o feminino a razão de 1/odds, a chance de sobrevivência aumenta em 12 vezes.

Analisando as classes categóricas (a, b e c), um novo modelo nos trás um beta 1 de -0.726, ou seja, indica que quanto maior a classe menor a chance de sobrevivência.

Quando olhamos a idade, obtemos o beta 1 de -0.01096, está negativo, quanto maior a idade menor a chance de sobrevivência.

O algoritimo está disponível juntamente com a base utilizada com mais análise de dados.
