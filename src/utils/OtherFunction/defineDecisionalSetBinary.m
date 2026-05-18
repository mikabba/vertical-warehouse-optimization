function X = defineDecisionalSetBinary(input,nVarBin)
elements = {};
for i=1:nVarBin
    elements{i} = 0:1:input.spazioLiberoColonna/input.vassoi(i);
end
for j=i+1:2*length(input.vassoi)
    elements{j} = 0:1:1;
end
combinations = cell(1, numel(elements)); %set up the varargout result

try
    [combinations{:}] = ndgrid(elements{:});
    combinations = cellfun(@(x) x(:), combinations,'uniformoutput',false); %there may be a better way to do this
    X = [combinations{:}]; % NumberOfCombinations by N matrix. Each row is unique.
    X(sum(X(:,1:length(input.vassoi)).*transpose(input.vassoi),2) > input.spazioLiberoColonna, :) = [];
catch ME
    mass = [];
    for i = 1:numel(elements)
        mass(i) = max(elements{i});
    end
    for i=1:nVarBin
        if mass(i) > mean(mass)
            elements{i} = 0:1:mean(mass);
        end
    end
    try
        [combinations{:}] = ndgrid(elements{:});
        clear elements;
        combinations = cellfun(@(x) x(:), combinations,'uniformoutput',false); %there may be a better way to do this
        X = [combinations{:}]; % NumberOfCombinations by N matrix. Each row is unique.
        X(sum(X(:,1:length(input.vassoi)).*transpose(input.vassoi),2) > input.spazioLiberoColonna, :) = [];
    catch ME
        mass = [];
        for i = 1:numel(elements)
            mass(i) = max(elements{i});
        end
        for i=1:nVarBin
            if mass(i) > mean(mass)
                elements{i} = 0:1:mean(mass);
            end
        end
        try
            [combinations{:}] = ndgrid(elements{:});
            clear elements;
            combinations = cellfun(@(x) x(:), combinations,'uniformoutput',false); %there may be a better way to do this
            X = [combinations{:}]; % NumberOfCombinations by N matrix. Each row is unique.
            X(sum(X(:,1:length(input.vassoi)).*transpose(input.vassoi),2) > input.spazioLiberoColonna, :) = [];
        catch ME
            mass = [];
            for i = 1:numel(elements)
                mass(i) = max(elements{i});
            end
            for i=1:nVarBin
                elements{i} = 0:1:min(mass)/2;
            end
            try
                [combinations{:}] = ndgrid(elements{:});
                clear elements;
                combinations = cellfun(@(x) x(:), combinations,'uniformoutput',false); %there may be a better way to do this
                X = [combinations{:}]; % NumberOfCombinations by N matrix. Each row is unique.
                X(sum(X(:,1:length(input.vassoi)).*transpose(input.vassoi),2) > input.spazioLiberoColonna, :) = [];
            catch ME
                for i=1:nVarBin
                    elements{i} = 0:1:computeLastValueByRamddsb(nVarBin);
                end
                try
                    [combinations{:}] = ndgrid(elements{:});
                    clear elements;
                    combinations = cellfun(@(x) x(:), combinations,'uniformoutput',false); %there may be a better way to do this
                    X = [combinations{:}]; % NumberOfCombinations by N matrix. Each row is unique.
                    X(sum(X(:,1:length(input.vassoi)).*transpose(input.vassoi),2) > input.spazioLiberoColonna, :) = [];
                catch ME
                    disp('Errore, Out of Memory');
                    disp(ME.cause);

                end

            end
        end
    end


end