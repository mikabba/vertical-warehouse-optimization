function output = resultProcessing(input)
    work = input;
    work.numeroVassoiVuotiPerTipologia = sum(work.vassoiVuoti,2);
    work.numeroTotVassoiVuotiUtilizzati = sum(sum(work.vassoiVuoti,2));
    if(work.numeroTotVassoiVuotiUtilizzati > 0)
        work.vassoiVuotiProp = work.numeroVassoiVuotiPerTipologia./work.numeroTotVassoiVuotiUtilizzati*100;
    else
        work.vassoiVuotiProp = zeros(size(work.numeroVassoiVuotiPerTipologia));
    end
    work.vassoiPieniProp = work.numeroVassoi./sum(work.numeroVassoi)*100;
    % Percentuali
    if work.numeroTotVassoiVuotiUtilizzati > 0
        work.fillRatioEachColumnEmptyTray = (work.spazioOccupatoColonna./work.altezzaColonna)*100;
        work.residualRatioEachColumnEmptyTray = 100 - work.fillRatioEachColumnEmptyTray ;
        work.spazioOccupatoPercentualeVassoiVuoti = (sum(work.spazioOccupatoColonna,2)/...
                              (work.numeroColonne*work.altezzaColonna))*100;
        work.spazioLiberoPercentualeVassoiVuoti = 100 - work.spazioOccupatoPercentualeVassoiVuoti;
    else
        emptyCharacter = 0;
        work.fillRatioEachColumnEmptyTray = emptyCharacter;
        work.residualRatioEachColumnEmptyTray = emptyCharacter;
        work.spazioOccupatoPercentualeVassoiVuoti = emptyCharacter;
        work.spazioLiberoPercentualeVassoiVuoti = emptyCharacter;
    end
    work.fillRatioEachColumnFilledTray = (work.spazioOccupatoColonnaVassoiPieni./work.altezzaColonna)*100;
    work.residualRatioEachColumnFilledTray = 100 - work.fillRatioEachColumnFilledTray;
    work.spazioOccupatoPercentualeVassoiPieni = (sum(work.spazioOccupatoColonnaVassoiPieni,2)/...
                                       (work.numeroColonne*work.altezzaColonna))*100;
    work.spazioLiberoPercentualeVassoiPieni = 100 - work.spazioOccupatoPercentualeVassoiPieni;
    % 
    work.endOpt = datetime('now','Format','yyyy-MM-dd HH:mm:ss.SSS');
    work.numeroTotaleVassoiPieni = sum(work.numeroVassoi);
    [work.result,work.tempoDiEsecuzione,work.seconds,work.minute] = ...
                                differenceTime(work.startOpt,work.endOpt);
    
    output = work;

end

