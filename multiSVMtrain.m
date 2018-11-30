function multiSVMstruct =multiSVMtrain(traindata,realclass,gamma,C) 
all_combs = combnk(1:size(unique(realclass),1),2);
multiSVMstruct = {};
for m = 1:size(all_combs,1)
    combination = all_combs(m,:);
    i = combination(1);
    j= combination(2);
    X = traindata(find(realclass == i | realclass == j),:);
    Y1 = ones(size(X,1)/2,1);
    Y2 = zeros(size(X,1)/2,1);
    Y = [Y1;Y2];
    multiSVMstruct{i}{j} = svmtrain(X,Y,'kernel_function',@(X,Y)kfunc(X,Y,gamma),'boxconstraint',C);
end
end

function  K  = kfunc(u,v,gamma)  
m1=size(u,1);  
m2=size(v,1);  
K=zeros(m1,m2);  
for i=1:m1  
    for j=1:m2  
        K(i,j)=exp(-gamma*norm(u(i,:)-v(j,:))^2);  
    end  
end  
end  