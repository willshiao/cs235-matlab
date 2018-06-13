function [ Y, output ] = get_best_cp( X, R )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

best_fit = 0;

for t = 1:50
    if mod(t, 10) == 0
        fprintf('Iteration #%d\n', t);
    end
    opts = struct();
    opts.printEvery = 0;
    [Fac, ~, output] = cp_opt(X, R, 'opt_options', opts, 'lower', 0);
    if output.Fit > best_fit
        fprintf('Found better fit (%f > %f)\n', output.Fit, best_fit);
        best_fit = output.Fit;
        Y = Fac;
    end
end

end

