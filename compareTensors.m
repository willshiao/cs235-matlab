pairs = find(X(:, :, 1) > 0);
figure


for i = 1:size(pairs, 1)
    row = pairs(i, :);
    subplot(3, 4, i);
    plot(double(X(row(1), row(2), :)));
end
