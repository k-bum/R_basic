prop <- runif(3500000, min = 15500, max = 17000)
#�ּ� �ִ��� �����ϴ� �������� 350������ ����(ǥ�غ�ǥ ������)
prop 
prop <- as.integer(prop)
#������ ��ȯ
prop
samples <- integer(10^6) 
#������ 10^6���� sample�� ����
samples

s <- prop[sample(prop, 20, replace = T)]
#prop���� 20���� sample�� �ߺ������ϰ� ����0
s
mean_s <- mean(s)
mean_s

for(i in 1:10^6) {
  s <- prop[sample(prop, 20, replace = T)]
  mean_s <- mean(s)
  samples[i] <- mean_s
}

FreqHeights <- table(samples)
FreqHeights
hist(samples, breaks = 1000, prob = T)

x <- seq(from = 15000, to = 16200, length.out = 10000)
#15000���� 16000���� 10000���� �����ؼ� x�� ����
x
ylim <- c(0, 0.01)
plot(x , dnorm(x, mean = 16000, sd = 52.7), main = "Normal",
     type = 'l', ylim = ylim)
#����� 16000�̰� ǥ�������� 52.7�� ���Ժ������� �����ͼ� x�� ��Ī 



