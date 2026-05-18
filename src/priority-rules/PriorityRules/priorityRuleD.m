function P = priorityRuleD(input)
%PRIORITYRULED Summary of this function goes here
%   Detailed explanation goes here
    P.T = [];
    P.Nstar = [];
    P.I = [];
    P.N = [];
    index = 1;

    work = sortStruct(input,'vassoi','descend');
    for j =1:length(work.vassoi)
        if(~isempty(P.T))
            if(work.vassoiDaInserire(j) >= 4*index/(length(work.vassoi)))
                P.T(index,1) = work.vassoi(j);
                P.Nstar(index,1) = work.vassoiDaInserire(j);
                P.I(index,1) = work.inseriti(j);
                P.N(index,1) = work.vassoiDaInserireTotali(j);
                index = index + 1;
            end
        else
            if(work.vassoiDaInserire(j) > 0)
                P.T(index,1) = work.vassoi(j);
                P.Nstar(index,1) = work.vassoiDaInserire(j);
                P.I(index,1) = work.inseriti(j);
                P.N(index,1) = work.vassoiDaInserireTotali(j);
                index = index + 1;
            end
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

