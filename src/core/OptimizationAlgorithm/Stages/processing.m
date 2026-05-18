function output = processing(input)
    work = input;
    work.vassoiDaInserire = input.numeroVassoi;
    work.vassoiDaInserireTotali = input.numeroVassoi;
    work.inseriti = zeros(size(input.vassoi));
    magazzino = [];
    spazioOccupatoColonna = [];
    spazioLiberoColonna = [];
    for L = 1:input.numeroColonne
        %% Ordinamento in base alle priority rule
        P = managePriorityRules(work);
        %% Corrispondenza con i campi dello struct work
        work.vassoi = P.T;
        work.vassoiDaInserire = P.Nstar;
        work.inseriti = P.I;
        work.vassoiDaInserireTotali = P.N;
        %% Risoluzione del modello matematico
        [spazioOccupatoColonna(:,L),combinazioneColonna] = optimizationFullTray(work);
        spazioLiberoColonna(:,L) = work.altezzaColonna - spazioOccupatoColonna(:,L);
        %% Ordinamento decrescente delle informazioni in base all'altezza
        work.combinazioneColonna = combinazioneColonna;
        fields = {'altezzaColonna', ...
              'numeroColonne', ...
              'priorityRule'};
        work = rmfield(work,fields);
        work = sortStruct(work,'vassoi','descend');
        work.altezzaColonna = input.altezzaColonna;
        work.numeroColonne = input.numeroColonne;
        work.priorityRule = input.priorityRule;
        %% Aggiorno i dati con i risultati
        magazzino(:,L) = work.combinazioneColonna;
        work.inseriti = work.inseriti + work.combinazioneColonna;
        work.vassoiDaInserire = work.vassoiDaInserire - work.combinazioneColonna;
    end
    output = input;
    output.spazioLiberoColonna = spazioLiberoColonna;
    output.magazzino = magazzino;
    output.spazioOccupatoColonnaVassoiPieni = spazioOccupatoColonna;
    %% Diagnostic info
    if sum(sum(output.magazzino,2)) < sum(work.vassoiDaInserireTotali)
        disp(' non sono stati inseriti tutti i vassoi');
    elseif sum(sum(output.magazzino,2)) > sum(work.vassoiDaInserireTotali)
        disp(' sono stati inseriti più vassoi del previsto');
    end
end