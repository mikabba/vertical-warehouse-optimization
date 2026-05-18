function P = priorityRuleO(input, altezzaColonna)
%PRIORITYRULEA Summary of this function goes here
%   Detailed explanation goes here
    
    P.T = []; % Sottoinsieme di tipologie vassoi
    P.Nstar = []; % Sottoinsieme di vassoi ancora da inserire
    P.I = []; % Sottoinsieme di vassoi inseriti
    P.N = []; % Sotto insieme di vassoi da inserire totali
    index = 1;

    %% Si ordina l'ingresso per avere al primo elemento il vassoio più grande
    work = sortStruct(input,'vassoi','descend');
    for j =1:length(work.vassoi)
        %% Per ogni tipologia di vassoio controllo che la sua quantità ancora
        % da inserire non sia nulla
        rapporto = altezzaColonna/work.vassoi(j);
        if(ceil(rapporto) - rapporto > 0)
            P.T(index,1) = work.vassoi(j);
            P.Nstar(index,1) = work.vassoiDaInserire(j);
            P.I(index,1) = work.inseriti(j);
            P.N(index,1) = work.vassoiDaInserireTotali(j);
            index = index + 1;
        end
    end

    if length(P.T) < length(work.vassoi)
       [Primanenti.vassoi, ia]  = setdiff(work.vassoi, P.T);
       Primanenti.vassoiDaInserire = [];
       Primanenti.inseriti = [];
       Primanenti.vassoiDaInserireTotali = [];
       index = 1;
       for l = transpose(ia)
           Primanenti.vassoiDaInserire(index,1) = work.vassoiDaInserire(l);
           Primanenti.inseriti(index,1) = work.inseriti(l);
           Primanenti.vassoiDaInserireTotali(index,1) = work.vassoiDaInserireTotali(l);
           index = index + 1;
       end
       Primanenti = priorityRuleE(Primanenti);
       P.T = [P.T; Primanenti.T];
       P.Nstar = [P.Nstar; Primanenti.Nstar];
       P.I = [P.I; Primanenti.I];
       P.N = [P.N; Primanenti.N];
    end
    
  
end
