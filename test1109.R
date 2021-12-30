#ggplot2 ��Ű�� �׷����� ����
#ggplot()
#geom() : �׷����� ���¸� ����
#theme() : �׷����� �������� ����

##ggplot2�� �̿��� �ð�ȭ
#ggplot ����� �����͸� x��, y��, color���� �׷��� ��ҿ� ����
#aes() �Լ� ���
#geom() �پ��� �׷��� �� � �׷����� �׸��� ����
install.packages("ggthemes")
library("ggplot2")
library("ggthemes")
DF <- read.csv("example_studentlist.csv")
DF
g1 <- ggplot(DF, aes(x = height, y = weight, colour = bloodtype))
#DF�� �̿��� x�࿡�� Ű, y�࿡�� ������, �������� ���� �ٸ� �� ����
g1 + geom_point() #������
g1 + geom_line() #������ �׷���
g1 + geom_line() + geom_point() 
g1 + geom_line(size = 5) + geom_point(size = 10) #������ ���� ����

#�� �׷���
ggplot(DF, aes(x = bloodtype)) + geom_bar()
ggplot(DF, aes(x = bloodtype, fill = sex)) + geom_bar()
#������ ���� �ٸ� �� ����
ggplot(DF, aes(x = bloodtype, fill = sex)) + geom_bar(position = "dodge")
ggplot(DF, aes(x = bloodtype, fill = sex)) + geom_bar(position = "dodge", width = 0.3)
#�׷����� ���� ���� ����

heightByblo <- tapply(DF$height, DF$bloodtype, mean)
#������ �������� �з��ϰ� Ű�� ��հ��� ����
heightByblo
DF2 <- as.data.frame(heightByblo)
DF2
rownames(DF2)
DF2$bloodtype <- rownames(DF2)
#DF2�� bloodtype�̶�� ������ ����� DF2�� rowname�� ������.
DF2$bloodtype
DF2
rownames(DF2) <- NULL #DF2�� rowname �ʱ�ȭ
DF2
ggplot(DF2, aes(x = bloodtype, y = heightByblo, fill = bloodtype)) +
  geom_bar(stat = "identity") + scale_fill_brewer()
ggplot(DF2, aes(x = bloodtype, y = heightByblo, fill = bloodtype)) +
  geom_bar(stat = "identity") + scale_fill_manual(values = c("#FFFFFF", "#FFCC00", "#FF6600", "#FF3300"))
#scale_fill_manual�� ���ؼ� ����ڰ� ���� ������ ���� ����

#������ �׸���
DF <- read.csv("example_studentlist.csv")
DF
g1 <- ggplot(DF, aes(x = weight, y = height))
g1 + geom_point()
g1 + geom_point(aes(colour = sex), size = 7)
g1 + geom_point(aes(colour = sex, shape = sex), size = 7)
g1 + geom_point(aes(colour = sex, shape = bloodtype), size = 7)
#����� ������ �����ϰ� ������� �������� �����Ѵ�. size�� 7

#������׷�
library("dplyr")
ggplot(data = diamonds)
ggplot(data = diamonds) + geom_histogram(aes(x = carat))
ggplot(data = diamonds, aes(x = carat)) + geom_histogram()
ggplot(data = diamonds) + geom_density(aes(x = carat), fill = "grey50")
ggplot(data = diamonds) + geom_density(aes(x = carat), fill = "blue")

ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point()
ggplot(data = diamonds) + geom_point(aes(x = carat, y = price))

g1 <- ggplot(data = diamonds, aes(x = carat, y = price))
g2 <- geom_point(aes(colour = color))
#���� color�� �ɼ��� �̸��̰�, ���� color�� diamonds dataset�� ���� �̸�
g1 + g2

g3 <- ggplot(data = diamonds)
g4 <- geom_point(aes(x = carat, y = price, color = color))
g3 + g4

ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_point() + geom_violin()
ggplot(diamonds, aes(y = carat, x = 1)) + geom_violin() + geom_point()

#������ �׷���
economics
View(economics) #�ð迭 �ڷ�
names(economics)
ggplot(economics, aes(x = date, y = pop)) + geom_line()

install.packages("lubridate")
library("lubridate")
economics$year <- year(economics$date)
economics$month <- month(economics$date, label = TRUE)
View(economics)
names(economics)

econ2000 <- economics[which(economics$year >= 2000),]
View(econ2000)
library("scales")

g1 <- ggplot(econ2000, aes(x = month, y = pop))
g2 <- geom_line(aes(color = factor(year), group = year))
g1 + g2
g3 <- scale_color_discrete(name = "Year")
g1 + g2 + g3
g4 <- scale_y_continuous(labels = scales::comma)
g = g1 + g2 + g3 + g4
g
g + labs(title = "Population Growth", x = "Month", y = "Population")

#theme �׷��� ��ü�� ������ ������ �ִ� ���
library(ggthemes)
g <- ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point(aes(color = color))
g
g + theme_economist() + scale_color_economist()
g + theme_excel() + scale_color_excel()
g + theme_tufte()
g + theme_wsj()


