%% =============================================================
%
% randomize order of X and y so training and test sets are
% more representative of a random sample
%
% The file loaded is expected to contain variables X and y which 
% have the same number of rows
%
%% =============================================================
% load X and y
load learningData2.txt

% set up new index structure
a = randperm(length(y));

% variables to hold new X and new y
nX = [];
ny = [];

% set nX and ny based on sequence in 'a'
for i = 1:length(y),
	nX = [nX; X(a(i), :)];
	ny = [ny; y(a(i), :)];
end

% reassign X and y
X = nX;
y = ny;

% resave variables
save learningData4.txt X y

% remove instance variables
clear a i nX ny


