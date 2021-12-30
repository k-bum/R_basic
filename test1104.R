#������ plot
Nile #�ð迭 ������
str(Nile)
plot(Nile, main = "Flow Changes in the Nile", xlab = "year", ylab = "Flow")
#main�� ��ü �׷����� Ÿ��Ʋ, xlab�� x(��������)���� �̸�, y(��������)���� �̸��� ��Ÿ��.
plot(Nile, type = "p", main = "Flow Changes in the Nile", xlab = "year", ylab = "Flow")


DF <- read.csv("example_studentlist.csv")
View(DF)
names(DF)
str(DF)
DF
DF$age
plot(DF$age)
plot(DF$height, DF$weight) #ù��° ���ڴ� x�� �ι�° ���ڴ� y��
plot(DF$weight ~ DF$height) # ~���� y�� �ڰ� x��
DF$sex <- as.factor(DF$sex) 
#plot�Լ��� ������ �ݵ�� ��ġ���̰ų� �������̹Ƿ� ������ ���� �ʴ� ���
#as.factor�� �̿��ؼ� ��ȯ�� �� ����Ѵ�. 
plot(DF$height, DF$sex)
DF2 <- data.frame(DF$height, DF$weight)
DF2
plot(DF2)
DF3 <- cbind(DF2, DF$age)
#DF$age�� cbind�� �̿��Ͽ� ��ģ��. 
DF3
plot(DF3) #plot�Լ��� 3���� ������ ���ڷ� ����ص� ���� ���� ���踦 ��� ������.

DF$sex
DF$sex <- ifelse(DF$sex == "����", 1, 2)
DF$sex
plot(DF$weight ~ DF$height, pch = as.integer(DF$sex))
legend("topleft", c("man", "woman"), pch = DF$sex) #���ʸ� ���̴� ���� ������.

plot(DF$weight ~ DF$height, ann = F)
title(main = "Kyung Hee University Student's Height and Weight Relationship")
title(xlab = "height")
title(ylab = "weight")
grid()

weightMean = mean(DF$height)
weightMean
FreqBlood = table(DF$bloodtype)
FreqBlood
barplot(FreqBlood)
title(main = "Blood type frequency")
title(xlab = "blood type")
title(ylab = "frequency")
Height = tapply(DF$height, DF$bloodtype, mean)
#������ ���� Ű�� ����� ���ؼ� ��Ÿ��.
Height
barplot(Height, ylim = c(0, 200)) #ylim�� y���� limit�� ��Ÿ��.

boxplot(DF$height)
boxplot(DF$height ~ DF$bloodtype) #������ ���� Ű�� boxplot�� ���.

hist(DF$height)
hist(DF$height, breaks = 5) #breaks�� ������ ��Ÿ��.
hist(DF$height, breaks = 10)
hist(DF$height, breaks = 10, prob = T)
hist(DF$height, breaks = 20)
hist(DF$height, breaks = 10, prob = T) #�е��� ��Ÿ����(prob = T)
DiffPoint <- c(min(DF$height), 165, 170, 180, 185, 190)
#������ ���� �����ؼ� ���ͷ� �����ϰ� ������׷��� �׸���. 
hist(DF$height, breaks = DiffPoint)

x1 <- seq(1, 100, 1) #1���� 100���� 1�������� ���ڸ� ����
x1
y1 <- dbinom(x1, 100, 0.25) #���׺���
y1
#Ÿ�Կ� ���� �޶�����.
plot(x1, y1, type = "p") #point
plot(x1, y1, type = "l") #line
plot(x1, y1, type = "h") #histogram
plot(x1, y1, type = "s")



