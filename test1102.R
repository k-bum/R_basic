install.packages("data.table")
library(data.table)
DF = fread("example_studentlist.csv", data.table = F)
#csv������ �д� �Լ� : fread()
DF
dim(DF)
names(DF)
mean(DF$height, na.rm = T)
#DF�� height������ ����� ���Ѵ�.
sort(DF$height)
#DF$height�� ������������ �����ؼ� ����Ѵ�. 
median(DF$height, na.rm = T)
#�߾Ӱ�
range(DF$height, na.rm = T) 
#���� ū ���� ���� ���� ���� �����ش�. (������ ����)
quantile(DF$height, na.rm = T) #�������
IQR(DF$height, na.rm = T) 
#25%�� �ش��ϴ� ���� 75%�� �ش��ϴ� ���� ��
# 176.1 - 165.3 = 10.8
summary(DF$height, na.rm = T)
#�����跮 ���
boxplot(DF$height)
#�������� �׸����� �����ش�. 
cor(DF$height, DF$weight) #���л�(��ȣ���谡 �󸶳� ��������)
#�Ϲ������� 0.7�̻��� �� ������谡 �ִٰ� �ؼ�
#����� ��쿡 ���� �������, ������ ��쿡 ���� �������

DF2 = DF
DF2[2, 7] = NA
DF2[4, 8] = NA
DF2
cor(DF2$height, DF2$weight)
cor(DF2$height, DF2$weight, use = "complete.obs")
#use = "complete.obs" NA�� ó��
var(DF2$height, na.rm = T) #�л�
sd(DF2$height, na.rm = T) #ǥ������

DF <- read.csv("example_salary.csv", stringsAsFactors = T, na = "-")
DF
dim(DF)
names(DF)
head(DF, 5)

colnames(DF)
colnames(DF) <- c("Age", "Salary", "SpecialSalary", "WorkingTime",
                  "NumberOfWorker", "Career", "Sex")
names(DF)
str(DF)
Mean <- mean(DF$Salary, na.rm = T)
Mean
Mid <- median(DF$Salary, na.rm = T)
Mid
Range <- range(DF$Salary, na.rm = T)
#���� ū ���� ���� ���� ���
Range
w <- which(DF$Salary == 4064286)
#salary�� 4064286�� ���� �������� �� ��ȣ�� �����Ѵ�.
w
DF[w,] #w���� ��� ������ ���
w <- which(DF$Salary <= 4064286)
w
DF[w,]
library("dplyr")
DF %>% filter(DF$Salary == 4064286)
Qnt <- quantile(DF$Salary, na.rm = T)
Qnt
Salary <- list(��տ��� = Mean, �߾Ӱ����� = Mid, ���޹��� = Range,
                ���޻���� = Qnt)
Salary

DF <- read.csv("example_salary.csv", stringsAsFactors = F, na = "-")
head(DF, 5)
colnames(DF)
colnames(DF) <- c("age", "salary", "specialsalary", "workingTime",
                  "numberOfWorker", "career", "sex")
temp <- tapply(DF$salary, DF$sex, mean, na.rm = T)
#sex�� �������� salary�� mean�� ���Ѵ�.
temp

install.packages("reshape2")
library("reshape2")
library("ggplot2")
melt <- melt(temp)
melt
colnames(melt) <- c("Sex", "Salary")
melt
ggplot(melt, aes(x = Sex, y = Salary, fill = Sex)) + 
         geom_bar(stat = "identity") #����׷����� �����ش�.

tapply(DF$salary, DF$sex, sd, na.rm = T)
#sex�� �������� salary�� ǥ�������� ���Ѵ�.
tapply(DF$salary, DF$sex, range, na.rm = T)
#sex�� �������� salary�� �ִ񰪰� �ּڰ��� ���Ѵ�.
temp2 <- tapply(DF$salary, DF$career, mean, na.rm = T)
temp2
melt2 <- melt(temp2)
melt2
colnames(melt2) <- c("Career", "Salary")
melt2
ggplot(melt2, aes(x = Career, y = Salary, group = 1)) + 
         geom_line(colour = "skyblue2", size = 4) + 
         coord_polar() + ylim(0, max(melt2$Salary))
#size�� ���� ���⸦ ����

tapply(DF$salary, DF$career, sd, na.rm = T)
tapply(DF$salary, DF$career, range, na.rm = T)

#salary�� ������ �����ϴ� ��� ���� w�� ����
w <- which(DF$salary > 3000000)
w
DF[w, ] #�������������� �ݵ�� ��� ���� ��� �Է��ؾ��Ѵ�.
#salary�� ������ �����ϴ� ���� ��� ������ list�� ����
a1 <- DF[which(DF$salary == 1172399), ]
a1
a2 <- DF[which(DF$salary == 1685204), ]
a2
a3 <- DF[which(DF$salary == 1117605), ]
a3
a4 <- DF[which(DF$salary == 1245540), ]
a4
a5 <- DF[which(DF$salary == 1548036), ]
a5
list <- list(a1, a2, a3, a4, a5)
list

#outlier ã��� �����ϱ� 
DF <- read.csv("example_cancer.csv", stringsAsFactors = F, na = "��Ͼ���")
View(DF)
mean(DF$age)
summary(DF$age)
boxplot(DF$age)
grid() #��Ʈ�� ���ڹ��̸� ǥ��
quantile(DF$age) #72 - 55 = 17
distIQR <- IQR(DF$age, na.rm = T) #��������� ����
distIQR
#�̻�ġ ó��
posIQR <- quantile(DF$age, probs = c(0.25, 0.75), na.rm = T)
#���� 25% ���� ���� 75% ���� 1������� 3������� ����� ����
posIQR
DownWhisker <- posIQR[[1]] - distIQR*1.5
#���� ����������� ����� ������ 1.5�踦 �� ��
UpWhisker <- posIQR[[2]] + distIQR*1.5
#���� ��������� ����� ������ 1.5�踦 ���� ��
DownWhisker; UpWhisker
outlier <- subset(DF, subset = (DF$age < DownWhisker | DF$age > UpWhisker))
#DowbWhiskter���� �۰ų� UpWhisker���� ū ���� �̻�ġ�� ����
outlier
dim(outlier)