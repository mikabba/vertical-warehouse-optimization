function output = graphGeneralFunction(input,folderResult,omogeneita)

work = input;

if ~exist(folderResult+"/imageGraph/", 'dir')
       mkdir(folderResult+"/imageGraph/")
end
% work = numero dataset
[nDS,nPr] = size(work);
M = [];
numeroVassoiTot = [] ;
for i = 1: nDS
    numeroVassoiTot(i) = work(i,1).numeroTotaleVassoiPieni;
    for j = 1:nPr
       legendPriorityRule{j} = char("Priority rule " + char(work(1,j).priorityRule));
       priorityRule{j} = char(work(1,j).priorityRule);
       M(i,j) = work(i,j).seconds(1);
    end
end
f = figure(8);
h = bar3(M);

for i=1:nPr
    h(i).FaceAlpha = 0.4; 
end    
set(gcf, 'Position', get(0, 'Screensize'));
set(gcf,'renderer','Painters')
set(gca, 'YAxisLocation', 'Right')
set(gca,'yticklabel',numeroVassoiTot);
set(gca,'xticklabel',priorityRule);
xlabel('Priority Rules');
ylabel('Numero Vassoi Totali');
zlabel('Tempo di esecuzione (sec)');
title("Numero vassoi per tipologia " + omogeneita);
legend(legendPriorityRule)
%print -djpeg -painters result/filename.jpeg
print('-f8','-depsc2', folderResult+"/imageGraph/exTimeDS-"+strjoin(string(transpose(work(1).vassoi)),'-')+omogeneita+".eps");
print('-f8','-djpeg', folderResult+"/imageGraph/exTimeDS-"+strjoin(string(transpose(work(1).vassoi)),'-')+omogeneita+".jpeg");


end

