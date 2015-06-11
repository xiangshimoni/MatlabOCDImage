%  ©³©·¡¡¡¡¡¡©³©·
%©³©¿©ß©¥©¥©¥©¿©ß©·
%©§¡¡¡¡¡¡¡¡¡¡¡¡¡¡©§ ¡¡
%©§¡¡¡¡¡¡©¥¡¡¡¡¡¡©§
%©§¡¡©×©¿¡¡©»©×¡¡©§
%©§¡¡¡¡¡¡¡¡¡¡¡¡¡¡©§
%©§¡¡¡¡¡¡©ß¡¡¡¡¡¡©§
%©§¡¡¡¡¡¡¡¡¡¡¡¡¡¡©§
%©»©¥©·¡¡¡¡¡¡©³©¥©¿
%    ©§¡¡¡¡¡¡©§   
%    ©§¡¡¡¡¡¡©§   
%    ©§¡¡¡¡¡¡©»©¥©¥©¥©·
%    ©§¡¡¡¡¡¡¡¡¡¡¡¡¡¡©Ç©·
%    ©§¡¡¡¡¡¡¡¡¡¡¡¡¡¡©³©¿
%    ©»©·©·©³©¥©×©·©³©¿
%      ©§©Ï©Ï¡¡©§©Ï©Ï
%      ©»©ß©¿¡¡©»©ß©¿
%
clear,clc
%% open image file
[fn,pn,fi]=uigetfile('*.bmp;*.png;*.jpg;*.jpeg','choose image');
img=imread([pn fn]);
%% process image 
width = size(img,1);%image width
height = size(img,2);%image height
minlength = min([width,height]);%min of width and height
circle_d = floor(minlength*(1-0.618));%circle radius
circle_x_end = circle_d;
circle_y_start = height - circle_d + 1;
%circle center
circle_center_x = circle_x_end/2;
circle_center_y = (circle_y_start+height)/2;
%draw circle--------------------------------
for i=1:circle_x_end
    for j=circle_y_start:height
        if((i-circle_center_x)^2+(j-circle_center_y)^2 <= (circle_d/2)^2)
            img(i,j,1) = 255;
            img(i,j,2) = 0;
            img(i,j,3) = 0;
        end
    end
end
% draw number-------------------------------
load number.mat
num = input('Input the number to add to the image:');
while(num<0 || num>9)
    num = input('Input error,out of range(0-9),reinput the number:'); 
end
%-------------------------------------------
%scale the nu7mber image
var_name = ['number' num2str(num)];
eval([var_name '=imresize(' var_name ',[circle_x_end,height - circle_y_start+1]);']);
%sharp the image
eval(['index = find(' var_name '>0);']);
for k=1:length(index)
    eval([var_name '(index(k)) = 255;']);
end
%add the value to the 2nd and 3rd layer
eval(['img(1:circle_x_end,circle_y_start:height,2) = img(1:circle_x_end,circle_y_start:height,2)+' var_name ';']);
eval(['img(1:circle_x_end,circle_y_start:height,3) = img(1:circle_x_end,circle_y_start:height,3)+' var_name ';']);
%% show image
imshow(img);
%% save image
dotindex = max(find(fn=='.'));
imwrite(img,[fn(1:dotindex-1) ' with number ' num2str(num) fn(dotindex:end)]);

