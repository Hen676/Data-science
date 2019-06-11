%% Read Data
DataTrain = readtable('data_train2.txt');
%%
boxplot(DataTrain.acceleration)
xlabel('All Vehicles')
ylabel('Accelration')
title('Accelration');