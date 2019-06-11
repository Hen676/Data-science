%% Read Data
DataTrain = readtable('data_train2.txt');
%%
boxplot(DataTrain.horsepower)
xlabel('All Vehicles')
ylabel('Horsepower')
title('Horsepower');