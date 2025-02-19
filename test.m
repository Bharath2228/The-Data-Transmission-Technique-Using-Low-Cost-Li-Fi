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
for i=1:2
       disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$')
%      pause(.5)
%     t1=num2str(t(i));
    dt = fread(s)
    numel(dt)
%    if numel(dt) > 60
        I = [I dt];
        %break
%    end
    
end
%pause(5)
fclose(s);
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5')

disp(I)
r=uint8(I(1:100));
r = im2bw(r);
t=reshape(r,[10 10]);
figure,imshow(t),title('recovered image');
imwrite(t,'rx.jpg')