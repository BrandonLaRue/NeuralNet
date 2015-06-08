# NeuralNet
Octave Neural Network Code

All files in the main directory are scripts that will run the full neural network program with different intentions.

runSingle.m trains the network one time and goes through the test set, outputting the results for visual feedback

testSizes.m is for picking a hidden layer size. It is currently set up for only one hidden layer (since experimentation 
  has shown me that more that one layer results in overfitting in this case in general)
  
sizeTestResults.txt stores two variables: size and costStore which contain the corresponding results of testSizes.m run 
  from sizes 10:5:90 with each cost being the average of 20 iterations of that particular size. These can easily be graphed
  with plot(sizes, costStore, "*-")

Inside the Scripts folder are several versions of leardingData.txt
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
