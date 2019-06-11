%% Read Data
DataTrain = readtable('data_train2.txt');
%%
scatter(DataTrain.acceleration,DataTrain.mpg)
xlabel('Acceleration')
ylabel('MPG')
title('Accelration vs MPG');

hl = lsline;
gradient = ones(size(hl.XData(:)))\hl.YData(:);
intercepet = hl.XData(:)\hl.YData(:);

residual = sum((DataTrain.acceleration - ((DataTrain.horsepower * gradient) + intercepet)).^2);