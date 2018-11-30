function [ labels ] = my_predict(model,testface,nclass )
labels = multiSVMpredict(model, testface, nclass);
%labels = nn_predict(model, testface);
end

