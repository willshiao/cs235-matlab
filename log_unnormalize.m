function [ B ] = log_unnormalize( X )
%MM_NORMALIZE Unnormalize log-normalized data

temp = tenmat(X, [1 2], [3]);
B = tensor(tenmat(exp(temp.data), temp.rdims, temp.cdims, temp.tsize));

end

