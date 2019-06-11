%% Remove 'NA' valuse from table
DataSet = DataSet(cellfun(@isempty, strfind(DataSet.mpg, 'NA')), :);
DataSet = DataSet(cellfun(@isempty, strfind(DataSet.cylinders, 'NA')), :);
DataSet = DataSet(cellfun(@isempty, strfind(DataSet.displacement, 'NA')), :);
DataSet = DataSet(cellfun(@isempty, strfind(DataSet.horsepower, 'NA')), :);
DataSet = DataSet(cellfun(@isempty, strfind(DataSet.weight, 'NA')), :);
DataSet = DataSet(cellfun(@isempty, strfind(DataSet.acceleration, 'NA')), :);
DataSet = DataSet(cellfun(@isempty, strfind(DataSet.model, 'NA')), :);
DataSet = DataSet(cellfun(@isempty, strfind(DataSet.origin, 'NA')), :);
%% Set Varaible names
DataSet.Properties.VariableNames = {'mpg' 'cylinders' 'displacement' 'horsepower' 'weight' 'acceleration' 'model' 'origin' 'name'};