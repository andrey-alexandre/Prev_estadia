library(dplyr)
library(stringr)
library(ggplot2)
library(caret)

lista_c <- read.csv(file = 'C:/Google Drive/Provas/cognitivo.ai/Dados/listings.csv', encoding = 'UTF-8', stringsAsFactors = F)
lista_c %>% str

lista <- lista_c %>% 
  mutate(price = price %>% str_remove_all(pattern = '\\$|,|\\.00') %>% as.numeric) %>% 
  mutate_if(.predicate = is.numeric, .funs = function(x){ifelse(is.na(x), mean(x, na.rm = T), x)}) %>% 
  filter(price !=0) %>% 
  .[-c(32908, 21639, 6226, 2109),]

ggplot(data = lista, mapping = aes(x = price)) +
  geom_density()

ggplot(data = lista, mapping = aes(y = lprice, group = property_type)) +
  geom_boxplot()

fit1 <- glm(formula = price ~ room_type + accommodates + bathrooms + bedrooms + beds + 
              minimum_nights + number_of_reviews + review_scores_rating ,
            family  = Gamma(link = "log"),
            data    = lista)

summary(fit1)
plot(fit1)
e1 <- lista$price - fitted(fit1)
mean(e1^2)^.5

fit2 <- train(price ~ room_type + accommodates + bathrooms + bedrooms + beds + 
                minimum_nights + number_of_reviews + review_scores_rating,
              data = lista, 
              method = 'xgbTree',
              tuneLength = 9, trControl = trainControl(search = 'random'))
e2 <- lista$price - fitted(fit2)
mean(e2^2)^.5

fit3 <- mboost::glmboost(x = model.matrix(price ~ room_type + accommodates + bathrooms + bedrooms + beds + 
                                            minimum_nights + number_of_reviews + review_scores_rating, data = lista),
                         y = lista$price,
            family  = mboost::Gaussian())
e3 <- lista$price - fitted(fit3)
mean(e3^2)^.5
median(abs(e3))
