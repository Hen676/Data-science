%% Read Data
DataTrain = readtable('data_train2.txt');
DataTest = readtable('data_test2.txt');
%% Creating Coeficent for Linear, Bridge and Lasso
scatter(DataTrain.weight,DataTrain.horsepower);
z = lsline;
gradient = (z.XData(2)-z.XData(1))\(z.YData(2)-z.YData(1));
intercept = z.YData(2)-(gradient * z.XData(2));
%% Ridge
lambda = 1e-2;
Ridge = ridge(DataTrain.horsepower,DataTrain.weight,lambda,0);
%% Lasso
[LassoALL,Lstats] = lasso(DataTrain.weight,DataTrain.horsepower,'CV',20);
LassoInt = Lstats.Intercept(Lstats.Index1SE);
LassoGrad = LassoALL(:,Lstats.Index1SE);
%% Y predict values
yLinear = (DataTrain.weight * gradient) + intercept;
yRidge = (DataTrain.weight * Ridge(2)) + Ridge(1);
yLasso = (DataTrain.weight * LassoGrad) + LassoInt;
%% Y predict values for test
PreyLinear = (DataTest.weight * gradient) + intercept;
PreyRidge = (DataTest.weight * Ridge(2)) + Ridge(1);
PreyLasso = (DataTest.weight * LassoGrad) + LassoInt;
%% least-square errors
LinearError = mean((DataTrain.horsepower - yLinear).^2);
RidgeError = mean((DataTrain.horsepower - yRidge).^2);
LassoError = mean((DataTrain.horsepower - yLasso).^2);
%% least-square errors off predict
PreLinearError = mean((DataTest.horsepower - PreyLinear).^2);
PreRidgeError = mean((DataTest.horsepower - PreyRidge).^2);
PreLassoError = mean((DataTest.horsepower - PreyLasso).^2);
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
scatter(DataTest.horsepower,PreyLinear,'g')
xlabel('Truth value')
ylabel('Predicted value')
title('Linear Ground Tuth values and predicted Value');
%%
figure
scatter(DataTest.horsepower,PreyRidge,'r')
xlabel('Truth value')
ylabel('Predicted value')
title('Ridge Ground Tuth values and predicted Value');
%%
figure
scatter(DataTest.horsepower,PreyLasso,'b')
xlabel('Truth value')
ylabel('Predicted value')
title('Lasso Ground Tuth values and predicted Value');