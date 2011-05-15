function x=dequantize(x)
% function  dequantize 
% seife kassahun
% April 30,2011
if size(x,1)==8   
   x=round(x.*qmtable(8));% divides by the 8x8 quantize table 
else
   x=round(x.*qmtable(16));%divides by 16x16 table
end