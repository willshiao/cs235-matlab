function [ output_args ] = explore_cp( Fac, figures )
%EXPLORE_CP Summary of this function goes here
%   Detailed explanation goes here

latDim = Fac{1};
lngDim = Fac{2};
timeDim = Fac{3};
lambda = Fac.lambda;
rank = size(timeDim, 2);

cnt = 1;

figure
for num = 1:rank
    if num == floor(rank / figures) + 1
        figure
        cnt = 1;
        ceil(rank / figures)
    end
    subplot(ceil(rank / figures), 2, cnt);
    wMap = kron(latDim(:, num), lngDim(:, num).');
%     surf(wMap);
    hm = heatmap(wMap);
    hm.XLabel = 'Longitude';
    hm.YLabel = 'Latitude';
    cnt = cnt + 1;

    subplot(ceil(rank / figures), 2, cnt);
    plot(timeDim(:, num) * lambda(num));
    cnt = cnt + 1;
end

end

