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

% randomly initialize thetaVec and set up neural network architecture
layerLengths = [n 90 K];
[rws cols L] = createArchitecture(layerLengths, m);
initVec = initThetaVec(rws, cols, L);

% set other properties
lambda = 0;

%% ========================================================

fprintf('\nTraining Neural Network... \n')
options = optimset('MaxIter', 50);

% Create "short hand" for the cost function to be minimized
nnCostFunction = @(thetaVec) costFunction(X, y, lambda, ...
									thetaVec, L, rws, cols);

[thetaVec, J] = fmincg(nnCostFunction, initVec, options);

% Obtain Theta1 and Theta2 back from thetaVec
Theta = thetaConstructor(thetaVec, L, rws, cols);

%% ========================================================

% Visualize thetas
for l = 1:L-1,
	displayData(Theta{l}(:, 2:end));
	pause
end

%cleanPredict(testingX, thetaVec, L, rws, cols)

% get predictions
a = cleanPredict(testingX, thetaVec, L, rws, cols);

% get % correct
percentCorrect = 100 * sum(a == testingY)/length(testingY);
printf("Percent Correct: %.2f\n\n", percentCorrect)
pause

%run through several predictions
for i = 1 : length(testingY),

	% display the image
	displayData(testingX(i, :));

	% output prediction in english
	if(a(i) == 1),
		printf("%s\n", 'Prediction: P' )
	end
	if (a(i) == 2),
		printf("%s\n", 'Prediction: Z')
	end

	% output correct answer in english
	if(testingY(i) == 1),
		printf("%s\n", 'Answer: P' )
	end
	if(testingY(i) == 2),
		printf("%s\n", 'Answer: Z' )
	end
	pause;
end

% navigate to where started
cd ..