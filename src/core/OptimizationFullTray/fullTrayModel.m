function z = fullTrayModel(x1,input)
%FULLTRAYMODEL Summary of this function goes here
%   x1 - variabile decisionale che tiene conto della quantità
%        totale di una tipologia di vassoio in una colonna.

    % Numero totale di vassoi pieni
    N = input.vassoiDaInserireTotali;
    T = numel(input.vassoi); % Numero totale di tipologie di vassoi
    a = input.vassoi; % Altezza del i-esima tipologia di vassoio
    n = input.vassoiDaInserire; % Quantità totale dell'i-esima tipologia di vassoio
    in = input.inseriti; % Quantità totale dell'i-esima tipologia di vassoio inserita
    hC = input.altezzaColonna; % Altezza della colonna
    M = sum(N);
   
    %% Constraints

    % Vincolo geometrico
    kg = sum(x1.*a) <= hC;
    % Vincolo di overflow
    ko = x1 + in <= N;
    % Vincolo di priorità
    i = T:-1:2;
    k = i-1:-1:1;
%     kp = x1(i) - x1(k) - 2*x1(i).*(x1(k)== 0) <= M.*[y(i)];
    kp = x1(i) - x1(k) - 2*x1(i).*(n(i) > n(k)) <= 0;
    % Evaluate objective function
    if all(kg) & all(ko) & all(kp)
        z = sum(x1.*a);
    else
        z = -inf;
    end
end

