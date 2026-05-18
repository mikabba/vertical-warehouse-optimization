function [spazioOccupatoVassoiVuoti, combinazioneVassoiVuoti] = ...
                                optimizationNewTray(input,hCf,combinazioneColonna)
%   Detailed explanation goes here
    work = input;
    work.spazioLiberoColonna = hCf;
    work.vassoiInseriti = combinazioneColonna; 
    X = transpose(defineDecisionalSetBinary(work,length(work.vassoi)));
    index = 1;
    z = [];
    for x = X
        z(index) = newTrayModel(x,work);
        var(:,index) = x;
        index = index + 1;
    end
    
    [maxValue,index] = max(z);
    combinazioneVassoiVuoti = var(:,index);
    spazioOccupatoVassoiVuoti = maxValue + sum(combinazioneColonna(numel(work.vassoi)+1:end));
    combinazioneVassoiVuoti = combinazioneVassoiVuoti(1:numel(work.vassoi));
end

