function [J, grad] = costFunction(X, y, lambda, ...
									thetaVec, L, rws, cols)
%% ========================================================
%	y is expected to be a vector (m X 1) containing the
%		class label (1, 2, 3, etc.). This will later be	
%		converted into the sparse matrix (to be labeled h)
%		containing a "1" at the position indicated by the
%		y vector
%
%	X is also expected to be in standard format such that
%		each row represents a single training example
%% ========================================================

% setup useful constants
m = size(X, 1);		% number of training examples

% storage variables
d_l = {};
Theta = thetaConstructor(thetaVec, L, rws, cols);
ThetaGrad_l = {};
grad = [];

% get predictions
[h a_l z_l] = myPredict(X, thetaVec, L, rws, cols);

% convert y into proper format
% each col represents one training example
temp = zeros(size(a_l{L}, m));
for i = 1:length(y),
	temp(y(i), i) = 1;
end
y = temp;

% --------------- Gradient ------------------
% calculate d_L, should be a (k X m) matrix
d_l{L} = a_l{L} - y;

% calculate other d_l's
for l = L-1: -1 : 2,
	d_l{l} = Theta{l}' * d_l{l+1} .* (a_l{l} .* (1 - a_l{l}));

	% remove the ones row
	d_l{l} = d_l{l}(2:end, :);
end

% Calculate gradients without regularization
for l = 1 : L-1,
	ThetaGrad_l{l} = (d_l{l+1} * a_l{l}')/m;
end

% regularize gradients'
for l = 1 : L-1,
	ThetaGrad_l{l} = ThetaGrad_l{l} + lambda/m * [zeros(size(ThetaGrad_l{l}(:, 1))) ThetaGrad_l{l}(:, 2:end)];
end

% unload gradients into vector
for l = 1 : L-1,
	grad = [grad; ThetaGrad_l{l}(:)];
end

%% ------------------ Cost function ----------------------
% implement unregularized cost function
J = (-1/m) * sum(sum((y .* log(h) + (1-y) .* log(1-h))));

% calculate regularization term
reg = 0;
for l = 1 : L-1,
	reg = reg + sum(sum((Theta{l}(:, 2:end)).^2));
end
reg = reg * lambda/(2*m);

% add regularization to cost
J = J + reg;