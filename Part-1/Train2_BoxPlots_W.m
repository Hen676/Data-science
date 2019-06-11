%% Read Data
DataTrain = readtable('data_train2.txt');
%%
boxplot(DataTrain.weight)
xlabel('All Vehicles')
ylabel('Weight')
title('Weight');