function [Fac, out] = run_acmtf(X, weather, R)
%RUN_ACMTF Summary of this function goes here
%   Detailed explanation goes here

coupled = {X, tensor(weather)};
final = struct();
final.object = coupled;
final.modes = {[1 2 4], [3 4]};
final.size = [size(X, 1) size(X, 2) size(weather, 1) size(X, 3)];

options = ncg('defaults');
options.Display ='final';
options.MaxFuncEvals = 50000;
options.MaxIters     = 5000;
options.StopTol      = 1e-10;   
options.RelFuncTol   = 1e-8;
beta = 0.00001;

fprintf('Rank %d ACMTF\n', R);
    
[Fac,~,out] = acmtf_opt(final, R, 'init','random','beta_cp', beta, 'alg_options',options);
% UA = double(tenmat(X,1,'bc'));UA=UA';
end

