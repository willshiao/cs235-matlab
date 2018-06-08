function [ Y ] = round_tensor( X )
%ROUND_TENSOR Rounds the values of a tensor X

B = tenmat(X, [1 2], [3]);
Y = tensor(tenmat(round(B.data), B.rdims, B.cdims, B.tsize));
end

