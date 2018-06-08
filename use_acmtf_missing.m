clear;

load('weather.mat');
load('tensor_10.mat');

NUM_ITERATIONS = 10; % number of times to compute CMTF
R = 6; % Rank

% First, we extract all the non-zeroes from the first slice of the tensor
slice = X(:, :, 1);



pairs = find(X(:, :, 1) > 0);
predicted = cell(size(pairs, 1), 1);

for i = 1:size(pairs, 1)
    row = pairs(i, :);
    fprintf('Filling in missing sensor at (%d, %d)\n', row(1), row(2));

    X_mod = X;
    missing = tensor(ones(size(X)));
    minF = 0;

    % Remove one sensor from the data
    X_mod(row(1), row(2), :) = -1;
    missing(row(1), row(2), :) = 0;

    % Perform CMTF NUM_ITERATIONS times to get best CMTF fit
    for t = 1:NUM_ITERATIONS
        [Zhat, out] = predict_acmtf(X_mod, weather, missing, R);
        if out.F < minF
            minF = out.F;
            predicted{i} = Zhat;
        end
    end
    save('acmtf_bench.mat', 'predicted', 'pairs');
end
