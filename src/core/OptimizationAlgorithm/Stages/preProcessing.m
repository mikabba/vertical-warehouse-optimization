function output = preProcessing(input, altezzaColonna, priorityRule)
%PREPROCESSING il risultato di questa funzione fornisce un pacchetto output
% Il pacchetto output è costituito dai campi che tengono dei dati relativi 
% al problema in esame

    output = sortStruct(input,'vassoi','descend');
    output.altezzaColonna = altezzaColonna;
    output.numeroColonne = estimateColumn(output);
    output.priorityRule = priorityRule;
end