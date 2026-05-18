function P = priorityRuleG(input)
%PRIORITYRULEG Summary of this function goes here
%   Detailed explanation goes here
    P.T = []; 
    P.Nstar = [];
    P.I = []; 
    P.N = []; 
    index = 1;

    work = sortStruct(input,'vassoi','descend');
    for j =1:length(work.vassoi)
        if(work.vassoiDaInserire(j) >= index)
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
       Primanenti = priorityRuleA(Primanenti);
       P.T = [P.T; Primanenti.T];
       P.Nstar = [P.Nstar; Primanenti.Nstar];
       P.I = [P.I; Primanenti.I];
       P.N = [P.N; Primanenti.N];
    end
end

