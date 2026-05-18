function maxLimit = computeLastValueByRamdds(alpha)
    maxLimit = -1 + floor(((ResidualMemoryWorkspace*2^27)/alpha)^(1/(alpha)));
end