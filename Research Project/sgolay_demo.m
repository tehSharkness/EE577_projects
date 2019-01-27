close all
clear all

b = sgolay(0,7);
H1 = freqz(b(4,:),1);

b = sgolay(2,7);
H2 = freqz(b(4,:),1);

b = sgolay(4,7);
H3 = freqz(b(4,:),1);

figure(1)
hold on
plot((0:511)/511,abs(H1),'-')
plot((0:511)/511,abs(H2),':')
plot((0:511)/511,abs(H3),'--')
hold off
xlabel('w in units of pi'),ylabel('|H(w)|')
title('Magnitude Responses, N=7')
legend('d=0,1','d=2,3','d=4,5')

b = sgolay(0,15);
H1 = freqz(b(8,:),1);

b = sgolay(2,15);
H2 = freqz(b(8,:),1);

b = sgolay(4,15);
H3 = freqz(b(8,:),1);


figure(2)
hold on
plot((0:511)/511,abs(H1),'-')
plot((0:511)/511,abs(H2),':')
plot((0:511)/511,abs(H3),'--')
hold off
xlabel('w in units of pi'),ylabel('|H(w)|')
title('Magnitude Responses, N=15')
legend('d=0,1','d=2,3','d=4,5')