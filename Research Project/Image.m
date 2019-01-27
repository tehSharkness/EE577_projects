clear all;
close all;

load lenna;
figure(1)
subplot(3,2,1),show_img(xx, 0),title('Original')

a1 = [1 1 1]/3;
a2 = ones(1,7)/7;
a3 = [1 -1];
a4 = [-1 3 -1];
a5 = [-1 1 1 1 -1];

subplot(3,2,2),show_img(filter2(filter2(xx,a1),a1(:)),0),title('a1')
subplot(3,2,3),show_img(filter2(filter2(xx,a2),a2(:)),0),title('a2')
subplot(3,2,4),show_img(filter2(xx,a3),0),title('a3')
subplot(3,2,5),show_img(filter2(xx,a4),0),title('a4')
subplot(3,2,6),show_img(filter2(filter2(xx,a5),a5(:)),0),title('a5')

% figure(2)
% w = -pi:pi/100:pi;
% freqz(a5,1,w)