function [T,Tmagazzino,info] = outputConsole(input,timestamp,startMeasurementMain,endPr,folderResult)
    %OUTPUTCONSOLE Summary of this function goes here
    %   Detailed explanation goes here
    output = input;
    asciiCode = 65;
    code = '';
    j = 1;
    setCode = false;
    for i=1:numel(output.vassoi)
        VarNamesTipoVassoi(i,1) = "Tipo " + char(asciiCode) + code;
        asciiCode = asciiCode + 1;
        if asciiCode > 90
            asciiCode = 65;
            setCode = true;
        end
        if setCode
    
            code = string(j);
            j = j + 1;
            setCode = false;
        end
    end
    VarNames = {'Altezza(mm)','N° vassoi pieni',char("Proporzionalità vassoi pieni (Perc.)"),'N° vassoi vuoti',char("Proporzionalità vassoi vuoti (Perc.)"),'Tot. vassoi'};
    T = table(input.tipologieVassoi,input.numeroVassoi,output.vassoiPieniProp,output.numeroVassoiVuotiPerTipologia,output.vassoiVuotiProp,input.numeroVassoi+sum(input.vassoiVuoti,2),'VariableNames',VarNames,'RowNames',VarNamesTipoVassoi);
    Msg = 'Data set';
    CmdWinSize = get(0, 'CommandWindowSize');
    Width      = CmdWinSize(2);
    fprintf('\n');
    fprintf(blanks(floor(Width)));
    fprintf('<strong>%s\n</strong>\n',Msg);
    disp(T)
    %% Disp magazzino
    clear VarNames
    Msg = 'Magazzino';
    CmdWinSize = get(0, 'CommandWindowSize');
    Width      = CmdWinSize(2);
    fprintf('\n');
    fprintf(blanks(floor(Width)));
    fprintf('<strong>%s\n</strong>\n',Msg);
    rowMagazzino = VarNamesTipoVassoi;
    rowMagazzino(end+1,:) = sprintf("Spazio occupato percentuale senza i vassoi vuoti");
    rowMagazzino(end+1,:) = sprintf("Spazio occupato percentuale con i vassoi vuoti");
    rowMagazzino(end+1,:) = sprintf("Spazio rimanente percentuale senza i vassoi vuoti");
    rowMagazzino(end+1,:) = sprintf("Spazio rimanente percentuale con i vassoi vuoti");
    rowMagazzino(end+1,:) = sprintf("Spazio occupato in mm senza i vassoi vuoti");
    rowMagazzino(end+1,:) = sprintf("Spazio occupato in mm con i vassoi vuoti");
    rowMagazzino(end+1,:) = sprintf("Spazio rimanente in mm senza i vassoi vuoti");
    rowMagazzino(end+1,:) = sprintf("Spazio rimanente in mm con i vassoi vuoti");
    rowMagazzino(end+1,:) = sprintf("Altezza colonna in mm");
    Tmagazzino = table('RowNames',rowMagazzino);
    output.magazzino(end+1,:) = output.fillRatioEachColumnFilledTray;
    output.magazzino(end+1,:) = output.fillRatioEachColumnEmptyTray;
    output.magazzino(end+1,:) = output.residualRatioEachColumnFilledTray;
    output.magazzino(end+1,:) = output.residualRatioEachColumnEmptyTray;
    output.magazzino(end+1,:) = output.spazioOccupatoColonnaVassoiPieni;
    output.magazzino(end+1,:) = output.altezzaColonna - output.spazioLiberoColonna;
    output.magazzino(end+1,:) = output.altezzaColonna - output.spazioOccupatoColonnaVassoiPieni;
    output.magazzino(end+1,:) = output.spazioLiberoColonna;
    output.magazzino(end+1,:) = repmat(input.altezzaColonna,1,input.numeroColonne);
    for i=1:output.numeroColonne
        VarNames{i} = convertStringsToChars("Col. "+(i));
        Tmagazzino(:,i) = table(output.magazzino(:,i));
    end
    Tmagazzino.Properties.VariableNames = VarNames;
    disp(Tmagazzino)
    info(1) = sprintf("Numero di colonne utilizzate: %s \n",string(output.numeroColonne));
    info(2) = sprintf("Numero di vassoi vuoti utilizzati: %s \n",string(sum(sum(input.vassoiVuoti,2))));
    info(3) = sprintf("Percentuale di spazio libero con i vassoi vuoti (Perc.): %s \n",string(output.spazioLiberoPercentualeVassoiVuoti));
    info(4) = sprintf("Percentuale di spazio libero senza i  vassoi vuoti (Perc.): %s \n",string(output.spazioLiberoPercentualeVassoiPieni));
    info(5) = sprintf("Percentuale di spazio occupato con i vassoi vuoti (Perc.): %s \n",string(output.spazioOccupatoPercentualeVassoiVuoti));
    info(6) = sprintf("Percentuale di spazio occupato senza i vassoi vuoti (Perc.): %s \n",string(output.spazioOccupatoPercentualeVassoiPieni));
    info(7) = sprintf("Percentuale di spazio occupato senza i vassoi vuoti (Perc.): %s \n",string(output.spazioOccupatoPercentualeVassoiPieni));
    disp(sprintf("Numero di colonne utilizzate: %s \n",string(output.numeroColonne)));
    disp(sprintf("Numero di vassoi vuoti utilizzati: %s \n",string(sum(sum(input.vassoiVuoti,2)))));
    disp(sprintf("Percentuale di spazio libero con i vassoi vuoti: %s %% \n",string(output.spazioLiberoPercentualeVassoiVuoti)));
    disp(sprintf("Percentuale di spazio libero senza i  vassoi vuoti: %s %% \n",string(output.spazioLiberoPercentualeVassoiPieni)));
    disp(sprintf("Percentuale di spazio occupato con i vassoi vuoti: %s %% \n",string(output.spazioOccupatoPercentualeVassoiVuoti)));
    disp(sprintf("Percentuale di spazio occupato senza i vassoi vuoti: %s %% \n",string(output.spazioOccupatoPercentualeVassoiPieni)));
    disp(sprintf("Tempo di esecuzione Priority Rule %s: %s\n", output.priorityRule, output.tempoDiEsecuzione));
    %%
    if ~exist(folderResult+"/log/", 'dir')
       mkdir(folderResult+"/log/")
    end
    fid = fopen(folderResult+"/log/"+timestamp+".txt",'a+');
    
    fprintf(fid, 'Priority rule %s: \n', output.priorityRule);
    fprintf(fid, "\n-----------------------------------------Data set---------------\n\n");
    result = evalc('disp(T,false)');
    fwrite(fid,result);
    fprintf(fid, "\n-----------------------------------------Magazzino---------------\n\n");
    result = evalc('disp(Tmagazzino,false)');
    fwrite(fid,result);
    fprintf(fid,"Numero di colonne utilizzate: %s \n",string(output.numeroColonne));
    fprintf(fid,"Numero di vassoi vuoti utilizzati: %s \n",string(output.numeroTotVassoiVuotiUtilizzati));
    fprintf(fid,"Percentuale di spazio libero con i vassoi vuoti: %s %% \n",string(output.spazioLiberoPercentualeVassoiVuoti));
    fprintf(fid,"Percentuale di spazio libero senza i  vassoi vuoti: %s %% \n",string(output.spazioLiberoPercentualeVassoiPieni));
    fprintf(fid,"Percentuale di spazio occupato con i vassoi vuoti: %s %% \n",string(output.spazioOccupatoPercentualeVassoiVuoti));
    fprintf(fid,"Percentuale di spazio occupato senza i vassoi vuoti: %s %% \n",string(output.spazioOccupatoPercentualeVassoiPieni));
    fwrite(fid,sprintf("Tempo di esecuzione Priority Rule %s: %s\n",output.priorityRule,output.tempoDiEsecuzione));
    if endPr
        endMeasurementMain = datetime('now');
        disp(sprintf("\nTempo di esecuzione totale: %s\n",string(differenceTime(startMeasurementMain,endMeasurementMain))));
        fwrite(fid,sprintf("\nTempo di esecuzione totale: %s\n\n",string(differenceTime(startMeasurementMain,endMeasurementMain))));
    end
    fclose(fid);
    %% Disp column
    %     VarNames = {'Tipologia Vassoi','Magazzino','Numero vassoi vuoti per tipologia','Numero vassoi pieni per tipologia','Tot. vassoi per tipologia'};
    
    %     VarNames = {'Tipologia Vassoi'};
    %     T = table(output.vassoi);
    %
    
    %
    %     disp(T)
    %     VarNames2 = {'Colonne', 'Spazio libero con vassoi pieni', 'Spazio libero con vassoi vuoti', 'Spazio libero totale con pieni','Spazio libero totale con vuoti'};
    %     T2 = table(output.numeroColonne, output.altezzaColonna - output.spazioOccupatoColonnaVassoiPieni,output.spazioLiberoColonna, sum(output.altezzaColonna - output.spazioOccupatoColonnaVassoiPieni),sum(output.spazioLiberoColonna), 'VariableNames',VarNames2);
    %     disp(T2)
end

