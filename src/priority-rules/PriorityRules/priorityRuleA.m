function P = priorityRuleA(input)
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
        if(work.vassoiDaInserire(j) > 0)
            P.T(index,1) = work.vassoi(j);
            P.Nstar(index,1) = work.vassoiDaInserire(j);
            P.I(index,1) = work.inseriti(j);
            P.N(index,1) = work.vassoiDaInserireTotali(j);
            index = index + 1;
        end
    end

    %% Dato che P è un sottoinsieme di T effettuo l'unione tra i due insiemi
    % per ottenere gli elementi di T che non in P preservandone l'ordine
    [Primanenti.T, ia] = setdiff(work.vassoi,P.T);
    
    Primanenti.Nstar = [];
    Primanenti.I = [];
    Primanenti.N = [];
    index = 1;
    for l = transpose(ia)
        Primanenti.Nstar(index,1) = work.vassoiDaInserire(l);
        Primanenti.I(index,1) = work.inseriti(l);
        Primanenti.N(index,1) = work.vassoiDaInserireTotali(l);
        index = index + 1;
    end
    P.T = [P.T; Primanenti.T];
    P.Nstar = [P.Nstar; Primanenti.Nstar];
    P.I = [P.I; Primanenti.I];
    P.N = [P.N; Primanenti.N];

    
  
end
