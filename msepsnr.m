function [MSE,PSNR]=msepsnr(img1,img2);

img1 = double(img1);
img2=double(img2);

[m n] = size(img1);

er=img1-img2;
MSE=sum(sum(er.^2))/(m*n);
PSNR= 10*log10(255^2/MSE);

fprintf('MSE = %f\n',MSE);
fprintf('PSNR = %f\n',PSNR);