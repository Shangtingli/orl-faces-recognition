function [pcaA,V] = fastPCA(A,k,mA)
    %mA equals the 1*10304 row matrix. MEAN OF EACH COLUMN
    C = cov(A);
    meanA = mean(A);
    tempA = A;
    for i = 1:size(A,1)
        tempA(i,:) = tempA(i,:)-meanA;
    end
    [V,~] = eigs(C,k);
    pcaA = tempA*V;
end