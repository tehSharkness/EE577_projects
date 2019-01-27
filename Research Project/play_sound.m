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

soundsc(x1, 16e3)   %the original sentence
soundsc(v7,16e3)    %the sentence filtered by the 7-Point Averager 
soundsc(vsg,16e3)   %the sentence filtered by the 7-Point SG Filter