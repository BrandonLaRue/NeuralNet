# NeuralNet
Octave Neural Network Code

All files in the main directory are scripts that will run the full neural network program with different intentions.

runSingle.m trains the network one time and goes through the test set, outputting the results for visual feedback

testSizes.m is for picking a hidden layer size. It is currently set up for only one hidden layer (since experimentation 
  has shown me that more that one layer results in overfitting in this case in general)

Inside scripts/variables are several versions of leardingData.txt
	learningData.txt contains the ordered monochrome data of 130 pictures
	learningData2.txt contains the unordered monochrome data of 130 pictures
		This version should be used so that the training and test sets are 
		biased in their evaluation of the data. Using learningData.txt
		does allow one to experiment with underfitting data where the algorithm
		simply outputs the same value every time.
	learningData3.txt contains the unordered grayscale data of 130 pictures
		they were randomized in the same order as learningData2.txt
	learningData4.txt contains the unordered grayscale data of 130 pictures
		randomized differently than learningData3.txt
