# Previsão do preço da estadia

Projeto criado no intuito de modelar os preços de estadia do Airbnb no estado do Rio de Janeiro.

## Como foi a definição da sua estratégia de modelagem?
Inicialmente foram feitas análises descritivas para entender o comportamento da variável resposta (Preço) individualmente e com algumas variáveis que foram entendidas como de alguma relevância. Com estas análises, foi percebido que há a presença de valores outliers massivos, uma vez que 90% dos valores se encontram até R$1250,00 e um valor máximo de R$41592,00. 
A partir desta observação, sabemos que métodos lineares usuais não serão utéis, uma vez que estes são fortemente influênciados pela presença de outliers. Desta forma o foco da abordagem se fez em métodos de kernel, árvores de decisão e perceptrons de múltiplas camadas a fim de verificar qual modelo seria mais útil.

## Como foi definida a função de custo utilizada?
A função de custo que foi utilizada foi definida a partir de uma validação cruzada de 5 pastas, onde foi escolhido a função Kernel Sigmoidal.

## Qual foi o critério utilizado na seleção do modelo final?
O critério utilizado foi o MAE, mediana do erro absoluto, e a distância interquartilica tendo em vista que temos uma distribuição com presença de valores altamente aberrantes. 
Desta forma podemos verificar qual modelo, em tese, apresenta melhor capacidade de se adequar aos mais comuns, que representam 90% da amostra, já que não haverá, ou haverá pouca punição pelo não aprendizado dos valores extremos.

## Qual foi o critério utilizado para validação do modelo? Por que escolheu utilizar este método?
Para validação do modelo foi verificado o MSE do mesmo com a técnica de validação cruzada de 5 pastas (5-folds cross validation). 
Este método foi utilizado no intuito de ter um melhor entendimento da capacidade preditiva do modelo, uma vez que podemos verificar em cinco conjuntos distintos de dados o quão bem ele foi capaz de entender a estrutura de dados e a generalizar.
Ao contrário da seleção do modelo final, nesta etapa foi utilizada uma métrica de validação do modelo que pune valores extremos, uma vez que agora, com um modelo que aprende o contexto geral dos dados, deseja-se otimizar o aprendizado também dos valores extremos.

## Quais evidências você possui de que seu modelo é suficientemente bom?
Duas evidências podem ser consideradas como primordiais para a aceitação do modelo de vetores de suporte como suficientemente bom. 
A primeira é o fato de ter obtido o menor MAE frente a outros modelos considerados, assim como ele, estado da arte. A segunda é a consistência do MSE, avaliada com a técnica cross validation.
