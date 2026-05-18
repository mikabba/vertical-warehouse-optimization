function [output] = graphFunction(input,folderResult)
output = input;
bool = 1;
for i = 2:numel(output)
    if output(i).numeroColonne ~= output(1).numeroColonne
        bool = 0;
        break;
    end
end
        
if ~exist(folderResult+"imageGraph/", 'dir')
       mkdir(folderResult+"imageGraph/")
end
%% Istogramma generale
set(0,'DefaultFigureVisible','off')
if bool
    
    for i = 1:numel(input)
        x{i} = char(input(i).priorityRule);
        y(i,:) = [output(i).spazioOccupatoPercentualeVassoiPieni ...
                  output(i).spazioLiberoPercentualeVassoiPieni];
        ystar(i,:) = [output(i).spazioOccupatoPercentualeVassoiVuoti ...
                  output(i).spazioLiberoPercentualeVassoiVuoti];
        frft(i,:) = output(i).fillRatioEachColumnFilledTray(:);
        fret(i,:) = output(i).fillRatioEachColumnEmptyTray(:);
    end
    
    f1 = figure(1);
    X = categorical(x);
    subplot(2,1,1);
    h = bar(X,y,'stacked');
    title("Gestione dello spazio del magazzino senza i vassoi vuoti");
    legend('Spazio occupato','Spazio libero','Location','northeastoutside');
    xlabel('Priority rules');
    ylabel('Fill ratio');
    subplot(2,1,2);
    h1 = bar(X,ystar,'stacked');
    title("Gestione dello spazio del magazzino con i vassoi vuoti");
    legend('Spazio occupato','Spazio libero','Location','northeastoutside');
    xlabel('Priority rules');
    ylabel('Fill ratio');
    set(gcf, 'Position', get(0, 'Screensize'));
    f1.Visible = 0;
    
    
    for i = 1:output(1).numeroColonne
        legendColonne{i} = char("Colonna " + i);
    end
    f2 = figure(2);
    subplot(1,2,1);
    h = bar3(frft,0.5);
    [rh,ch] = size(h);
    for i = 1: ch
        h(i).FaceAlpha = 0.4;
    end
    set(gcf,'renderer','Painters')
    set(gca, 'YAxisLocation', 'Right')
    title("Spazio occupato percentuale senza i vassoi vuoti")
    xlabel('Colonne');
    ylabel('Priority Rules');
    zlabel('Percentuale altezza');
    legend(legendColonne)
    set(gca,'yticklabel',x);
    set(gcf, 'Position', get(0, 'Screensize'));
    
    
    subplot(1,2,2);
    h1 = bar3(fret,0.5);
    [rh,ch] = size(h1);
    for i = 1: ch
        h1(i).FaceAlpha = 0.4;
    end
    set(gcf,'renderer','Painters')
    set(gca, 'YAxisLocation', 'Right')
    title("Spazio occupato percentuale con i vassoi vuoti ")
    xlabel('Colonne');
    ylabel('Priority Rules');
    zlabel('Percentuale altezza');
    legend(legendColonne)
    set(gca,'yticklabel',x);
    set(gcf, 'Position', get(0, 'Screensize'));
    f2.Visible = 0;
    nameFillRatioPriorityRules = "FRPR-"...
                                +strjoin(string(transpose(output(1).vassoi)),'-')+"-"...
                                +strjoin(string(transpose(output(1).numeroVassoi)),'-');
    FillRatioEmptyFilled = "FREmptF-"...
                                +strjoin(string(transpose(output(1).vassoi)),'-')+"-"...
                                +strjoin(string(transpose(output(1).numeroVassoi)),'-');
    print('-f1','-depsc2',folderResult+"imageGraph/"+nameFillRatioPriorityRules+".eps");
    print('-f2','-depsc2',folderResult+"imageGraph/"+FillRatioEmptyFilled+".eps");
    print('-f1','-djpeg',folderResult+"imageGraph/"+nameFillRatioPriorityRules+".jpeg");
    print('-f2','-djpeg',folderResult+"imageGraph/"+FillRatioEmptyFilled+".jpeg");
    
else

    for i = 1:numel(input)
        x{i} = char(input(i).priorityRule);
        y(i) = output(i).numeroColonne;
    end
    f6 = figure(1);
    X = categorical(x);
    h = bar(X,y);
    title("Numero colonne al variare delle Priority Rules");
    xlabel('Priority Rules');
    ylabel('Colonne');

    colonnePriorityRulesVar = "VariazioneColonnePriorityRules-"...
                                +strjoin(string(transpose(output(1).vassoi)),'-')+"-"...
                                +strjoin(string(transpose(output(1).numeroVassoi)),'-') ...
                                + "-"+string(output(1).altezzaColonna);
    print('-f6','-depsc2',folderResult+"imageGraph/"+colonnePriorityRulesVar+".eps");
    print('-f6','-djpeg',folderResult+"imageGraph/"+colonnePriorityRulesVar+".jpeg");
end

for i = 1:numel(input)
    priorityRul{i} = char(input(i).priorityRule);
    col(i) = output(i).numeroColonne;
end
maxCol = max(col);
for i = 1:numel(input)
    if numel(output(i).fillRatioEachColumnFilledTray) < maxCol
        output(i).fillRatioEachColumnFilledTray(end+1) = 0;
    end

    if numel(output(i).fillRatioEachColumnEmptyTray) < maxCol
        output(i).fillRatioEachColumnEmptyTray(end+1) = 0;
    end
    z(i,:) = output(i).fillRatioEachColumnFilledTray;
    ze(i,:) = output(i).fillRatioEachColumnEmptyTray;
end
y = 1:1:maxCol;
f3 = figure(3);
[rz,cz] = size(z);
[rze,cze] = size(ze);

heatmapPlot = heatmap(y,priorityRul,z,'ColorLimits',[0 100]);

heatMapVar = "ColRulesFR-"...
                                +strjoin(string(transpose(output(1).vassoi)),'-')+"-"...
                                +strjoin(string(transpose(output(1).numeroVassoi)),'-') ...
                                + "-"+string(output(1).altezzaColonna);
heatmapPlot.Title = "Fill Ratio per colonna e priority rule senza vassoi vuoti";
heatmapPlot.YLabel = "Priority Rules";
heatmapPlot.XLabel = "Colonne";
if cze == cz
    f9 = figure(9);
    heatMapVarE = "EColRulesFR-"...
                                +strjoin(string(transpose(output(1).vassoi)),'-')+"-"...
                                +strjoin(string(transpose(output(1).numeroVassoi)));
    heatmapPlotE = heatmap(y,priorityRul,ze,'ColorLimits',[0 100]);
    
    heatmapPlotE.Title = "Fill Ratio per colonna e priority rule con vassoi vuoti";
    heatmapPlotE.YLabel = "Priority Rules";
    heatmapPlotE.XLabel = "Colonne";
    print('-f9','-deps2',folderResult+"imageGraph/"+heatMapVarE+".eps");
    print('-f9','-djpeg',folderResult+"imageGraph/"+heatMapVarE+".jpeg");
end
print('-f3','-deps2',folderResult+"imageGraph/"+heatMapVar+".eps");
print('-f3','-djpeg',folderResult+"imageGraph/"+heatMapVar+".jpeg");




end

