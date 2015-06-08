function [rws cols L] = createArchitecture(layerLengths, m)

%% ========================================================
%	This function initializes the rows and cols variables
%	to ensure that the NN will function properly and have
%	compatible dimensions. 
%
%	Arguments and Assumptions:
%		layerLengths is expected to be an array of all positive 
%		integers. layerLength(1) should be equal to the dimension
%		of the input data. layerLength(L) should be the number
%		of output values.
%
%		m is expected to be a single positive integer denoting
% 		the number of training examples
%
%		rws and cols will be of length L-1, and correspond to
%		the thetas between each layer
%% ==========================================================

% set number of layers
L = length(layerLengths);


% set rws and cols based on layerLengths
for l = 1 : L-1,
	rws(l) = layerLengths(l+1);
	cols(l) = layerLengths(l) + 1;
end