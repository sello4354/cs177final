function y=compressndecompress(imgcopy,compfactor)
%function compressndecompress compress and decompress an image based on jpeg alogrithm and returns the compressed image matrix
%seife kassahun
%April 2011
clmsize=size(imgcopy,2);% hold the column size of the image
rwsize=size(imgcopy,1);% holds the row size of the image
% step 1 jpeg compression
disp('Before level shift')
displaym(imgcopy(1:compfactor,1:compfactor),compfactor)
AS=int16(imgcopy)-128;
disp('After level shift the first matrix')
displaym(AS(1:compfactor,1:compfactor),compfactor)
%step 2 jpeg compression
for i=1:compfactor:rwsize
  for j=1:compfactor:clmsize 
  B(i:i+(compfactor-1),j:j+(compfactor-1))=dct2(AS(i:i+(compfactor-1),j:j+(compfactor-1)));%(for each 8x8 or 16x16 matrix apply 2 dimensional dct
  end
  end
displaym(B(1:compfactor,1:compfactor),compfactor)
% step3 jpeg compression
Bq=[];
for i=1:compfactor:rwsize
  for j=1:compfactor:clmsize 
  Bq(i:i+(compfactor-1),j:j+(compfactor-1))=quantize(B(i:i+(compfactor-1),j:j+(compfactor-1)));
  end
  end
display(Bq(1:compfactor,1:compfactor))
 % step 3 zigzag order of DC and AC coeefficents
zigzagcdc=[];
indexrow=1;
 for i=1:compfactor:rwsize
  for j=1:compfactor:clmsize     
      zigzagcdc(indexrow,:)= zigzag(Bq(i:i+(compfactor-1),j:j+(compfactor-1)));
	  indexrow=indexrow+1;
  end
 end
zigzagcdc(1,:)

% decompression
% dequantize 
for i=1:compfactor:rwsize
  for j=1:compfactor:clmsize 
  dbq(i:i+(compfactor-1),j:j+(compfactor-1))=dequantize(Bq(i:i+(compfactor-1),j:j+(compfactor-1))); 
  end
  end
 dbq(1:compfactor,1:compfactor)
 % inverse 2dct
 for i=1:compfactor:rwsize
  for j=1:compfactor:clmsize 
  bidct(i:i+(compfactor-1),j:j+(compfactor-1))=round(idct2(dbq(i:i+(compfactor-1),j:j+(compfactor-1))));%(for each 8x8 or 16x16  block apply inverse 2 dimensional dct
  end
  end
  dbq(1:compfactor,1:compfactor)
  % add 128
  Asshift=bidct+128;
  Asshift(1:compfactor,1:compfactor)
  Asnew=uint16(Asshift);
  y=uint8(Asnew);
  