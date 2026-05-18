function evalResult(folderResult)
%% PRE-PROCESSING

    clc
    addpath("OtherFunction\");
    addpath("PriorityRules\");
    addpath("EstimateColumn\");
    addpath("OptimizationFullTray\");
    addpath("OptimizationNewTray\");
    addpath("OptimizationAlgorithm\");
    addpath("OptimizationAlgorithm\Stages\");
    addpath("view\");
    addpath("view\GenerateHtml");
    addpath("view\OutputConsole");
    addpath("view\GraphFunction");
    addpath("dataSet\");
    addpath("dataSet\dataSetMichele\");
    %% Input parameter
    
    clc
    omogenoEterogeneoString = ["Omogeneo" "Eterogeneo"];
    %%omogenoEterogeneoString = "Omogeneo";
    scenariString = ["grandeScenario" "medioScenario" "piccoloScenario"];
    %%scenariString = ["4VassoigrandeScenario" "4VassoimedioScenario" "4VassoipiccoloScenario"];
    %%scenariString = "4VassoigrandeScenario";
    colonneString = ["3000" "9000" "15000"];
    %%colonneString = "15000";
    pathDataSet = "dataSet\dataSetMichele\";
    
%%
for col = 1:numel(colonneString)
    folderResultDue = folderResult +"/" +colonneString(col)+"colonne/";
    indexOut = 1;
    for jj = 1:numel(omogenoEterogeneoString)
        for pp = 1:numel(scenariString)
            load(char(pathDataSet + scenariString(pp) +omogenoEterogeneoString(jj)+ colonneString(col) + ".mat"));
            app = input;
            clear input;
            for i = 1:numel(app)
                input.vassoi = app(i).vassoi;
                spazioDiPresa = 25; % 25 mm spazio di presa
                input.numeroVassoi = app(i).numeroVassoi;
                altezzaColonna = app(i).altezzaColonna;
                priorityRules = 'ABCDEFGHILMNOP';
                index = 1;
                timestamp = datestr(now,'dd.mmm.yyyy.HH.MM.SS.FFF');
                startMeasMain = datetime('now');
                for priorityRule = priorityRules
                    
                    fprintf("Priority rule: %s \n", priorityRule);
                    output(index) = optimizationAlgorithm(input,spazioDiPresa,altezzaColonna,priorityRule);
                    %% Output results
                    if priorityRule == priorityRules(end)
                        [T,Tmagazzino,info] = outputConsole(output(index),timestamp,startMeasMain,1,folderResultDue);
                        generateHtml(output(index),timestamp,startMeasMain,T,Tmagazzino,info,0,1,folderResultDue);
                        graphFunction(output,folderResultDue);
                    elseif priorityRule == priorityRules(1)
                        [T,Tmagazzino,info] = outputConsole(output(index),timestamp,startMeasMain,0,folderResultDue);
                        generateHtml(output(index),timestamp,startMeasMain,T,Tmagazzino,info,1,0,folderResultDue);
                    else
                        [T,Tmagazzino,info] = outputConsole(output(index),timestamp,startMeasMain,0,folderResultDue);
                        generateHtml(output(index),timestamp,startMeasMain,T,Tmagazzino,info,0,0,folderResultDue);
                    end
                    index = index + 1;
                end
                outputGeneralGraph(indexOut,:) = output;
                indexOut = indexOut + 1;
            end
        end
        if ~exist(folderResultDue+"/workspace",'dir')
           mkdir(folderResultDue+"/workspace");
        end
        [outputGeneralGraph,rowView,outExtr] = extrapolateScenario(outputGeneralGraph);
        save(folderResult+"/"+colonneString(col)+"colonne/workspace/output"+colonneString(col)+"colonne-"+timestamp+"scenario"+omogenoEterogeneoString(jj)+".mat","outputGeneralGraph");
        for viewIndex = 1:rowView/3
            graphGeneralFunction(outExtr(viewIndex).result,folderResultDue,omogenoEterogeneoString(jj));
        end
        
        clear outputGeneralGraph;
        indexOut = 1;
    end
end
end