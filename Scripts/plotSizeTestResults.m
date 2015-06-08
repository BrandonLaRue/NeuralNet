%% ==========================================================
%
%	This script shows the results from sizeTestResults.txt 
%		variable which are explained below.
%
%	sizeTestResults.txt stores two variables: size and costStore 
%		which contain the corresponding results of testSizes.m run 
%  		from sizes 10:5:90 with each cost being the average of 20 
%		iterations of that particular size.
%% =========================================================== 

% load sizes and costStore 
load data/sizeTestResults.txt

% plot data
plot(sizes, costStore, "*-")
title("Size to Cost of Single Layer Neural Network")
xlabel("Size")
ylabel("Cost")