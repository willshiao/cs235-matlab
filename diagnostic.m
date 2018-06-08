%load('tensor_and_matrix.mat');

c_vals = zeros(1, 50);

for R = 1:100
    maxC = -inf;
    for t = 1:10
%         Fac = cp_als(X_lnormal, R, 'printitn', 0);
        opts = struct();
        opts.printEvery = 0;
        Fac = cp_opt(X, R, 'opt_options', opts, 'lower', 0);
        [c, time] = efficient_corcondia(X, Fac, 0);
        maxC = max(maxC, c);
    end
    c_vals(R) = maxC;
    fprintf('[Rank %d]: Got c value of %f\n', R, maxC);
end
save('diagnostic.mat', 'c_vals');
