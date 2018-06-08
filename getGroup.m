function [ group ] = getGroup( num, parts )
%GETGROUP Summary of this function goes here
%   Detailed explanation goes here
    group = { parts{1}(:, num), parts{2}(:, num), parts{3}(:, num) };

end

