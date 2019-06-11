%% Read Data
DataTrain = readtable('data_train2.txt');
%%
scatter(DataTrain.weight,DataTrain.horsepower)
xlabel('Weight')
ylabel('Horsepower')
title('Weight vs Horsepower');

hl = lsline;
gradient = ones(size(hl.XData(:)))\hl.YData(:);
intercepet = hl.XData(:)\hl.YData(:);

residual = sum((DataTrain.acceleration - ((DataTrain.horsepower * gradient) + intercepet)).^2);