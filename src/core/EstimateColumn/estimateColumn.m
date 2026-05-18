function numeroColonne = estimateColumn(input)
    work = input;
    numeroColonne = 1;
    accumulatoreVassoi = 0;
    
    for i = 1:numel(work.vassoi)
        %% Ciclo che scorre le tipologie
        while work.numeroVassoi(i) > 0
            %% Ciclo che scorre le quantità della i-esima tipologia
            accumulatoreVassoi = accumulatoreVassoi + work.vassoi(i);
            if accumulatoreVassoi > work.altezzaColonna
                accumulatoreVassoi = 0;            
                numeroColonne = numeroColonne + 1;
            else
                work.numeroVassoi(i) = work.numeroVassoi(i) - 1;
            end
        end
    end
end