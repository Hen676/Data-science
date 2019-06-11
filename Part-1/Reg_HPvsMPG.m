%% Read Data
DataTrain = readtable('data_train2.txt');
DataTest = readtable('data_test2.txt');
%% Creating Coeficent for Linear, Bridge and Lasso
scatter(DataTrain.horsepower,DataTrain.mpg)
z = lsline;
gradient = (z.XData(2)-z.XData(1))\(z.YData(2)-z.YData(1));
intercept = z.YData(2)-(gradient * z.XData(2));
%% Ridge
lambda = 1e-2;
Ridge = ridge(DataTrain.mpg,DataTrain.horsepower,lambda,0);
%% Lasso
[LassoALL,Lstats] = lasso(DataTrain.horsepower,DataTrain.mpg,'CV',20);
LassoInt = Lstats.Intercept(Lstats.Index1SE);
LassoGrad = LassoALL(:,Lstats.Index1SE);
%% Y predict values
yLinear = (DataTrain.horsepower * gradient) + intercept;
yRidge = (DataTrain.horsepower * Ridge(2)) + Ridge(1);
yLasso = (DataTrain.horsepower * LassoGrad) + LassoInt;
%% Y predict values for test
PreyLinear = (DataTest.horsepower * gradient) + intercept;
PreyRidge = (DataTest.horsepower * Ridge(2)) + Ridge(1);
PreyLasso = (DataTest.horsepower * LassoGrad) + LassoInt;
%% least-square errors
LinearError = mean((DataTrain.mpg - yLinear).^2);
RidgeError = mean((DataTrain.mpg - yRidge).^2);
LassoError = mean((DataTrain.mpg - yLasso).^2);
%% least-square errors of predict
PreLinearError = mean((DataTest.mpg - PreyLinear).^2);
PreRidgeError = mean((DataTest.mpg - PreyRidge).^2);
PreLassoError = mean((DataTest.mpg - PreyLasso).^2);
%%
fprintf('Train Squared Error\n')
fprintf('Linear:  %f\n',LinearError);
fprintf('Ridge:   %f\n',RidgeError);
fprintf('Lasso:   %f\n',LassoError);
fprintf('Test Squared Error\n')
fprintf('Linear:  %f\n',PreLinearError);
fprintf('Ridge:   %f\n',PreRidgeError);
fprintf('Lasso:   %f\n',PreLassoError);
%%
scatter(DataTest.mpg,PreyLinear,'g')
xlabel('Truth value')
ylabel('Predicted value')
title('Linear Ground Tuth values and predicted Value');
%%
figure
scatter(DataTest.mpg,PreyRidge,'r')
xlabel('Truth value')
ylabel('Predicted value')
title('Ridge Ground Tuth values and predicted Value');
%%
figure
scatter(DataTest.mpg,PreyLasso,'b')
xlabel('Truth value')
ylabel('Predicted value')
title('Lasso Ground Tuth values and predicted Value');