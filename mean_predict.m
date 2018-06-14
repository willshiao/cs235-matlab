
mae = 0;
mse = 0;

Y_full = full(Y);
for r = toRemove.'
    slice = double(X(:, :, r(3)));
    ySlice = double(Y_full(:, :, r(3)));
    missingSlice = double(missing(:, :, r(3)));
    validValues = find(missingSlice == 1);
    senAvg = mean(slice(validValues));
%     fprintf('Sensor Average: %f\nActual: %f\n', senAvg, slice(r(1), r(2)));

    mae = mae + abs(senAvg - slice(r(1), r(2)));
    mse = mse + (senAvg - slice(r(1), r(2))) .^ 2;
end

mse = mse / size(toRemove, 1);
mae = mae / size(toRemove, 1);

fprintf('Mean Square Error: %f\n', mse);
fprintf('Mean Absolute Error: %f\n', mae);
