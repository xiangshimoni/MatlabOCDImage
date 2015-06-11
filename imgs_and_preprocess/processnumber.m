clear,clc
%% open image file
img1=imread('1.png');
img2=imread('2.png');
img3=imread('3.png');
img4=imread('4.png');
img5=imread('5.png');
img6=imread('6.png');
img7=imread('7.png');
img8=imread('8.png');
img9=imread('9.png');
img0=imread('99.png');
% 9 numbers,each size is 72*72
number1 = rgb2gray(img1);
number2 = rgb2gray(img2);
number3 = rgb2gray(img3);
number4 = rgb2gray(img4);
number5 = rgb2gray(img5);
number6 = rgb2gray(img6);
number7 = rgb2gray(img7);
number8 = rgb2gray(img8);
number9 = rgb2gray(img9);
number0 = rgb2gray(img0);
save number.mat number1 number2 number3 number4 number5 number6 number7 number8 number9 number0