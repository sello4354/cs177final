function y=zigzag(M)
% function zigzag traverses thru matrix m in odd order and returns a vector form of m
% seife kassahun
% April 2011
          
ind = reshape(1:numel(M), size(M));         %# indices of elements
ind = fliplr( spdiags( fliplr(ind) ) );     %# get the anti-diagonals
ind(:,1:2:end) = flipud( ind(:,1:2:end) );  %# reverse order of odd columns
ind(ind==0) = [];                          %# keep non-zero indices
y=M(ind);                   

   
  