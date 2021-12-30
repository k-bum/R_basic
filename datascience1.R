install.packages("party")
library("party")

getwd() #get working directory
setwd() #set working directory

wine <- read.csv("wine.csv")
View(wine)

#target attribute : wine Type
wine$Type <- as.factor(wine$Type)
wine$Type

set.seed(1234)

SplitIndex <- sample(2, nrow(wine), replace = TRUE, prob = c(0.7, 0.3))
#wine dataset�� 7:3���� �����ش�.
SplitIndex
#1�� ��ü�� 70%, 2�� ��ü�� 30%

train.data <- wine[SplitIndex == 1, ] #70%
test.data <- wine[SplitIndex == 2, ] #30%
train.data
View(test.data)

myf <- Type ~ Alcohol + Ash + Ash_Alcalinity + Flavanoids + Proline
help("~")

wine_ctree <- ctree(myf, data = train.data)
#decision tree�� training data�� �̿��� ����.
table(predict(wine_ctree), train.data$Type)
#���� �� train dataset �� ��
plot(wine_ctree)

testpred <- predict(wine_ctree, newdata = test.data)
table(testpred, test.data$Type)

#precision = TP/(FP + TP) = 40/45
#recall = TP/(TP + FN) = 40/45
#precision for class 1 = 11(TP), 1(FP), 1(FN)
#precision for class 2 = 16(TP), 2(FP), 3(FN)
#precision for class 3 = 13(TP), 2(FP), 1(FN)

#��ü prediction
nrow(test.data)

