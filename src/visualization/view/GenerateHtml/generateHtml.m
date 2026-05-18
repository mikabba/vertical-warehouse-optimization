function output = generateHtml(input,nomeFinestra,startMeasurementMain,T,Tmagazzino,info,startPr,endPr,folderResult)
%%
    scala = 1/10;

    risultati = input;
    tipologieVassoi = risultati.tipologieVassoi;
    spazioDiPresa = risultati.spazioDiPresa*scala/2;
    vassoiDaInserire = risultati.tipologieVassoi;
    colonne = risultati.numeroColonne;
    spazioResiduo = risultati.spazioLiberoColonna;
    vassoiVuoti = sum(risultati.vassoiVuoti,2);
    vassoiVuotiOut = sum(risultati.vassoiVuoti,2);
    vassoiPieniOut = risultati.numeroVassoi;
    vassoiTot = sum(risultati.vassoiVuoti,2) + sum(risultati.numeroVassoi,2);
    numeroVassoiPieni = risultati.numeroVassoi;
    numeroVassoiTotali = sum(risultati.vassoiVuoti,2) + sum(risultati.numeroVassoi,2);
    altezzaColonna = risultati.altezzaColonna*scala;
    magazzino = risultati.magazzino;
    [numeroRighe,numeroColonne] = size(magazzino);
    larghezzaColonna = 50;
%%
    
%%  CSS
    style = "<style>";
    style = style +newline+".table-format{width:100%%;}td{text-align:center;}";
    classiPiene = strings;
    classiVuote = strings;
    vassoiPieniHtml = strings;
    vassoiVuotiHtml = strings;
    colori = [];
    for i = 1:numel(tipologieVassoi)
         altezza = tipologieVassoi(i)*scala;
         color = generateRandomColor();
         colori(i) = color;
         classiPiene(i) = " .tipoPieno"+i+"{ width:"+larghezzaColonna+"px; border-top:"+spazioDiPresa+"px double; border-bottom:"+spazioDiPresa+"px double; height:"+altezza+"px;background-image: linear-gradient(to bottom,"+color+",rgb(220,220,220))}";
         classiVuote(i) = ".tipoVuoto"+i+"{ width:"+larghezzaColonna+"px; border-top:"+spazioDiPresa+"px double; border-bottom:"+spazioDiPresa+"px double; height:"+altezza+"px;background-image: repeating-linear-gradient(-45deg, "+color+", "+color+" 5px, white 5px, white 10px)}";
         vassoiPieniHtml(i) = "<div class='tipoPieno"+i+"' style = ''></div>";
         vassoiVuotiHtml(i) = "<div class='tipoVuoto"+i+"' style = ''></div>";
         style = style + newline +classiPiene(i) + newline + classiVuote(i);
    end
    %% grid container
    style = style + newline + ".grid-container { display: grid;align-items: center;justify-content: center;grid-template-columns:";
    for i = 1:numeroColonne
        style = style + " " + 3*larghezzaColonna/2 + "px";
    end
    style = style + newline + "};";
    style = style + newline + "</style>";
    if startPr
        html = "<html>"+style;
        body = "<body style='height:min-content'>" + newline;
    else
        html = "";
        body = "";
    end
    %% HTML
    asciiCode = 65;
    code = '';
    j = 1;
    setCode = false;
    for i=1:numel(tipologieVassoi)
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

    body = body + newline +...
         "<h1>Priority rule: "+input.priorityRule+"</h1>";
    body = body + newline + "<div style='display:flex;flex-direction: row-reverse;'>";
    body = body + newline + "<div style='border-style: solid;display:flex;border-width:thin'>"; 
    body = body + newline + "<div style='margin: 0 10px 20px; display:flex;flex-direction: column;align-items: flex-end;'>"; 
    for i = 1:numel(tipologieVassoi)
        body = body + newline + "<div style='margin-top:20px;display:flex;align-items: stretch;'><p>" + VarNamesTipoVassoi(i,1) +" pieno</p> &nbsp;<div class='tipoPieno"+i+"' style='border-style: none;height:auto;'></div></div>";
    end
    body = body + newline + "<div style='margin-top:20px;display:flex;align-items: stretch;'><p>Spazio tra i vassoi</p> &nbsp;<div class='tipoPieno"+i+"' style='height:auto;background-image: none;'></div></div>";
    body = body + newline + "</div>";
    body = body + newline + "<div style='margin: 0 10px 20px;display:flex;flex-direction: column;align-items: flex-end;'>"; 
    for i = 1:numel(tipologieVassoi)
        body = body + newline + "<div style='margin-top:20px;display:flex;align-items: stretch;'><p>" + VarNamesTipoVassoi(i,1) +" vuoto</p> &nbsp;<div class='tipoVuoto"+i+"' style='border-style: none;height:auto;'></div></div>";
    end
    body = body + newline + "<div style='margin-top:20px;display:flex;align-items: stretch;'><p>Spazio vuoto nella colonna</p> &nbsp;<div class='tipoPieno"+i+"' style='height:auto;border-style: none;background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAABZJREFUeNpi2r9//38gYGAEESAAEGAAasgJOgzOKCoAAAAASUVORK5CYII=); '></div></div>";
    body = body + newline + "</div>";
    body = body + newline + "</div>";
    body = body + newline + "</div>";
    body = body + newline + "<center><h2>Magazzino</h2></center><br><center><div id='colonnato' class='grid-container' style='align-items: end;width:fit-content;border: double;padding-left:25px'>";
    
    vassoiHtml = [vassoiPieniHtml vassoiVuotiHtml];
    inseritiPieni = 0;
    
    
    for i = 1:colonne
        if i > 1
            body = body+ newline +"<div id='colonna"+i+"'style='height:"+altezzaColonna+"px;background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAABZJREFUeNpi2r9//38gYGAEESAAEGAAasgJOgzOKCoAAAAASUVORK5CYII=);border-style: groove;display: flex;flex-direction: column;justify-content: flex-end;width:min-content;'>";
        else
            body = body+ newline +"<div id='colonna"+i+"'style='height:"+altezzaColonna+"px;background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAABZJREFUeNpi2r9//38gYGAEESAAEGAAasgJOgzOKCoAAAAASUVORK5CYII=);border-style: groove;width:min-content;display: flex;flex-direction: column;justify-content: flex-end;'>";
        end
        %% Fill column
        tipologiaColonna = [];
        for j = 1: numel(tipologieVassoi)
            tipologiaColonna(j) = magazzino(j,i);
        end
        
        while sum(tipologiaColonna) > 0
            if sum(vassoiVuoti) > 0
                prob = rand;
                %% Mi permette di selezionare i vassoi vuoti
                if prob < 0.8
                    index = randi([1 numel(tipologieVassoi)],1) + numel(tipologiaColonna); 
                    incr = 1;
                    while vassoiVuoti(index - numel(tipologiaColonna) ) < 1 && numel(tipologieVassoi)-incr > 0
                        index = randi([1 numel(tipologieVassoi)-incr],1) + numel(tipologiaColonna); 
                        incr = incr + 1;
                    end
                else
                    index = randi([1 numel(tipologieVassoi)],1); 
                end

                if index > numel(tipologiaColonna)
                    %% Inserisco vuoti
                    if vassoiVuoti(index - numel(tipologiaColonna) ) > 0 && tipologiaColonna(index - numel(tipologiaColonna)) > 0
                        body = body + newline + vassoiHtml(index);
                        vassoiVuoti(index - numel(tipologiaColonna) ) = vassoiVuoti(index - numel(tipologiaColonna) ) - 1;
                        tipologiaColonna(index - numel(tipologiaColonna)) = tipologiaColonna(index - numel(tipologiaColonna)) - 1;
                    end
                else
                    %% Inserisco pieni
                    if tipologiaColonna(index) > 0
                        body = body + newline + vassoiHtml(index);
                        tipologiaColonna(index) = tipologiaColonna(index) - 1;
                        inseritiPieni = inseritiPieni + 1;
                    end
                end
            else
                index = randi([1 numel(tipologieVassoi)],1);
                %% Inserisco pieni
                if tipologiaColonna(index) > 0
                    body = body + newline + vassoiHtml(index);
                    tipologiaColonna(index) = tipologiaColonna(index) - 1;
                    inseritiPieni = inseritiPieni + 1;
                end
            end
        end
        body = body + newline + "</div>";
    end
    body = body + newline + "</center></div>";

    %% Tabelle
    
    %% Tabella data set
    body = body + newline + "<center><h2>Data set</h2></center>";
    body = body + newline + generateTableHtml(T);
    %% Tabella magazzino
    body = body + newline + "<center><h2>Risultati</h2></center>";
    body = body + newline + generateTableHtml(Tmagazzino);

    %% Info
    body = body + newline + "<ul>";
    for stringa = info
        body = body + newline +"<li>" +stringa+"</li>";
    end
    body = body + newline + "</ul>";
    %%
    if endPr
        endMeasurementMain = datetime('now');
        executionTime = sprintf("\nTempo di esecuzione totale: %s\n",string(differenceTime(startMeasurementMain,endMeasurementMain)));
        body = body + newline +"<h4>"+executionTime+"</h4>"+newline+ "</body>";
        html = html + body + "</html>";
    else
        
        html = html+body+"</html>";
    end
    if ~exist(folderResult+"/html/", 'dir')
       mkdir(folderResult+"/html/")
    end
    fileID = -1;
    while fileID == -1
        fileID = fopen(folderResult+"/html/"+nomeFinestra+".html",'a+');
    end
    fprintf(fileID,html);
    fclose(fileID);
end

