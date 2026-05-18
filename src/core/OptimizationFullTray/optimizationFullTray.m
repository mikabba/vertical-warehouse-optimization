function [spazioOccupatoColonna,combinazioneColonna] = optimizationFullTray(input)
%OPTIMIZATIONFULLTRAY Summary of this function goes here
%   Detailed explanation goes here
    
%     X = transpose(defineDecisionalSetBinary(input,length(input.vassoi)));
    X = transpose(defineDecisionalSet(input));
    index = 1;
    z = [];
    for x = X
        z(index) = fullTrayModel(x,input);
        var(:,index) = x;
        index = index + 1;
    end
    
    [maxValue,index] = max(z);
    combinazioneColonna = var(:,index);
    spazioOccupatoColonna = maxValue;
    
    
    
end

