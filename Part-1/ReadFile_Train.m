%% Read Data as string
DataSet = readtable('Data_train.txt', 'Delimiter', '\t ', 'MultipleDelimsAsOne', true, 'HeaderLines', 0, 'ReadVariableNames', false, 'Format', '%s%s%s%s%s%s%s%s%q');
%% Set Columns Names
DataSet.Properties.VariableNames = {'mpg' 'cylinders' 'displacement' 'horsepower' 'weight' 'acceleration' 'model' 'origin' 'name'};