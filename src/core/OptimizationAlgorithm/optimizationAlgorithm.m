function output = optimizationAlgorithm(input,spazioDiPresa,altezzaColonna,priorityRule)
    
    startOpt = datetime('now','Format','yyyy-MM-dd HH:mm:ss.SSS');
    %% Pre-processing
    input.tipologieVassoi = input.vassoi;
    input.vassoi = input.vassoi + spazioDiPresa;
    input = preProcessing(input, altezzaColonna, priorityRule);
    %% Processing
    output = processing(input);
    %% Post-processing
    output = postProcessing(output);
    %% Result-processing
    output.startOpt = startOpt;
    output = resultProcessing(output);
    output.spazioDiPresa = spazioDiPresa;
end

