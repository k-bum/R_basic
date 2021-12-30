ceiling(3.2)
ceiling(3.8)
ceiling(-1.2)
ceiling(-3.8)

floor(3.2)
floor(3.8)
floor(-3.8)

round(3.2)
round(3.6)
round(32.1234, 2)
round(-0.51)
round(-1.2346, 3)

abs(-1)
abs(-12)
abs(12)

as.Date("2021/12/06")
as.Date('12/07/2021')
as.Date('2021/12/06', format = '%Y/%m/%d')
as.Date('12/06/2021', format = '%m/%d/%Y')
as.Date('12062021', format = '%m/%d/%Y')
as.Date('12062021', format = '%m%d%Y')
seq(as.Date('2021/12/01'), as.Date('2021/12/25'), 1)
seq(as.Date('2021/01/01'), as.Date('2021/12/25'), 'month')    
tmp <- seq(as.Date('2021/12/01'), as.Date('2021/12/25'), 1)
tmp
as.character(tmp, '%Y') #4digit year
as.character(tmp, '%m')
as.character(tmp, '%d')
as.character(tmp, '%a') #��ȭ���������
as.character(tmp, '%A') #������ ȭ���� ������ ����� �ݿ��� ����� �Ͽ���
as.character(tmp, '%y') #2digit year
as.character(tmp, '%b') #1-12
as.character(tmp, '%B') #1��-12��

Sys.Date()
weekdays(Sys.Date()) #���� ��¥
weekdays(as.Date('1998-02-09')) #2007�� 3�� 20���� ����
weekdays(as.Date('1998-10-09'))
Sys.Date() - as.Date('1998-02-09') #���� ��¥���� 1998-02-09���� ��ĥ�� ��Ҵ���
Sys.Date() - as.Date('1998-10-09')
as.integer(Sys.Date() - as.Date('1998-02-09'))
difftime(Sys.Date(), as.Date('1998-02-09')) 
as.integer(difftime(Sys.Date(), as.Date('1998-02-09')))

library(lubridate)
today()
date <- now()
date
year(date)
month(date)
day(date)
wday(date, label = T) 
wday(date)
date + years(1)
date + months(1)
date + days(1)

tmp <- matrix(1:9, c(3, 3))
tmp
apply(tmp, 1, sum) #��Ŀ��� �� ���� ���� ���
apply(tmp, 2, sum) #��Ŀ��� �� ���� ���� ���
apply(tmp, 1, mean)
apply(tmp, 2, mean)
apply(tmp, 2, function(x) {x*2}) #��Ŀ��� �� ������ 2�踦 ���
lapply(tmp, mean, na.rm = T) #list�� �ٲ�