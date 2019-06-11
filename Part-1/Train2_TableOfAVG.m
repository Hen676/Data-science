%% Read Data
DataTrain = readtable('data_train2.txt');

%% Header
Header = {'Variable';'Mean';'Median';'Min';'Max';'Standard Deviation'};

%% AVG MPG
MeanMPG = mean(DataTrain.mpg);
MedianMPG = median(DataTrain.mpg);
MinMPG = min(DataTrain.mpg);
MaxMPG = max(DataTrain.mpg);
StandardDeviMPG = std(DataTrain.mpg);
%% AVG Accleration
MeanA = mean(DataTrain.acceleration);
MedianA = median(DataTrain.acceleration);
MinA = min(DataTrain.acceleration);
MaxA = max(DataTrain.acceleration);
StandardDeviA = std(DataTrain.acceleration);
%% AVG Hourspower
MeanHp = mean(DataTrain.horsepower);
MedianHp = median(DataTrain.horsepower);
MinHp = min(DataTrain.horsepower);
MaxHp = max(DataTrain.horsepower);
StandardDeviHp = std(DataTrain.horsepower);
%% AVG weight
MeanW = mean(DataTrain.weight);
MedianW = median(DataTrain.weight);
MinW = min(DataTrain.weight);
MaxW = max(DataTrain.weight);
StandardDeviW = std(DataTrain.weight);

%% MPG Variables
MPG = {'MPG';MeanMPG;MedianMPG;MinMPG;MaxMPG;StandardDeviMPG};
%% Acceleration Variables
Acceleration = {'Acceleration';MeanA;MedianA;MinA;MaxA;StandardDeviA};
%% Hoursepower Variables
Horsepower = {'Horsepower';MeanHp;MedianHp;MinHp;MaxHp;StandardDeviHp};
%% Weight Variables
Weight = {'Weight';MeanW;MedianW;MinW;MaxW;StandardDeviW};

%% Variables Ouputted to tables
format long g;
Train2_Table = table(Header, MPG, Acceleration, Horsepower, Weight);
