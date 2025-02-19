%lifi transmitter with image 
clc
clear all;
close all;

s=serial('COM9');
set(s,'BaudRate',4800)
set(s,'TimeOut',10)
p=imread('dsa.jpg');
q=rgb2gray(p);
disp(s);
%q = im2bw(q);
r=imresize(q,[10 10]);
t=reshape(r,[1 1*100]);
% figure,imshow(p);
% figure,imshow(q);
% figure,imshow(r),title('image that is transferred using LIFI');
fopen(s);
%Serial transfer
for i=1:100
%      pause(.5)
    t1=num2str(t(i));
    fwrite(s,t1);
    fwrite(s,' ');
    
end
pause(5)
fclose(s);
