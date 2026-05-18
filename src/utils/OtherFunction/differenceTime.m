function [result,resultString,doubleResultSeconds,doubleResultMinute] = differenceTime(timePast,timePresent)
    result = between(timePast,timePresent);
    stringResult = strrep(string(result),'h','');
    stringResult = strrep(stringResult,'m','');
    stringResult = strrep(stringResult,'s','');
    stringResultArray = split(stringResult,' ');
    if (numel(stringResultArray) == 1)
        doubleResultSeconds = 0.001;
        doubleResultMinute = doubleResultSeconds/60;
        resultString = "0.001";
    else
        doubleResultSeconds = double(stringResultArray(1))*3600 + ...
                              double(stringResultArray(2))*60 + ...
                              double(stringResultArray(3));
        doubleResultMinute = double(stringResultArray(1))*60 + ...
                              double(stringResultArray(2)) + ...
                              double(stringResultArray(3))/60;
        resultString = string(result);
    end
end
