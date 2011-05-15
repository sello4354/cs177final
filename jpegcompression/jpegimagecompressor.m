% image compression using the JPEG standard
% seife kassahun
% In fullfillment of data compression course project
% April 2011
%pathname=input('Enter the name of the image with directory where the image stored','s');
I=imread('Kodak12.bmp'); % reads the image
imgcopy=rgb2gray(I);%copies the grayscale version of the original image
compimg8=compressndecompress(imgcopy,8);% calls the function by passing the image read with compression factor
%compimg16=compressndecompress(imgcopy,16);
%rgbimage=cat(3,Asnew,Asnew,Asnew);
  subplot(131) 
  imshow(imgcopy)
  title('Original Image')
  %hold on
  subplot(132) 
 imshow(compimg8)  
 title('Reconstructed Image-8')
 % subplot(133)
  %imshow(compimg16)
  %title('Reconstructed Image-16')
  
 
  

 
  

  