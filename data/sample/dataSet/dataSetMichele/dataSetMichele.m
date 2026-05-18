clear
clc

load('dataSetMichele.mat')
sum = 16;
[r,c] = size(dataSet);
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:r
    numeroTipologie = numel(dataSet{i});
    input(i).vassoi = dataSet{i};
    k = numeroTipologie;
    cont = 0;
    for j = 1:numeroTipologie
        input(i).numeroVassoi(j,1) = sum/numeroTipologie + (k-1);
        if cont
            k = k - 1;
            cont = 0;
        elseif i+1 >= numeroTipologie
            k = k - 1;
            cont = 0;
        else
            cont = cont + 1;
        end
        
    end
end