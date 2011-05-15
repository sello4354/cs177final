function qm816=qmtable(x)
% function qmtable calculates the 16x16 quantization table or 8x8 table
% seife kassahun
% April 20111
qm=[16 11 10 16 24 40 51 61
12 12 14 19 26 58 60 55;
14 13 16 24 40 57 69 56;
14 17 22 29 51 87 80 62;
18 22 37 56 68 109 103 77;
24 35 55 64 81 104 113 92;
49 64 78 87 103 121 120 101;
72 92 95 98 112 100 103 99];
if (x==8)
   qm816=qm;
else    
   qm2=[];
   for i=1:8
      for j=1:8
         qm2(2*i-1,2*j-1)=qm(i,j);
         qm2((2*i),(2*j-1))=qm(i,j);
         qm2((2*i-1),(2*j))=qm(i,j);
         qm2((2*i),(2*j))=qm(i,j);
         end
         end
   qm816=qm2;
end
   
 
 