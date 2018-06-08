lat = 6;
lng = 7;

A_mem = zeros(65, 1);
B_mem = zeros(65, 1);

for i = 1:65
%     A_min = min(A(:, i));
    A_max = max(A(:, i));
%     a = A ./ A_max;
    a = A(lat, i) / A_max;
    if a >= 0.25
        A_mem(i) = 1;
    end
    
    
%     B_min = min(B(:, i));
    
    B_max = max(B(:, i));
%     b = B ./ B_max;
    b = B(lat, i) / B_max;
    if b >= 0.5
        B_mem(i) = 1;
    end
    
end

mem = A_mem & B_mem;
groups = find(mem ~= 0)
size(groups)
parts = {A, B, D};

clusters = arrayfun(@(X) getGroup(X, parts), groups, 'UniformOutput', false)
rows = cellfun(@(x) x{3}, clusters, 'UniformOutput', false)

figure
hold on
cellfun(@(x) plot(x{3}), clusters, 'UniformOutput', false)
