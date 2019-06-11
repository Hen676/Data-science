%% clear all
clear all;
close all;

%% read data
data = xlsread("clinicalfeatures.xlsx",1);

%% group data by class
group1 = data(data(:,10)==1,:);
group2 = data(data(:,10)==2,:);

%% group 1
age_1 = group1(:,1);
bmi_1 = group1(:,2);
glucose_1 = group1(:,3);
insulin_1 = group1(:,4);
homa_1 = group1(:,5);
leptin_1 = group1(:,6);
adiponectin_1 = group1(:,7);
resistin_1 = group1(:,8);
mcp1_1 = group1(:,9);

min_1 = {min(age_1);min(bmi_1);min(glucose_1);min(insulin_1);min(homa_1);min(leptin_1);min(adiponectin_1);min(resistin_1);min(mcp1_1)};
max_1 = {max(age_1);max(bmi_1);max(glucose_1);max(insulin_1);max(homa_1);max(leptin_1);max(adiponectin_1);max(resistin_1);max(mcp1_1)};
mean_1 = {mean(age_1);mean(bmi_1);mean(glucose_1);mean(insulin_1);mean(homa_1);mean(leptin_1);mean(adiponectin_1);mean(resistin_1);mean(mcp1_1)};
median_1 = {median(age_1);median(bmi_1);median(glucose_1);median(insulin_1);median(homa_1);median(leptin_1);median(adiponectin_1);median(resistin_1);median(mcp1_1)};
mode_1 = {mode(age_1);mode(bmi_1);mode(glucose_1);mode(insulin_1);mode(homa_1);mode(leptin_1);mode(adiponectin_1);mode(resistin_1);mode(mcp1_1)};
var_1 = {var(age_1);var(bmi_1);var(glucose_1);var(insulin_1);var(homa_1);var(leptin_1);var(adiponectin_1);var(resistin_1);var(mcp1_1)};

table1 = table(min_1,max_1,mean_1,median_1,mode_1,var_1,'RowNames',{'Age','BMI','Glucose','Insulin','HOMA','Leptin','Adiponectin','Resistin','MCP.1'});

%% group 2
age_2 = group2(:,1);
bmi_2 = group2(:,2);
glucose_2 = group2(:,3);
insulin_2 = group2(:,4);
homa_2 = group2(:,5);
leptin_2 = group2(:,6);
adiponectin_2 = group2(:,7);
resistin_2 = group2(:,8);
mcp1_2 = group2(:,9);

min_2 = {min(age_2);min(bmi_2);min(glucose_2);min(insulin_2);min(homa_2);min(leptin_2);min(adiponectin_2);min(resistin_2);min(mcp1_2)};
max_2 = {max(age_2);max(bmi_2);max(glucose_2);max(insulin_2);max(homa_2);max(leptin_2);max(adiponectin_2);max(resistin_2);max(mcp1_2)};
mean_2 = {mean(age_2);mean(bmi_2);mean(glucose_2);mean(insulin_2);mean(homa_2);mean(leptin_2);mean(adiponectin_2);mean(resistin_2);mean(mcp1_2)};
median_2 = {median(age_2);median(bmi_2);median(glucose_2);median(insulin_2);median(homa_2);median(leptin_2);median(adiponectin_2);median(resistin_2);median(mcp1_2)};
mode_2 = {mode(age_2);mode(bmi_2);mode(glucose_2);mode(insulin_2);mode(homa_2);mode(leptin_2);mode(adiponectin_2);mode(resistin_2);mode(mcp1_2)};
var_2 = {var(age_2);var(bmi_2);var(glucose_2);var(insulin_2);var(homa_2);var(leptin_2);var(adiponectin_2);var(resistin_2);var(mcp1_2)};

table2 = table(min_2,max_2,mean_2,median_2,mode_2,var_2,'RowNames',{'Age','BMI','Glucose','Insulin','HOMA','Leptin','Adiponectin','Resistin','MCP.1'});

%% boxplots
subplot(3,3,1);
boxplot(age_1)
title('Age - BoxPlot')

subplot(3,3,2);
boxplot(bmi_1)
title('BMI - BoxPlot')

subplot(3,3,3);
boxplot(glucose_1)
title('Glucose - BoxPlot')

subplot(3,3,4);
boxplot(insulin_1)
title('Insulin - BoxPlot')

subplot(3,3,5);
boxplot(homa_1)
title('HOMA - BoxPlot')

subplot(3,3,6);
boxplot(leptin_1)
title('Leptin - BoxPlot')

subplot(3,3,7);
boxplot(adiponectin_1)
title('Adiponectin - BoxPlot')

subplot(3,3,8);
boxplot(resistin_1)
title('Resistin - BoxPlot')

subplot(3,3,9);
boxplot(mcp1_1)
title('MCP.1 - BoxPlot')

figure('name','Group BoxPlot - 2');

subplot(3,3,1);
boxplot(age_2)
title('Age - BoxPlot')

subplot(3,3,2);
boxplot(bmi_2)
title('BMI - BoxPlot')

subplot(3,3,3);
boxplot(glucose_2)
title('Glucose - BoxPlot')

subplot(3,3,4);
boxplot(insulin_2)
title('Insulin - BoxPlot')

subplot(3,3,5);
boxplot(homa_2)
title('HOMA - BoxPlot')

subplot(3,3,6);
boxplot(leptin_2)
title('Leptin - BoxPlot')

subplot(3,3,7);
boxplot(adiponectin_2)
title('Adiponectin - BoxPlot')

subplot(3,3,8);
boxplot(resistin_2)
title('Resistin - BoxPlot')

subplot(3,3,9);
boxplot(mcp1_2)
title('MCP.1 - BoxPlot')

%% correlation matrix

corr1 = corrcoef(group1);
tableC1 = table(corr1(1:end-1,1),corr1(1:end-1,2),corr1(1:end-1,3),corr1(1:end-1,4),corr1(1:end-1,5),corr1(1:end-1,6),corr1(1:end-1,7),corr1(1:end-1,8),corr1(1:end-1,9),'RowNames',{'Age','BMI','Glucose','Insulin','HOMA','Leptin','Adiponectin','Resistin','MCP.1'});
tableC1.Properties.VariableNames = {'Age','BMI','Glucose','Insulin','HOMA','Leptin','Adiponectin','Resistin','MCP1'};

corr2 = corrcoef(group2);
tableC2 = table(corr2(1:end-1,1),corr2(1:end-1,2),corr2(1:end-1,3),corr2(1:end-1,4),corr2(1:end-1,5),corr2(1:end-1,6),corr2(1:end-1,7),corr2(1:end-1,8),corr2(1:end-1,9),'RowNames',{'Age','BMI','Glucose','Insulin','HOMA','Leptin','Adiponectin','Resistin','MCP.1'});
tableC2.Properties.VariableNames = {'Age','BMI','Glucose','Insulin','HOMA','Leptin','Adiponectin','Resistin','MCP1'};

corr = corr2 - corr1;
tableC = table(corr(1:end-1,1),corr(1:end-1,2),corr(1:end-1,3),corr(1:end-1,4),corr(1:end-1,5),corr(1:end-1,6),corr(1:end-1,7),corr(1:end-1,8),corr(1:end-1,9),'RowNames',{'Age','BMI','Glucose','Insulin','HOMA','Leptin','Adiponectin','Resistin','MCP.1'});
tableC.Properties.VariableNames = {'Age','BMI','Glucose','Insulin','HOMA','Leptin','Adiponectin','Resistin','MCP1'};
