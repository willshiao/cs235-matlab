function [ B ] = mm_unnormalize( A, minA, maxA )
%MM_UNNORMALIZE Reverse min-max normalization of the vector/matrix

B = (A .* (maxA - minA)) + minA;

end

