load('tensor_and_matrix.mat');
% coupled = create_coupled('size', [100 100 6 8576], 'modes', {[1 2 4], [3 4]});
% coupled{1} = X;
% coupled{2} = weather;

size_limit = 24 * 7; %720;
width = 20;

coupled = {X(:,:, 1:size_limit), tensor(weather(:, 1:size_limit))}
final = struct();
final.object = coupled;
final.modes = {[1 2 4], [3 4]};
final.size = [width width 5 size_limit];

options = ncg('defaults');
options.Display ='final';
options.MaxFuncEvals = 50000;
options.MaxIters     = 5000;
options.StopTol      = 1e-10;
options.RelFuncTol   = 1e-8;
beta = 0.00001;

for R = 10:10:40
%     R = 15;
    filename_str = sprintf('cmtf_15_rank%d.mat', R);
    fprintf('Rank %d ACMTF\n', R);
    
    [Fac,~,out] = acmtf_opt(final, R, 'init','random','beta_cp', beta, 'alg_options',options);
    UA = double(tenmat(X,1,'bc'));UA=UA';

%     A = Fac.U{1};
%     B = Fac.U{2};
%     C = Fac.U{3};
%     D = Fac.U{4};
%     
%     save(filename_str, 'A', 'B', 'C', 'D', 'UA');
    fprintf('Score: %0.15f\n', norm(full(Fac{1}) - X(:,:, 1:size_limit)));
end

% 
% trueval = final.Xorig{1}(find(final.W{1}==0));
% Z       = full(ktensor(data.Fac(1:3)));
% estval  = Z(find(data.W{1}==0));
% plot(trueval,estval,'*')
% err     = norm(estval - trueval)/length(estval);