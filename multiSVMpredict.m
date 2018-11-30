function [class,classVote] = multiSVMpredict(multiSVMstruct,testface,nclass)
    all_combs = combnk(1:nclass,2);
    classVote = zeros(size(testface,1),nclass);
    for b = 1:size(all_combs,1)
        comb = all_combs(b,:);
        i = comb(1);
        j = comb(2);
        model = multiSVMstruct{i}{j};
        class = svmclassify(model,testface);
        for c = 1:size(classVote,1)
           if class(c) == 1
              classVote(c,i) = classVote(c,i)+1;
           else
              classVote(c,j) = classVote(c,j)+1;
           end
        end
    end
    [M,class] = max(classVote,[],2);
end
