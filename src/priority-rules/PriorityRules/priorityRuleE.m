function P = priorityRuleE(input)

    work = sortStruct(input,'vassoiDaInserire','descend');
    P.T = work.vassoi;
    P.Nstar = work.vassoiDaInserire;
    P.I = work.inseriti;
    P.N = work.vassoiDaInserireTotali;
    
end

