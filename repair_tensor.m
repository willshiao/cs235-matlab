function [Y] = repair_tensor(X)
%REPAIR_TENSOR Given a tensor, fix missing values

rows = find(X(:, :, 1) > 0);

Y = X;
for r = 1:size(rows, 1)
    row = rows(r, :);
    fiber = double(Y(row(1), row(2), :));
    ind = find(Y(row(1), row(2), :) == 0);
    if size(ind, 1) > 0
        for loc = ind
%             loc
%             fiber(loc) = round(mean(fiber(loc-2:loc-1)));
            val = round(mean(fiber(loc-2:loc-1)))
            size(val(:))
            Y(row(1), row(2), loc) = val(:);
            fprintf("Fixed %d %d %d - set to %d\n", row(1), row(2), loc, fiber(loc));
        end
%         size(sptensor(tensor(fiber)))
%         size(Y(row(1), row(2), :))
%         Y(row(1), row(2), :) = fiber(:);
    end
end
end

