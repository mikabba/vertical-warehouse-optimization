function [work,r,out] = extrapolateScenario(outputGeneralGraph)
    [r,c] = size(outputGeneralGraph);
    index = 1;
    for i = 1:r
        work(index,:) = outputGeneralGraph(i,:);
        index = index + 1;
        for j = 1:r
            if size(outputGeneralGraph(i).vassoi) == size(outputGeneralGraph(j).vassoi)
                if outputGeneralGraph(i).vassoi == outputGeneralGraph(j).vassoi & outputGeneralGraph(i).numeroVassoi ~= outputGeneralGraph(j).numeroVassoi
                    work(index,:) = outputGeneralGraph(j,:);
                    index = index + 1;
                end
            end
        end
    end
    work(r+1:end,:) = [];
    for i = 1:1:r/3
        out(i,:).result = work((i-1)*3+1:i*3,:);
    end
end