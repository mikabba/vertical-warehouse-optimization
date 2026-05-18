function [output] = postProcessing(input)
%POSTPROCESSING Summary of this function goes here
%   Detailed explanation goes here
    work = input;
    L = 1;
    combinazioneVassoiVuoti =zeros(size(input.numeroVassoi));
    spazioOccupatoVassoiVuoti = zeros(1,input.numeroColonne);
    
    for hCf = work.spazioLiberoColonna
        if hCf >= work.altezzaColonna
            %% Correzione sovrastima colonna
            work.numeroColonne = work.numeroColonne - 1;
            work.magazzino(:,L) = [];
            work.spazioLiberoColonna(:,L) = [];
            work.spazioOccupatoColonnaVassoiPieni(:,L) = [];
            L = L - 1;
        elseif hCf >= min(work.vassoi)
            %% Risoluzione matematica spazio almeno maggiore del vassoio più piccolo
            while(hCf >= min(work.vassoi))
                [spazioOccupatoVassoiVuoti(:,L), combinazioneVassoiVuoti(:,L)] =...
                    optimizationNewTray(work,hCf,work.magazzino(:,L));
                work.magazzino(:,L) = work.magazzino(:,L) + combinazioneVassoiVuoti(:,L);
                work.spazioOccupatoColonna(:,L) = work.spazioOccupatoColonnaVassoiPieni(:,L) + spazioOccupatoVassoiVuoti(:,L);
                work.spazioLiberoColonna(:,L) = work.altezzaColonna - work.spazioOccupatoColonna(:,L);
                hCf = work.spazioLiberoColonna(:,L);
            end
        else
            work.spazioOccupatoColonna(:,L) = work.spazioOccupatoColonnaVassoiPieni(:,L);
            work.spazioLiberoColonna(:,L) = hCf;
        end
        L = L + 1;
    end
    output = work;
    output.vassoiVuoti = combinazioneVassoiVuoti;
    output.spazioOccupatoVassoiVuoti = spazioOccupatoVassoiVuoti;

end

