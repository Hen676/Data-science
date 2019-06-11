%% Set Varaible names
DataSet.Properties.VariableNames = {'mpg' 'cylinders' 'displacement' 'horsepower' 'weight' 'acceleration' 'model' 'origin' 'name'};
%% WriteTable
writetable(DataSet, 'data_test2.txt');