clear
clc

load('dataSetNicolo.mat')
sum = 12;
[r,c] = size(dataSet);
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:r
    numeroTipologie = numel(dataSet{i});
    input(i).vassoi = dataSet{i};
    k = numeroTipologie;
    cont = 0;
    j = 1;
    while j <= numeroTipologie
        input(i).numeroVassoi(j,1) = sum/numeroTipologie + (k-1);
        if j+1 <= numeroTipologie && numeroTipologie > 1
            j = j + 1;
            input(i).numeroVassoi(j,1) = sum/numeroTipologie - (k-1);
        elseif numeroTipologie > 2
            input(i).numeroVassoi(j,1) = sum/numeroTipologie + (k-2);
            j = j + 1;
            input(i).numeroVassoi(j,1) = sum/numeroTipologie - (k-2);
            
        else
            input(i).numeroVassoi(j,1) = sum/numeroTipologie;
        end
        k = k - 1;
        j = j + 1;
    end
end
input.numeroVassoi