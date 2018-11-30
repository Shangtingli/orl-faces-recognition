function T = search()
all_C = [0.001,0.01,0.1,1,10,50,100];
all_dimensions = [30,40,50,60,70,80,90,100]; 
all_gamma = [0.001,0.01,0.1,1,10,50,100];
%all_C = [0.01,50];
%all_dimensions = [60,70];
%all_gamma = [0.01,50];
npersons = 40;
[train_matrix,realclasstrain] = ReadFace(npersons,0);
[test_matrix,realclasstest] = ReadFace(npersons,1);
num_entries = size(all_C,2)*size(all_dimensions,2)*size(all_gamma,2);
GAMMA = zeros(num_entries,1);ACCURACY = zeros(num_entries,1);C = zeros(num_entries,1);
DIMENSION = zeros(num_entries,1);
T = table(GAMMA,C,DIMENSION,ACCURACY);
row_idx = 1;
for c = 1:size(all_gamma,2)
  for a = 1:size(all_C,2)
      for b = 1:size(all_dimensions,2)
           curr_C = all_C(a);
           curr_gamma = all_gamma(c);
           curr_dimension = all_dimensions(b);
           [curr_gamma,curr_C,curr_dimension]
           T{row_idx,1} = curr_gamma;
           T{row_idx,2} = curr_C;
           T{row_idx,3} = curr_dimension;
           [pcatrain,V] = fastPCA(train_matrix,curr_dimension,mean(train_matrix));
           pcatest= (test_matrix-repmat(mean(train_matrix),size(train_matrix,1),1))*V;
           multiSVMstruct = multiSVMtrain(pcatrain,realclasstrain,curr_gamma,curr_C);
           [class,~] = multiSVMpredict(multiSVMstruct,pcatest,npersons);
           testArray = class-realclasstest;
           correctPct = nnz(testArray==0)/size(testArray,1);
           T{row_idx,4} = correctPct;
           row_idx = row_idx + 1;
      end
   end
end
writetable(T,'~/Desktop/ZKYPROJECT/BS_INFO.csv');
end