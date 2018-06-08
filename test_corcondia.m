files = {
	'cmtf_15_rank15.mat',
	'cmtf_15_rank25.mat',
	'cmtf_15_rank35.mat',
	'cmtf_15_rank45.mat',
	'cmtf_15_rank55.mat',
	'cmtf_15_rank65.mat',
	'cmtf_15_rank75.mat',
	'cmtf_15_rank85.mat',
	'cmtf_15_rank95.mat',
    'cmtf_15_rank115.mat',
	'cmtf_15_rank135.mat',
	'cmtf_15_rank155.mat'
};
load('tensor_and_matrix.mat');

for i = 1:size(files, 1)
    filename = sprintf('%s.mat', files{i});
    fprintf('Statistics for %s\n', filename);
    load(filename);
    [c, time] = efficient_corcondia(X, Fac{1}, 0);
    c
end
