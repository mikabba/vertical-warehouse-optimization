function maxLimit = computeLastValueByRamddsb(alpha)
    maxLimit = -1 + floor((1/2)*((ResidualMemoryWorkspace*2^26)/alpha)^(1/(alpha)));
end