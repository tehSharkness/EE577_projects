close all
clear all

fid = fopen('sx331.wav','r');
status = fseek(fid,1024, -1);          % skip the header
[x1,count] = fread(fid,inf,'int16');      % x1 contains speech data    NOTE: Sample Rate = 16KHz
fclose(fid);

t1_7 = clock;
b7 = 1/7*ones(1,7);
t2_7 = clock;

t1_sg = clock;
bsg = sgolay(2,7)
t2_sg = clock;

dt_7 = t2_7 - t1_7
dt_sg = t2_sg - t1_sg

v7 = filter(b7,[1],x1);
vsg = filter(bsg(4,:),[1],x1);

soundsc(x1, 16e3)
soundsc(v7,16e3)
soundsc(vsg,16e3)

figure(1)
subplot(3,1,1),plot(x1),title('Original'),axis([2400 3400 -1500 1500])
subplot(3,1,2),plot(v7),title('7-Point FIR Averager'),axis([2400 3400 -1500 1500])
subplot(3,1,3),plot(vsg),title('7-Point 2nd order SG Filter'),axis([2400 3400 -1500 1500])

load lenna

yy7 = conv2(conv2(xx,b7),b7(:));
yysg = conv2(conv2(xx,bsg(4,:)),bsg(:,4));

figure(2)
subplot(1,3,1),show_img(xx,0),title('Original')
subplot(1,3,2),show_img(yy7,0),title('7-Point Averager')
subplot(1,3,3),show_img(yysg,0),title('7-Point 2nd order SG Filter')

figure(3)
subplot(3,1,1),plot(xx(128,:)),title('Original'),axis([8 250 0 200])
subplot(3,1,2),plot(yy7(131,:)),title('7-Point Averager'),axis([8 250 0 200])
subplot(3,1,3),plot(yysg(131,:)),title('7-Point 2nd order SG Filter'),axis([8 250 0 200])

figure(4)
freqz(b7,[1])

figure(5)
freqz(bsg(4,:),[1])