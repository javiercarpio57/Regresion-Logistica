#library(e1071)
#install.packages("dummy)
library(caret)
library(dummy)
#Modelo de Regresi�n log�stica
porcentaje<-0.7
datos<-iris
set.seed(123)

datos<-cbind(datos,dummy(datos,verbose = T))

corte <- sample(nrow(datos),nrow(datos)*porcentaje)
train<-datos[corte,]
test<-datos[-corte,]


#Queremos saber si una planta es virginica o no
modelo<-glm(Species_virginica~., data = train[,c(1:4,8)],family = binomial(), maxit=100)

#-------------------------------------------------
# Regresi�n Logistica 
#-------------------------------------------------

##Modelo con todas las variables
pred<-predict(modelo,newdata = test[,1:4], type = "response")
prediccion<-ifelse(pred>=0.5,1,0)
confusionMatrix(as.factor(test$Species_virginica),as.factor(prediccion))

# Confusion Matrix and Statistics
# 
# Reference
# Prediction  0  1
# 0 27  2
# 1  1 15
# 
# Accuracy : 0.9333         
# 95% CI : (0.8173, 0.986)
# No Information Rate : 0.6222         
# P-Value [Acc > NIR] : 1.906e-06      
# 
# Kappa : 0.8565         
# Mcnemar's Test P-Value : 1              
# 
# Sensitivity : 0.9643         
# Specificity : 0.8824         
# Pos Pred Value : 0.9310         
# Neg Pred Value : 0.9375         
# Prevalence : 0.6222         
# Detection Rate : 0.6000         
# Detection Prevalence : 0.6444         
# Balanced Accuracy : 0.9233         
# 
# 'Positive' Class : 0  