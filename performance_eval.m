clear;

% First, read in the data
% load('tensor_10.mat')  % X
% load('weather_mod.mat')  % weather
load('all_avg_2015.mat')

% Next, create a full tensor to work with
X_full = full(X);

% Create log-normalized set
X_lnormal = log_normalize(X);
weather_lnormal = log(weather);
weather_lnormal(isinf(weather_lnormal)) = 0;  % remove -Inf values from log(0)
R_log = 13;

% Create mm-normalized set
[X_mmnormal, minX, maxX] = mm_normalize(double(X));
X_mmnormal = tensor(X_mmnormal);
[weather_mmnormal, minW, maxW] = mm_normalize(weather);
R_mm = 5;

% % Apply CMTF on each one and get the best result
% [l_Fac, l_out] = run_acmtf(X_lnormal, weather_lnormal, R_log);
% [mm_Fac, mm_out] = run_acmtf(X_mmnormal, weather_mmnormal, R_mm);
% 
% % Reconstruct values
% l_kX = log_unnormalize(l_Fac{1});
% mm_kX = tensor(mm_unnormalize(double(mm_Fac{1}), minX, maxX));
% 
% log_score = norm(full(X) - full(l_kX));
% mm_score = norm(full(X) - full(mm_kX));
% 
% fprintf('Log normalization score: %f\n', log_score);
% fprintf('MM normalization score: %f\n', mm_score);

