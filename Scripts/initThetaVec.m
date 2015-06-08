function thetaVec = initThetaVec(rws, cols, L)

%% =============================================
%	randomly ititialize thetaVec based upon the
%	network architecture data in rows, cols, and
%	L, the number of layers.
%
%	Assumptions:
%		L is expected to be one more than length(rows)
%
%		rows and columns are expected to be of the same 
%		length and should be of compatible positive
%		values to represent the neural network
%
%	Update:
%		Using the createArchitecture function to 
%		get these values ensures that all assumptions
%		will be met.
%
%% =============================================

% variable to store the needed length of thetaVec
lengthVec = 0;

% Calculate lengthVec based on rows and cols
for l = 1 : L-1,
	lengthVec = lengthVec + rws(l) * cols(l);
end

% randomly initialize thetaVec with lengthVec values
thetaVec = rand(lengthVec, 1);
