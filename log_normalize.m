function [ B ] = log_normalize( X )
%MM_NORMALIZE Perform min-max normalization of the vector/matrix

temp = tenmat(X, [1 2], [3]);
tempMat = log(temp.data);
tempMat(isinf(tempMat)) = 0;
B = tensor(tenmat(tempMat, temp.rdims, temp.cdims, temp.tsize));

end

