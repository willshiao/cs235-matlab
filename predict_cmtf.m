function [Fac, out] = predict_cmtf(X, weather, missX, R)
%RUN_ACMTF Summary of this function goes here
%    0's indicate missing data and 1's indicate valid data

tic

coupled = {X, tensor(weather)};
final = struct();
final.object = coupled;
final.modes = {[1 2 4], [3 4]};
final.size = [size(X, 1) size(X, 2) size(weather, 1) size(X, 3)];
final.missing = { missX, tensor(ones(size(weather))) };

options = ncg('defaults');
options.Display ='final';
options.MaxFuncEvals = 100000;
options.MaxIters     = 10000;
options.StopTol      = 1e-10;   
options.RelFuncTol   = 1e-8;

fprintf('Rank %d CMTF\n', R);
    
[Fac,~,out] = cmtf_opt(final, R, 'init', 'random', 'alg_options',options);

toc
% UA = double(tenmat(X,1,'bc'));UA=UA';
end

