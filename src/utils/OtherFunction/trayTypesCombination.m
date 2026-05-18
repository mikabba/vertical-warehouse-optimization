function [all,numberCombination] = trayTypesCombination(arrayTrayTypes)

    numel(arrayTrayTypes)
    b = binaryCombination(numel(arrayTrayTypes));
    [row,c] = size(b);
    all = [];
    for i = 1:row
        all(i,:) = arrayTrayTypes.*b(i,:);
    end

end

