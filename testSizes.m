% navigate to scripts folder
cd Scripts

% Set X, y, and m from data
load learningData.txt

% define a testing set
testingX = X(101:130, :);
testingY = y(101:130, :);
X = X(1:100, :);
y = y(1:100, :);

% set useful variables
[m n] = size(X);
K = max(y);		% K = # of output units

% set up options
options = optimset('MaxIter', 50);

%% ============================================

% set other properties
lambda = 0;

% set up variable to store costs
costStore = [];
%% ========================================================
sizes = 90;
for g = sizes,

	% randomly initialize thetaVec and set up neural network architecture
	layerLengths = [n g K];
	[rws cols L] = createArchitecture(layerLengths, m);

	% Create "short hand" for the cost function to be minimized
	nnCostFunction = @(thetaVec) costFunction(X, y, lambda, ...
										thetaVec, L, rws, cols);

	% run multiple tests and average
	numTimes = 1;
	temp = 0;
	for iter = 1:numTimes,
		initVec = initThetaVec(rws, cols, L);
		[thetaVec, J] = fmincg(nnCostFunction, initVec, options);
		[q dummy] = costFunction(testingX, testingY, 0, thetaVec, L, rws, cols);
		temp = temp + q;
	end
	q = temp / numTimes;

	% store cost on test set
	costStore = [costStore q];
end

%% ========================================================

%% plot data
plot(sizes, costStore, "*-")

% navigate to where started
cd ..