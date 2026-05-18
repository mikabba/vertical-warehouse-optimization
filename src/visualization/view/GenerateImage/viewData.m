function viewData(output,nomeFinestra)
%%
    risultati = output;
    tipologieVassoi = risultati.vassoi;
    vassoiDaInserire = risultati.vassoi;
    colonne = risultati.numeroColonne;
    spazioResiduo = risultati.spazioLiberoColonna;
    vassoiVuoti = sum(risultati.vassoiVuoti,2);
    vassoiVuotiOut = sum(risultati.vassoiVuoti,2);
    vassoiPieniOut = risultati.numeroVassoi;
    vassoiTot = sum(risultati.vassoiVuoti,2) + sum(risultati.numeroVassoi,2);
    numeroVassoiPieni = risultati.numeroVassoi;
    numeroVassoiTotali = sum(risultati.vassoiVuoti,2) + sum(risultati.numeroVassoi,2);
    altezzaColonna = risultati.altezzaColonna;
    magazzino = risultati.magazzino;
    [numeroRighe,numeroColonne] = size(magazzino);
    larghezzaColonna = 50;
%%  CSS
style = "<style>";
classiPiene = strings;
classiVuote = strings;
vassoiPieniHtml = strings;
vassoiVuotiHtml = strings;
for i = 1:numel(tipologieVassoi)
     altezza = tipologieVassoi(i)*10;
     color = generateRandomColor();
     classiPiene(i) = " .tipoPieno"+i+"{ width:"+larghezzaColonna+"px; height:"+altezza+"px;background-image: linear-gradient(to bottom,"+color+",rgb(220,220,220))}";
     classiVuote(i) = ".tipoVuoto"+i+"{ width:"+larghezzaColonna+"px; height:"+altezza+"px;background-image: repeating-linear-gradient(-45deg, "+color+", "+color+" 5px, white 5px, white 10px)}";
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
%% HTML
body = "<body style='height:min-content'><b>Magazzino:</b><br>" + newline;
 body = body + newline +...
     "<div id='colonnato' class='grid-container'>";
vassoiHtml = [vassoiPieniHtml vassoiVuotiHtml];
tipologiaColonna = [];
for i = 1:colonne
    if i > 1
        body = body+ newline +"<div id='colonna"+i+"'style='background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAABZJREFUeNpi2r9//38gYGAEESAAEGAAasgJOgzOKCoAAAAASUVORK5CYII=);border-style: groove;display: flex;flex-direction: column;justify-content: flex-end;width:min-content;'>";
        body = body+ newline +"<h1>"+i+"</h1>";
    else
        body = body+ newline +"<div id='colonna"+i+"'style='background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAABZJREFUeNpi2r9//38gYGAEESAAEGAAasgJOgzOKCoAAAAASUVORK5CYII=);border-style: groove;width:min-content;display: flex;flex-direction: column;justify-content: flex-end;'>";
        body = body+ newline +"<h1>"+i+"</h1>";
    end
    %% Fill column

    for j = 1: numel(tipologieVassoi)
        tipologiaColonna(j) = magazzino(j,i);
    end
    
    while sum(tipologiaColonna) > 0
        if sum(vassoiVuoti) > 0
            index = randi([1 numel(tipologieVassoi)],1) + numel(tipologiaColonna)*randi([0 1],1);
            if index > numel(tipologiaColonna)
                if vassoiVuoti(index - numel(tipologiaColonna) ) > 0 && tipologiaColonna(index - numel(tipologiaColonna)) > 0
                    body = body + newline + vassoiHtml(index);
                    vassoiVuoti(index - numel(tipologiaColonna) ) = vassoiVuoti(index - numel(tipologiaColonna) ) - 1;
                    tipologiaColonna(index - numel(tipologiaColonna)) = tipologiaColonna(index - numel(tipologiaColonna)) - 1;
                end
            else
                if tipologiaColonna(index) > 0
                    body = body + newline + vassoiHtml(index);
                    tipologiaColonna(index) = tipologiaColonna(index) - 1;
                end
            end
        else
            index = randi([1 numel(tipologieVassoi)],1);
            if tipologiaColonna(index) > 0
                body = body + newline + vassoiHtml(index);
                tipologiaColonna(index) = tipologiaColonna(index) - 1;
            end
        end
    end
    body = body + newline + "</div>";
end
body = body + newline + "</div>"+ newline+"</body>";
%%
    close all;

    fig = uifigure('Name',nomeFinestra);
    fig.Position = [100 350 (800+40*numeroColonne) ((altezzaColonna + 5)*10)];
    fig.WindowStyle = 'modal';
    pnl = uipanel(fig);
    pnl.Position = [20 5 450 ((altezzaColonna + 5)*10)];
    h = uihtml(pnl);
    
    h.HTMLSource = "<html style='height:min-content'>"+style+body+"</html>";
    h.Position = [0 0 450 ((altezzaColonna + 5)*10) ];
    pnl2 = uipanel(fig);
    pnl2.Position = [500 5 250 + 40*numeroColonne ((altezzaColonna + 5)*10)];
    h1 = uihtml(pnl2);
    h1.Position = [0 0 250 + 40*numeroColonne ((altezzaColonna + 5)*10)];
    
    tabella = "<p><b>Magazzino:"+nomeFinestra+"</b></p><table><th>Tipo</th>";
    for i = 1:numeroColonne
        tabella = tabella + "<th><b>Col. " + i + "</b></th>"; 
    end
    tabella = tabella + "<th><b>Vassoi vuoti</b></th>";
    tabella = tabella + "<th><b>Vassoi pieni</b></th>";
    tabella = tabella + "<th><b>Vassoi Tot.</b></th>";
    for j = 1:numeroRighe
        tabella = tabella + "<tr><td><b>"+tipologieVassoi(j)+"</b></td>";
        
        for i=1:numeroColonne
            tabella = tabella + "<td style='text-align:center'>"+magazzino(j,i)+"</td>";
        end
        tabella = tabella + "<td style='text-align:center'>"+vassoiVuotiOut(j)+"</td>";
        tabella = tabella + "<td style='text-align:center'>"+vassoiPieniOut(j)+"</td>";
        tabella = tabella + "<td style='text-align:center'>"+vassoiTot(j)+"</td>";
        tabella = tabella + "</tr>";
    end
    tabella = tabella + "<tr><td><b>Res.</b></td>";
    for i = 1:numel(spazioResiduo)
        tabella = tabella + "<td style='text-align:center'>"+spazioResiduo(i)+"</td>";
    end
    tabella = tabella + "</tr>";
    tabella = tabella + "</table>";
    h1.HTMLSource = "<html><body><b>Dati:</b><br>" + ...
        "<p><b>Numero colonne:</b> " + numeroColonne + "</p>" +tabella+...
        "</body></html>";
%     exportapp(fig,"result/"+nomeFinestra+".jpg");
%     close(fig);
    html = "<html>"+style+body+"</html>";
    fileID = fopen(nomeFinestra+".html",'w');
    fprintf(fileID,html);
    fclose(fileID);
end
