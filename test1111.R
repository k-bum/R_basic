TS <- read.csv("example_ts.csv")
View(TS)
str(TS)

library("ggplot2")
library("ggthemes")

ggplot(TS, aes(x = Date, y = Sales)) + geom_line()
ggplot(TS, aes(x = factor(Date), y = Sales, group = 1)) + geom_line() +
  geom_point()
#factor()�� character���� factor�� �ٲ���
ggplot(TS, aes(x = factor(Date), y = Sales, group = 1)) + geom_line() + 
  geom_point()
ggplot(TS, aes(x = factor(Date), y = Sales, group = 1)) + geom_line() +
  geom_point() + theme_light()
ggplot(TS, aes(x = factor(Date), y = Sales, group = 1)) + geom_line(colour = "orange1", size = 1) + 
  geom_point(colour = "orangered2", size = 4) + theme_light()
ggplot(TS, aes(x = factor(Date), y = Sales, group = 1)) + geom_line(colour = "orange1", size = 3) +
  geom_point(colour = "orangered2", size = 5) +
  xlab("�⵵") + ylab("����") + ggtitle("�����ֽ�ȸ�� �� �� ����") + 
  theme_light()
   
library("dplyr")
DF <- read.csv("example_population_f.csv")
str(DF)
dim(DF)
View(DF)

DF <- DF[, -1] #ù ��° ���� �����ϰ� �ٽ� ����
str(DF)
DF
DF <- tibble::as_tibble(DF)
DF
DF2 <- filter(DF, Provinces == "��û�ϵ�" | Provinces == "��û����")
Graph <- ggplot(DF2, aes(x = City, y = Population, fill = Provinces)) + 
  geom_bar(stat = "identity")
Graph
GraphRecorder <- ggplot(DF2, aes(x = reorder(City, Population), y = Population,
                                 fill = Provinces)) +
  geom_bar(stat = "identity") + theme_wsj()
# reorder(city, population)�� ���ð� ������ population�� ���� ������ ����
GraphRecorder
DF3 <- filter(DF, SexRatio > 1, PersInHou < 2)
View(DF3)
Graph <- ggplot(DF3, aes(x = City, y = SexRatio, fill = Provinces)) +
  geom_bar(stat = "identity") + theme_wsj()
Graph

DF <- read.csv("example_population_f.csv")
View(DF)
str(DF)
DF <- DF[, -1]
View(DF)
DF <- mutate(DF, SexF = ifelse(SexRatio < 1, "���� ������ ����", 
                               ifelse(SexRatio > 1, "���� ������ ����", "���� ������ ����")))
DF$SexF <- factor(DF$SexF)
DF$SexF
View(DF)
DF2 <- filter(DF, Provinces == "��⵵")
Graph <- ggplot(DF2, aes(x = City, y = (SexRatio -1), fill = SexF)) +
  geom_bar(stat = "identity", position = "identity") + theme_wsj()
Graph
DF3 <- filter(DF, Provinces == "����Ư����")
Graph2 <- ggplot(DF3, aes(x = City, y = (SexRatio -1), fill = SexF)) +
  geom_bar(stat = "identity", position = "identity") + theme_wsj()
Graph2

ggplot(data = diamonds) + geom_bar(aes(x = cut))
ggplot(data = diamonds) + geom_bar(aes(x = cut), width = 0.5)
ggplot(data = diamonds) + geom_bar(aes(x = cut)) + coord_flip()
ggplot(data = diamonds) + geom_bar(aes(x = cut), colour = "red", fill = "#ffff00")
ggplot(data = diamonds) + geom_bar(aes(x = cut), colour = "red")
ggplot(data = diamonds) + geom_bar(aes(x = cut, fill = cut), color = "red")
g <- ggplot(data = diamonds)
g + geom_bar(aes(x = cut, color = cut), fill = "white")
g + geom_bar(aes(x = cut), linetype = "dashed", colour = "red", fill = "white")
g + geom_bar(aes(x = cut, fill = clarity))
g + geom_bar(aes(x = cut, fill = clarity), position = "fill")
g + geom_bar(aes(x = cut, fill = clarity), position = "dodge")
g + geom_bar(aes(x = cut, fill = clarity)) + theme_bw()
g + geom_bar(aes(x = cut, fill = clarity), position = "dodge") +
  theme(legend.position = "top")
g + geom_bar(aes(x = cut, fill = clarity), position = "dodge") +
  theme(legend.position = c(0.12, 0.72))

#melt�Լ��� �̿��� ������ ����
#melt�Լ��� ������ ������ ������ �������
library(dplyr)
library(ggplot2)
library(ggthemes)
install.packages("reshape2")
library(reshape2)
DF <- read.csv("example_population_f.csv")
DF <- DF[, -1]
DF <- tbl_df(DF)
DF
group <- group_by(DF, Provinces)
DF2 <- summarise(group, SumPopulation = sum(Population), Male = sum(Male),
                 Female = sum(Female))
View(DF2)
DF2
DF3 <- melt(DF2, id.vars = c("Provinces", "SumPopulation"), measure.vars = c("Male", "Female"))
#provinces�� sumpopulation�� �������� male�� female�� ���� ���
DF2
DF3
colnames(DF3)[3] <- "Sex"
colnames(DF3)[4] <- "Population"
DF3
DF4 <- mutate(DF3, Ratio = Population/SumPopulation)
DF4$Ratio
DF4$Ratio <- round(DF4$Ratio, 3)
#�Ҽ��� 3�ڸ����� �ݿø�
DF4
ggplot(DF4, aes(x = Provinces, y = Ratio, fill = Sex)) +
  geom_bar(stat = "identity") +
  coord_cartesian(ylim = c(0.45, 0.55)) + theme_wsj()

DF <- read.csv("example_population_f.csv")
DF <- DF[, -1]
DF <- tbl_df(DF)
DF2 <- mutate(DF, SexF = ifelse(SexRatio > 1, "���� ���� ����", 
                                ifelse(SexRatio == 1, "���� ���� ����", "���� ���� ����")))
DF3 <- filter(DF2, Provinces == "��⵵")
graph <- ggplot(DF3, aes(x = (SexRatio - 1), y = reorder(City, SexRatio))) +
  geom_segment(aes(yend = City), xend = 0, colour = "grey50") + 
  geom_point(size = 2, aes(colour = SexF)) + theme_minimal()
graph