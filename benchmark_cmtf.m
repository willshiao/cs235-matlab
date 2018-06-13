clear
% Load data
load('all_avg_2015.mat');

% Only use the first month of the data
X = X(:, :, 1:737);
weather = weather(:, 1:737);

% Define a shuffle function
shuf = @(x) x(randperm(size(x, 1)), :);

% Set constants
MISS_PER = 0.05;
RANK = 5;
% Number of entries to remove (and test against)
NUM_ENTRIES = floor(MISS_PER * size(X, 3));

fprintf('Removing %d items from the data tensor\n', NUM_ENTRIES);

% Make missing data tensor
% (0's indicate missing data and 1's indicate valid data)
missing = make_missing(X);

% Extract non-missing entries
validEntries = find(missing == 1);

% Randomly pick items to mark as missing
toRemove = shuf(validEntries);
toRemove = toRemove(1:NUM_ENTRIES, :);

newX = X;
for row = toRemove.'
    newX(toRemove(1), toRemove(2), toRemove(3)) = 0;
    missing(toRemove(1), toRemove(2), toRemove(3)) = 0;
end

fprintf('Performing CMTF of rank %d\n', RANK);
[Fac, out] = predict_acmtf(X, weather, missing, RANK);

Y = Fac{1};

mae = 0;
mse = 0;

for row = toRemove.'
    realVal = X(row(1), row(2), row(3));
    predVal = Y(row(1), row(2), row(3));
    mae = mae + abs(realVal - predVal);
    mse = mse + (realVal - predVal) ^ 2;
    fprintf('%d\n', predVal);
end

mse = mse / size(toRemove, 1);
mae = mae / size(toRemove, 1);

fprintf('Mean Square Error: %f\n', mse);
fprintf('Mean Absolute Error: %f\n', mae);
