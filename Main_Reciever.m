%lifi transmitter with image 
clc;
clear all;
close all;

s=serial('COM9');
set(s,'BaudRate',4800)
set(s,'TimeOut',10)
disp(s);
I = [];
fopen(s);
%Serial transfer
for i=1:10
      
%      pause(.5)
%     t1=num2str(t(i));
    dt = fread(s);
%     dt=dt-32;
dt = char(dt);
dt = double(dt);
    dt'
    if numel(dt) > 60
        I = [I dt];
        break
    end
    
end
pause(5)
fclose(s);


r=uint8(I(1:100));
disp(r)
ri=r>10;
% r = im2bw(r);
t=reshape(ri,[10 10]);
figure,imshow(im2bw(~t)),title('recovered image');
imwrite(t,'rx.jpg')