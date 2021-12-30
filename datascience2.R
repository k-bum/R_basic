install.packages("corrgram")
install.packages("corrgram", dependencies = T, 
                 INSTALL_opts = "--no-lock")
install.packages("Rcpp", dependencies = T, 
                 INSTALL_opts = '--no-lock')
library(corrgram)
install.packages("mclust")
library(mclust)
library("ggplot2")
install.packages("cluster")
library(cluster)

#Clustering Analysis
#1. ��Ŭ����� �Ÿ�
#��Ŭ���� �Ÿ�(Euclidean distance)�� �� �� ������ �Ÿ��� ����ϴ� 
#������� �� �Ÿ��� �̿��Ͽ� ��Ŭ���� ������ �����Ѵ�.

#[�ǽ�] ��Ŭ����� �Ÿ� ����
#�ܰ� 1 : matrix��ü ����
x <- matrix(1:9, nrow = 3, by = T)
x

#�ܰ� 2 : ��Ŭ���� �Ÿ� ������ R�ڵ�
#1��� 2�� ������ ��Ŭ���� �Ÿ� ���ϱ�
sqrt(sum((x[1, ] - x[2, ])^2))
#1��� 3�� ������ ��Ŭ���� �Ÿ� ���ϱ�
sqrt(sum((x[1, ] - x[3, ])^2))
#2��� 3�� ������ ��Ŭ���� �Ÿ� ���ϱ�
sqrt(sum((x[2, ] - x[3, ])^2))

#�ܰ� 3 : ��Ŭ����� �Ÿ� ����
dist <- dist(x, method = "euclidean")
dist

#2. ������ �����м�(Ž���� �м�)

#[�ǽ�] ��Ŭ����� �Ÿ��� �̿��� ����ȭ
#�ܰ� 1 : �����м�(Clustering)�� ���� ��Ű�� ��ġ
install.packages("cluster")
library(cluster)

#�ܰ� 2 : �����ͼ� ����
x <- matrix(1:9, nrow = 3, by = T)
x

#�ܰ� 3 : matrix ��� ��Ŭ���� �Ÿ� ���� �Լ�
dist <- dist(x, method = "euclidean")
#data ���� �Ÿ��� ����Ѵ�. ����� ���ͷ� ��ȯ.
dist

#�ܰ� 4 : ��Ŭ���� �Ÿ� matrix�� �̿��� Ŭ�����͸�
hc <- hclust(dist) #Ŭ�����͸� ����
hc

#�ܰ� 5 : Ŭ������ �ð�ȭ
plot(hc, hang = -1) #1�� 2 ���� ����

##[�ǽ�] ���Ի�� �������� ��� �����м�
interview <- read.csv("interview.csv", header = T)
View(interview)
interview$�հݿ��� <- as.factor(interview$�հݿ���)
names(interview) #attribute Ȯ��

#��Ŭ����� �Ÿ� ���
interview_df <- interview[c(2:7)] #no ����
interview_df
idist <- dist(interview_df, method = "euclidean")
head(idist)
#������ �����м�
hc <- hclust(idist)
hc
#�����м� �ð�ȭ
plot(hc, hang = -1)
#���� ���� �׵θ� ����
rect.hclust(hc, k = 3, border = "red")

##[�ǽ�] ������ Ư¡ ����
#�ܰ� 1 : �� �׷캰 ����� �����
g1 <- subset(interview, no = 108 | no == 110 | no == 107 | no == 112 | no == 115)
g2 <- subset(interview, no = 102 | no == 101 | no == 104 | no == 106 | no == 113)
g3 <- subset(interview, no = 105 | no == 114 | no == 109 | no == 103 | no == 111)
g1
g2
g3
#�ܰ� 2 : �׷� �����跮
View(interview)
table(interview$no)
summary(g1)
summary(g2)
summary(g3)

#3. ������ �ڸ���
#�ܰ� 1 : ��Ŭ����� �Ÿ� ���
interview_df <- interview[c(2:7)] #no ����
interview_df
idist <- dist(interview_df)
#������ �����м�
hc <- hclust(idist)
plot(hc, hang = -1)
rect.hclust(hc, k = 3, border = "red")
#�ܰ� 2 : ������ �ڸ���
ghc <- cutree(hc, k = 3)
ghc
interview$ghc <- ghc
View(interview)
head(interview)
table(interview$ghc)
head(interview, 9)
#�ܰ� 3 : �����跮 ���ϱ�
g1 <- subset(interview, ghc == 1)
summary(g1)
g2 <- subset(interview, ghc == 2)
summary(g2)
g1 <- subset(interview, ghc == 3)
summary(g3)