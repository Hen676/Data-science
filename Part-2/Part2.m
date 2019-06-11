%% Clear all
clear all;
close all;

%% Read data
data = xlsread("clinicalfeatures.xlsx",1);

for x = 1:10
    
	%% Seperate train and test
	p = 0.7;
	temp = data(randperm(size(data,1)),:);
	
	train = array2table(temp(1:round(p*length(temp)),:));
	test = array2table(temp(round(p*length(temp)):end,:));
	
	%% Train data
	TREEmodel = fitctree(train,'Var10');
	SVMmodel = fitcsvm(train,'Var10');
	
	%% Test data
	TREEtestPre = predict(TREEmodel, test);
	SVMtestPre = predict(SVMmodel, test);
	
	%% Find Errors
	testArr = table2array(test);
	TREEtp = 0;
	SVMtp = 0;
	
	TREEfp = 0;
	SVMfp = 0;
	
	TREEfn = 0;
	SVMfn = 0;
	
	TREEtn = 0;
	SVMtn = 0;
	
	%% Sens and Spec
	for r = 1:size(testArr,1)
		if (TREEtestPre(r) == 2)
			if (testArr(r,10) == 2)
				TREEtp = TREEtp + 1;
			end
			if (testArr(r,10) == 1)
				TREEfp = TREEfp + 1;
			end
		end
		if (TREEtestPre(r) == 1)
			if (testArr(r,10) == 2)
				TREEfn = TREEfn + 1;
			end
			if (testArr(r,10) == 1)
				TREEtn = TREEtn + 1;
			end
		end
	end
	
	for r = 1:size(testArr,1)
		if (SVMtestPre(r) == 2)
			if (testArr(r,10) == 2)
				SVMtp = SVMtp + 1;
			end
			if (testArr(r,10) == 1)
				SVMfp = SVMfp + 1;
			end
		end
		if (SVMtestPre(r) == 1)
			if (testArr(r,10) == 2)
				SVMfn = SVMfn + 1;
			end
			if (testArr(r,10) == 1)
				SVMtn = SVMtn + 1;
			end
		end
	end
	
	
	%% calucaltions
	TREEerror(x) = ((TREEtp + TREEtn) / size(testArr,1))*100;
	SVMerror(x) = ((SVMtp + SVMtn) / size(testArr,1))*100;
	
	TREEsensitivity(x) = (TREEtp / (TREEtp + TREEfn))*100;
	SVMsensitivity(x) = (SVMtp / (SVMtp + SVMfn))*100;
	
	TREEspecificity(x) = (TREEtn / (TREEtn + TREEfp))*100;
	SVMspecificity(x) = (SVMtn / (SVMtn + SVMfp))*100;
	
end
%% Table of stats
error = [mean(TREEerror);mean(SVMerror)];
sensitivity = [mean(TREEsensitivity);mean(SVMsensitivity)];
specificity = [mean(TREEspecificity);mean(SVMspecificity)];

stats = table(error,sensitivity,specificity,'RowNames',{'Tree';'SVM'});