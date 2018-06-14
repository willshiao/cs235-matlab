clear
% Load data
load('all_avg_2015.mat');


REAL_END = 737;
PRED_START = REAL_END + 1;
PRED_END = 1405;

% Only use the first month of the data
X = X(:, :, 1:PRED_END);
weather = weather(:, 1:PRED_END);

% Set constants
RANK = 5;

% Make missing data tensor
% (0's indicate missing data and 1's indicate valid data)
missing = make_missing(X);
missing(:, :, PRED_START:PRED_END) = 0;

X_mod = X;
X_mod(:, :, PRED_START:PRED_END) = 0;

fprintf('Predicting using ACMTF of rank %d\n', RANK);
[Fac, out] = predict_acmtf(X_mod, weather, missing, RANK);

Y = Fac{1};

mae = 0;
mse = 0;

rows = find(X(:, :, 1) ~= 0);
for row = rows.'
    realVals = double(X(row(1), row(2), PRED_START:PRED_END));
    predVals = double(Y(row(1), row(2), PRED_START:PRED_END));
    localMae = sum(abs(realVals - predVals)) / (PRED_END - PRED_START + 1);
    localMse = sum((realVals - predVals) .^ 2) / (PRED_END - PRED_START + 1);

    mae = mae + localMae;
    mse = mse + localMse;

    fprintf('MAE, MSE for [%d, %d]: %f, %f\n', row(1), row(2), localMae, localMse);
end

mse = mse / size(rows, 1);
mae = mae / size(rows, 1);

fprintf('Total Mean Square Error: %f\n', mse);
fprintf('Total Mean Absolute Error: %f\n', mae);
