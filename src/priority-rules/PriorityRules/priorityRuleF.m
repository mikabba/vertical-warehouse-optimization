function P = priorityRuleF(input)
%PRIORITYRULEF Summary of this function goes here
%  Dare priorità alle dimensioni più grandi considerando quantità crescenti.
% Scegliere la dimensione pi`u grande con quantità n′
% i > n_i. Se sono state
% selezionate P ⊂ T dimensioni, allora dare priorit`a alle dimensioni pi`u
% grandi la cui quantit`a risulta essere maggiore di zero per le dimensioni
% rimanenti;
    
    P.T = []; 
    P.Nstar = []; 
    P.I = []; 
    P.N = [];
    index = 1;
    compare = -1;

    work = sortStruct(input,'vassoi','descend');

    for j =1:length(work.vassoi)
        if(work.vassoiDaInserire(j) > (compare+1))
            P.T(index,1) = work.vassoi(j);
            P.Nstar(index,1) = work.vassoiDaInserire(j);
            P.I(index,1) = work.inseriti(j);
            P.N(index,1) = work.vassoiDaInserireTotali(j);
            index = index + 1;
            compare = work.vassoiDaInserire(j);
        end
    end

    if length(P.T) < length(work.vassoi)
       [Primanenti.vassoi, ia] = setdiff(work.vassoi, P.T);
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

