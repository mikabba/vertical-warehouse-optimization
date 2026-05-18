function dataSetResult = removeZeroFromDataSet(dataSet)
    [r,c] = size(dataSet);
    for i = 1:r
        indexJ = 1;
        vassoi = [];
        for j = 1:c
            if dataSet(i,j) ~= 0
                vassoi(indexJ,1) = dataSet(i,j);
                indexJ = indexJ + 1;
            end
        end
        dataSetResult{i} = vassoi;
    end
    
end