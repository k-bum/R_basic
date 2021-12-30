
#################################################
## ȸ�ͺм�(Regression Analysis)
#################################################


## �ܼ� ȸ�ͺм�

# �������� : ��ǰ ��������  ��ǰ �������� ��(��)�� ������ ��ģ��.
# ������ : ��ǰ������(��������) -> ��ǰ ������(���Ӻ���)

# �ܼ�����ȸ�� �� ����  
# ����) lm(formula= y ~ x ����, data) # x:����, y ����, data=data.frame

product <- read.csv("product.csv", header=TRUE)
str(product) # 'data.frame':  264 obs. of  3 variables:

y = product$��ǰ_������ # ���Ӻ���
x = product$��ǰ_������ # ��������
df <- data.frame(x, y)
View(df)

# ȸ�͸� ���� 
result.lm <- lm(formula = y ~ x, data=df)
#formula = ���Ӻ��� ~ ��������(��������)

# (1) ȸ�ͺм��� ������ ���� 
result.lm # ȸ�Ͱ�� 

# [�ǽ�] ���� ���հ��� ���� ���� 
names(result.lm)
#residuals = ����(random error)
fitted.values(result.lm)[1:2] #ù��° ~ �ι�° �������� ������ ��
head(df, 2) # x=4, y=3 -> ù��° ����ġ
Y1 = 0.7789 + 0.7393 * 4 # -> �������� ���� ����ġ
Y2 = 0.7789 + 0.7393 * 3
Y1 # 3.7361
Y2 # 2.9968

# ����(����:error) = ����ġ - ����ġ 
3 - 3.7361  # -0.7361
2 - 2.9968  # -0.9968

residuals(result.lm)[1:2]
-0.7359630 + 3.735963

# [�ǽ�] ����ȸ�ͺм� �� �ð�ȭ[���� Ȯ��]
# x,y ������ �׸��� 
plot(formula = y ~ x, data = df)
# ȸ�ͺм�
result.lm <- lm(formula = y ~ x, data = df)
# ȸ�ͼ� 
abline(result.lm, col = 'red')

# [�ǽ�] ����ȸ�ͺм� ��� ����
summary(result.lm)


## 2.3 ���� ȸ�ͺм� 

# - ���� ���� �������� -> ���Ӻ����� ��ġ�� ���� �м�
# �������� : ����� ��ǰ�� ������(x1)�� ģ�е�(x2)�� ��ǰ ������(y)�� ���� ������ ��ģ��.
# ������ : ��ǰ ������(x1), ��ǰ ģ�е�(x2) -> ��ǰ ������(y)

product <- read.csv("product.csv", header=TRUE)

#(1) ������ + ģ�е� -> ������  
y = product$��ǰ_������ # ���Ӻ���
x1 = product$��ǰ_ģ�е� # ��������2
x2 = product$��ǰ_������ # ��������1
df2 <- data.frame(x1, x2, y)
View(df2)

result.lm <- lm(formula = y ~ x1 + x2, data = df2)

# ��� Ȯ�� 
result.lm
# 0.66731(y����)      0.09593(x1)  0.68522(x2)  
summary(result.lm)
#���Ǽ��� : 0 ��***�� 0.001 ��**�� 0.01 ��*�� 0.05 ��.�� 0.1 �� �� 1

# �л���â���� 
install.packages("car") # vif() �Լ� ���� ��Ű�� ��ġ
library(car) # �޸� �ε�

#�ܰ� 2 : �л���â����(VIF)
vif(result.lm) 
vif(result.lm) > 10 # FALSE FALSE 
#vif�� 10 �̻��϶� ���߰������� �ִٰ� �Ǵ�

# [�ǽ�] ����ȸ�ͺм� ��� ����
summary(result.lm)

# ǥ��ȭ ���
# ����� ǥ��ȭ(�� ���������� ������谡 �ٸ� �� �����Ƿ�)
# ǥ��ȭ�� ����� ū �����ϼ��� ������ִ� ���������̴�.
install.packages("lm.beta")
library("lm.beta")
lm.beta(result.lm)

## 2.4 ���߰����� ���� �ذ�� �� ������

# [�ǽ�] ���߰����� ���� Ȯ��

# (1) ��Ű�� ��ġ �� ������ �ε� 
data(iris)
View(iris)

# (2) iris ������ ������ ����ȸ�ͺм� (Sepal �ɹ�ħ, Petal ����)
fit <- lm(formula = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris)
#3���� ��������(�ɹ�ħ�� ����, �ɹ�ħ�� �ʺ�, ������ ����)
vif(fit)
vif(fit)>10 # VIF�� 10 �̻��� ���� ���߰����� ���� �ǽ� 
#���߰������� �ǽɵǸ� �ش� ������ �����ص� �����ϴٰ� �Ǵ�

# (3) iris ���� ���� ������ ���ϱ�
cor(iris[,-5]) # �������� ������ ����(Species ����) 
# ���� �� ������谡 ������ Ȯ��
# x������ �� ������� ���� ���� �ִ�. -> �ش� ���� ����(���� ����) <- Petal.Length

# [�ǽ�] ������ �� ������ ȸ�͸� ����

# (2) ���� ���� �� ����ȸ�ͺм� - Petal.Length ������ ������ �� ȸ�ͺм� 
# petal.length�� vif�� ���� ũ�� ������ ����
# - �н������� �̿� �� ���� 
model <- lm(formula = Sepal.Length ~ Sepal.Width + Petal.Width, data = iris)

# (3) ȸ�͹����� ���� 
model 
vif(model)
#vif���� �پ������Ƿ� ���߰����� ���� �ذ�
summary(model)

# ù ��° ����ġ ����
head(iris, 1)

Y = 3.4573 + 0.3391 * 3.5 + 0.9721 * 0.2 # <- ù��° ����ġ
Y

# ����(����:error) = ����ġ - ����ġ 
5.1 - 4.83857 # 0.26143

# (4) ����ġ ���� - predict()�Լ�
# - ȸ�ͺм� ����� ������� ȸ�͹������� ������ ���ο� �� ����(Y��)
pred <- predict(model, iris)# x������ data set���� ã�Ƽ� �� ����
pred # iris ������ ���� y ����ġ(ȸ�͹����� ����) 
iris$Sepal.Length # test ������ ���� y ����ġ  
length(pred) 

# (5) ȸ�͸� �� 
cor(pred, iris$Sepal.Length)
summary(pred); summary(iris$Sepal.Length)


##  2.5 �⺻���� �������� ȸ�ͺм� ����

# [�ǽ�] �⺻���� �������� ȸ�ͺм� ���� 

# 1. ȸ�͸� ���� 
# (1) ���� �𵨸� : y:Sepal.Length <- x:Sepal.Width,Petal.Length,Petal.Width
formula = Sepal.Length ~ Sepal.Width + Petal.Width

# (2) ȸ�͸� ���� 
model <- lm(formula = formula,  data = iris)
model

# 2. ����[����] �м�

# (1) �������� ��л꼺 ����  
install.packages('lmtest')
library(lmtest) # �ڱ��� ���� ��Ű�� ��ġ 
dwtest(model) # ���� �ӽ� ��(��� 1~3 ����)

# ��л꼺 ���� 
plot(model, which =  1) 
methods('plot') # plot()���� �����Ǵ� ��ü ���� 

# 1. A plot of residuals against fitted values
# 2. A normal Q-Q plot
# 3. A Scale-Location plot of sqrt(| residuals |) against fitted values


# (2) ���� ���Լ� ����
attributes(model) # coefficients(���), residuals(����), fitted.values(���հ�)
res <- residuals(model) # ���� ���� 
shapiro.test(res) # ���Լ� ���� - p-value = 0.9349 >= 0.05
# �͹����� : ���Լ��� ���̰� ����.

# ���Լ� �ð�ȭ  
hist(res, freq = F) 
qqnorm(res)


# 3. ���߰����� �˻� 
library(car)
vif(model)
vif(model) > 10 # TRUE 

# 4. ȸ�͸� ����/�� 
formula = Sepal.Length ~ Sepal.Width + Petal.Width 
model <- lm(formula = formula,  data=iris)
summary(model) # �� ��

# predicted residual error sum of squares (PRESS) 