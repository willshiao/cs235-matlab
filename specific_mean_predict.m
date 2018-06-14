% Predict values using previous data from the same sensor


mae = 0;
mse = 0;

Y_full = full(Y);
for r = toRemove.'
    locAvg = mean([X(r(1), r(2), r(3) - 1) X(r(1), r(2), r(3) + 1)]);
%     fprintf('Sensor Average: %f\nActual: %f\n', senAvg, slice(r(1), r(2)));

    mae = mae + abs(locAvg - X(r(1), r(2), r(3)));
    mse = mse + (locAvg - X(r(1), r(2), r(3))) .^ 2;
end

mse = mse / size(toRemove, 1);
mae = mae / size(toRemove, 1);

fprintf('Mean Square Error: %f\n', mse);
fprintf('Mean Absolute Error: %f\n', mae);
