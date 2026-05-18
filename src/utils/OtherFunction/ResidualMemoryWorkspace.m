function memAvailable = ResidualMemoryWorkspace
    user = memory;
    memAvailableAllArray = user.MemAvailableAllArrays*2^(-30);
    
    workspace = whos;
    somma = [];
    bool = false;
    for i = 1:numel(workspace)
        if string(workspace(i).name) == "workspace" || ...
               string(workspace(i).name) == "somma" || ...
               string(workspace(i).name) == "memAvailableAllArray" ||...
               string(workspace(i).name) == "user"  || ...
               string(workspace(i).name) == "bool"
        else
            bool = true;
            somma = workspace(i).bytes;
        end
    end
    if bool
        somma = somma * 2^(-30);
        memAvailable = memAvailableAllArray - somma;
    else
        memAvailable = memAvailableAllArray;
    end
end