%load('tensor_and_matrix.mat');

c_vals = zeros(1, 100);
l_vals = zeros(1, 100);

best_output = 0;
for R = 1:100
    maxC = -inf;
    for t = 1:10
%         Fac = cp_als(X_lnormal, R, 'printitn', 0);
        opts = struct();
        opts.printEvery = 0;
        [Fac, Fac0, output] = cp_opt(X, R, 'opt_options', opts, 'lower', 0);
        [c, time] = efficient_corcondia(X, Fac, 0);
        if c > maxC
            best_output = output;
            maxC = c;
        end
    end
    c_vals(R) = maxC;
    l_vals(R) = norm(X - full(Fac));
    fprintf('[Rank %d]: Got c value of %f\n', R, maxC);
    fprintf('Loss: %f, Fit: %f\n', l_vals(R), output.Fit);
end
save('diagnostic.mat', 'c_vals');
