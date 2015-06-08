function Theta_l = thetaConstructor(thetaVec, layers, rws, cols)

%% ==========================================================
%   Theta constructor creates an object, Theta_l, which contains
%      the theta at layer l at Theta_l{l}. 
%
%   Parameters:
%      thetaVec: a vector containing all thetas unrolled into a single column
%      layers: the number of layers in the neural network
%      rws: a vector containing the number of rws of Theta_l at layer l
%         at the index l
%      cols: a vector containing the number of columns of Theta_l at layer l
%         at the index l
%
%   Assumptions:
%      thetaVec has the proper number of values
%      rws and cols are of the same length and have valid indices
%
%   Note: 
%      The number of thetas is layers-1, so unit tests of this program
%         should be done with a value of 2 for layers or it will not run
%% =============================================================

% variable to keep track of main position in array
index = 1;

% make Theta_l for each layer (there is no theta for the final layer)
for l = 1 : layers-1,
	
	% initialize Theta_l for easy addition of columns
	Theta_l{l} = [];

	% each loop adds one column
	for c = 1 : cols(l),

		% add column
		Theta_l{l} = [Theta_l{l}, thetaVec(index: index + rws(l)-1)];
	
		% increase index to new starting position
		index = index + rws(l);
	end
end	