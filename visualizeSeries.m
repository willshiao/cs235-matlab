pairs = find(X(:, :, 1) > 0);
figure


for i = 1:size(pairs, 1)
    row = pairs(i, :);
    
    subplot(size(pairs, 1), 3, 3 * i - 2);
    a = medfilt1(double(X(row(1), row(2), :)), 10);
    plot(a);

    subplot(size(pairs, 1), 3, 3 * i - 1);
    plot(double(mm_kX(row(1), row(2), :)));
    
    
    subplot(size(pairs, 1), 3, 3 * i);
    plot(double(l_kX(row(1), row(2), :)));
end
