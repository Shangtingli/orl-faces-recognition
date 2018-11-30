%testcases
testcases = 1;
npersons = 40;
flag = 0;
dimension = 50;
[f_matrix,realclass] = ReadFace(npersons,flag);

switch testcases
    case 1
[pcaA,V] = fastPCA(f_matrix,dimension,mean(f_matrix));
eigF = pcaA(1,:)*V'+mean(f_matrix);
eig_img = reshape(eigF,[112,92]);
imshow(uint8(eig_img))

    case 2
[pcaA,V] = fastPCA(f_matrix,dimension,mean(f_matrix));
multiSVMstruct = multiSVMtrain(pcaA,realclass,0.01,50);
flag = 1;
[test_matrix,realclass] = ReadFace(npersons,flag);
testface = (test_matrix-repmat(mean(f_matrix),size(f_matrix,1),1))*V;
[class,~] = multiSVMpredict(multiSVMstruct,testface,npersons);
testArray = class-realclass;
correctPct = nnz(testArray==0)/size(testArray,1);
    case 3
T = search();
end