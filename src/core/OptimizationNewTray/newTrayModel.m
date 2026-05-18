function z = newTrayModel(x2, input)
%NEWTRAYMODEL Summary of this function goes here
%   Detailed explanation goes here
    
    hCf = input.spazioLiberoColonna; % spazio libero nella colonna
    a = input.vassoi; % Altezza tipologia i-esima vassoio
    n = input.vassoiInseriti; % Quantità di vassoi della tipologia i-esima inseriti nella colonna
    N = sum(n); % Numero totale di vassoi inseriti nella colonna 
    T = numel(a);
    M = N;
    %% Pre-processing variable
    % Si isola dall'array la colonna/riga che fa riferimento alla variabile
    % binaria che ci servirà per metter in OR i vincoli. 
    y = x2(numel(input.vassoi)+1:numel(x2));

    % Le colonne o righe isolate vengono rimosse dalla matrice di partenza
    x2(numel(input.vassoi)+1:numel(x2)) = []; 
    %% Constraints
    % Vincolo geometrico
    kg = sum(x2.*a) <= hCf;
    % Vincolo di frequenza
    i = 1:1:T;
    kf = x2(i) - (n(i)/N)*sum(x2) <= M.*y;
    % Vincolo tipologia
    kt = sum(x2) > 0;
    
    %% Evaluate
    if all(kg) & all(kf) & all(kt)
        z = sum(x2.*a) - sum(y);
    else
        z = -inf;
    end

end

