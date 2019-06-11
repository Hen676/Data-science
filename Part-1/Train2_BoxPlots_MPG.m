%% Read Data
DataTrain = readtable('data_train2.txt');
%%
boxplot(DataTrain.mpg)
xlabel('All Vehicles')
ylabel('MPG')
title('MPG');