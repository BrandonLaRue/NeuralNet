# NeuralNet
Octave Neural Network Code

All files in the main directory are scripts that will run the full neural network program with different intentions.

runSingle.m trains the network one time and goes through the test set, outputting the results for visual feedback

testSizes.m is for picking a hidden layer size. It is currently set up for only one hidden layer (since experimentation 
  has shown me that more that one layer results in overfitting in this case in general)
  
sizeTestResults.txt stores two variables: size and costStore which contain the corresponding results of testSizes.m run 
  from sizes 10:5:90 with each cost being the average of 20 iterations of that particular size. These can easily be graphed
  with plot(sizes, costStore, "*-")
