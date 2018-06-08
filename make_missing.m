function [Y] = make_missing(X)
% MAKE_MISSING  Makes missing tensor, given data
%    0's indicate missing data and 1's indicate valid data

rows = find(X(:, :, 1) ~= 0);
Y = tensor(zeros(size(X)));  % mark everything as missing

for row = rows.'
    Y(row(1), row(2), :) = 1;
end
end

