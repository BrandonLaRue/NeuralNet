function [h, a_l, z_l] = cleanPredict(X, ...
									thetaVec, L, rws, cols)

%% =============================================
%   Note that the output variable a_l has the 
%   attached ones row for all layers except the
%   output layer.
%
%   The z_l values do not contain a ones row by 
%   their very nature
%
%   The variable X is expected to be recieved as
%   each row constituting a single example
%
%	h will be output the same way as above
%
%	Completed:
%   	If this function were to be reworked to 
%		account for a multiclass classification
% 		problem, the output vector would have to 
%		be formatted so that it contained the index
% 		of the position of the max value rather than 
%		the probability values themselves.
%% =============================================

% Useful constants 
m = size(X, 1);		% number of training examples

% Storage variables
a_l{1} = [ones(1, size(X', 2)); X'];
z_l{1} = zeros(size(X'));

theta = thetaConstructor(thetaVec, L, rws, cols);

% calculate and store layers
for l = 1 : L-1,
	z_l{l+1} = theta{l} * a_l{l};
	a_l{l+1} = [ones(1, size(z_l{l+1}, 2)); sigmoid(z_l{l+1})];
end

% remove the ones row from the last row
a_l{L} = a_l{L}(2:end, :);

% output = last layer
h = a_l{L};


%% ================================================
%	The part below may be added when getting data
%	for a human to read but not as it will be needed
%	in the cost function

% h = index of max val within each col
% each col represents one training expmple
[dummy, h] = max(h, [], 1);

%transpose to make a vector (m X 1)
h = h';
%% =================================================