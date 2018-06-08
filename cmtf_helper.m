function [Fac cost]= cmtf_helper(X,Y,R)
s = size(X);
I = s(1); J = s(2); K = s(3);
L = size(Y,2);


Z.object{1} = X;
Z.object{2} = Y;
Z.modes = {[1 2 3], [3 4]};
% Z.modes{2} = [1 4];
Z.size = [I J K L];

options = ncg('defaults');
options.Display ='final';
options.MaxFuncEvals = 100000;
options.MaxIters     = 10000;
options.StopTol      = 1e-10;
options.RelFuncTol   = 1e-8;

[Fac,~,out] = cmtf_opt(Z,R,'init','random','alg_options',options);
UA = double(tenmat(X,1,'bc'));UA=UA';
A = Fac.U{1};
B = Fac.U{2};
C = Fac.U{3};
D = Fac.U{4};

