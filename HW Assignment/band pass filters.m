% Sam Harkness
% EE577

close all
clear all

fs = 48e3;

f1 = 15.75;
f2 = 31.5;

fc1 = f1/(fs/2);
fc2 = f2/(fs/2);

f_low1 = fc1*2^(-1/6);
f_low2 = fc2*2^(-1/6);

f_high1 = fc1*2^(1/6);
f_high2 = fc2*2^(1/6);

Wn1 = [f_low1, f_high1];
Wn2 = [f_low2, f_high2];

[B1,A1] = butter(3,Wn1);
[B2,A2] = butter(3,Wn2);

abs(roots(A1))
abs(roots(A2))

[Z1,P1,K1] = butter(3,Wn1);
[Z2,P2,K2] = butter(3,Wn2);

abs(P1)
abs(P2)

B1_a = conv([1 -Z1(1)],[1 -Z1(4)]); 
B1_b = conv([1 -Z1(2)],[1 -Z1(5)]);
B1_c = conv([1 -Z1(3)],[1 -Z1(6)]);

B2_a = conv([1 -Z2(1)],[1 -Z2(4)]); 
B2_b = conv([1 -Z2(2)],[1 -Z2(5)]);
B2_c = conv([1 -Z2(3)],[1 -Z2(6)]);

A1_a = conv([1 -P1(1)],[1 -P1(2)]); 
A1_b = conv([1 -P1(3)],[1 -P1(4)]);
A1_c = conv([1 -P1(5)],[1 -P1(6)]);

A2_a = conv([1 -P2(1)],[1 -P2(2)]); 
A2_b = conv([1 -P2(3)],[1 -P2(4)]);
A2_c = conv([1 -P2(5)],[1 -P2(6)]);

[H1_a,W1] = freqz(B1_a,A1_a,100000);
[H1_b,W1] = freqz(B1_b,A1_b,100000);
[H1_c,W1] = freqz(B1_c,A1_c,100000);

[H2_a,W2] = freqz(B2_a,A2_a,100000);
[H2_b,W2] = freqz(B2_b,A2_b,100000);
[H2_c,W2] = freqz(B2_c,A2_c,100000);

H1 = K1*H1_a.*H1_b.*H1_c;
H2 = K2*H2_a.*H2_b.*H2_c;

figure(1)
hold on
plot((fs/2)*(W1/pi),20*log10(abs(H1)))
plot((fs/2)*(W2/pi),20*log10(abs(H2)))
hold off
title('Frequency Response'),xlabel('Frequency (Hz)'),ylabel('Amplitude (dB)')

figure(2)
subplot(3,1,1),IMPULSE(TF(B1_a,A1_a,1/fs)),axis([0 1 -2 2]),title('H1A Impulse Response')
subplot(3,1,2),IMPULSE(TF(B1_b,A1_b,1/fs)),axis([0 1 -2 2]),title('H1B Impulse Response')
subplot(3,1,3),IMPULSE(TF(B1_c,A1_c,1/fs)),axis([0 1 -2 2]),title('H1C Impulse Response')

figure(3)
subplot(3,1,1),IMPULSE(TF(B2_a,A2_a,1/fs)),axis([0 1 -2 2]),title('H2A Impulse Response')
subplot(3,1,2),IMPULSE(TF(B2_b,A2_b,1/fs)),axis([0 1 -2 2]),title('H2B Impulse Response')
subplot(3,1,3),IMPULSE(TF(B2_c,A2_c,1/fs)),axis([0 1 -2 2]),title('H2C Impulse Response')

figure(4)
subplot(2,1,1),IMPULSE(ZPK(Z1,P1,K1,1/fs)),axis([0 1.2 -4e-4 4e-4]),title('H1 Impulse Response')
subplot(2,1,2),IMPULSE(ZPK(Z2,P2,K2,1/fs)),axis([0 1.2 -4e-4 4e-4]),title('H2 Impulse Response')