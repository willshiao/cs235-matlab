% Extract matrix of non-zero sensor counts

coords = find(X(:, :, 1) ~= 0);
counts = zeros(size(coords, 1), size(X, 3));
predicted = zeros(size(coords, 1), size(X, 3));

for i = 1:size(coords,1)
    counts(i, :) = X(coords(i, 1), coords(i, 2), :);
    predicted(i, :) = Fac{1}(coords(i, 1), coords(i, 2), :);
end

