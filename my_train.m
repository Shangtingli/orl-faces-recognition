function [ model ] = my_train( traindata,labels,learning_arg1, learning_arg2 )
%% for multiSVMtrain, learning_arg1 = gamma, learning_arg2 = c
model = multiSVMtrain(traindata, labels, learning_arg1, learning_arg2);
%% for neural network, set learning_arg1 and learning_arg2 to 0
%model = nn_train(traindata, labels);
end

