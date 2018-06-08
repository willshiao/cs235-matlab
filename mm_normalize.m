function [ B, minA, maxA ] = mm_normalize( A )
%MM_NORMALIZE Perform min-max normalization of the vector/matrix

minA = min(A(:));
maxA = max(A(:));

B = (A - minA) / (maxA - minA);

end

