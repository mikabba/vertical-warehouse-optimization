function X = defineDecisionalSet(param)
%DEFINEDECISIONALSET calcola tutte le combinazioni dei valori possibili
%compatibilmente al numero di vassoi ancora da inserire. Es:
% 0 0 1
% 0 1 0
% ...
% 1 1 0
% 1 1 1

    elements = {};
    for i=1:length(param.vassoiDaInserire)
        
        elements{i} = 0:1:param.vassoiDaInserire(i);
    end
    
    try
        combinations = cell(1, numel(elements)); 
        [combinations{:}] = ndgrid(elements{:});
        combinations = cellfun(@(x) x(:), combinations,'uniformoutput',false); 
        X = [combinations{:}];
        X(sum(X(:,1:length(param.vassoiDaInserire)).*transpose(param.vassoi),2) > param.altezzaColonna, :) = [];
    catch ME
        for i=1:length(param.vassoiDaInserire)
            elements{i} = 0:1:computeLastValueByRamdds(length(param.vassoiDaInserire));
        end
        combinations = cell(1, numel(elements)); 
        [combinations{:}] = ndgrid(elements{:});
        combinations = cellfun(@(x) x(:), combinations,'uniformoutput',false); 
        X = [combinations{:}];
        X(sum(X(:,1:length(param.vassoiDaInserire)).*transpose(param.vassoi),2) > param.altezzaColonna, :) = [];
    end
end