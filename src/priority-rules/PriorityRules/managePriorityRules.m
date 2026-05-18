function P = managePriorityRules(input)
    altezzaColonna = input.altezzaColonna;
    fields = {'altezzaColonna', ...
              'numeroColonne', ...
              'priorityRule'};
    priorityRule = input.priorityRule;
    input = rmfield(input,fields);
    switch priorityRule
        case 1
            P = priorityRuleA(input);
        case 'a'
            P = priorityRuleA(input);
        case 'A'
            P = priorityRuleA(input);
        
        case 2
            P = priorityRuleB(input);
        case 'b'
            P = priorityRuleB(input);
        case 'B'
            P = priorityRuleB(input);

        case 3
            P = priorityRuleC(input);
        case 'c'
            P = priorityRuleC(input);
        case 'C'
            P = priorityRuleC(input);

        case 4
            P = priorityRuleD(input);
        case 'd'
            P = priorityRuleD(input);
        case 'D'
            P = priorityRuleD(input);

        case 5
            P = priorityRuleE(input);
        case 'e'
            P = priorityRuleE(input);
        case 'E'
            P = priorityRuleE(input);
        
        case 6
            P = priorityRuleF(input);
        case 'f'
            P = priorityRuleF(input);
        case 'F'
            P = priorityRuleF(input);

        case 7
            P = priorityRuleG(input);
        case 'g'
            P = priorityRuleG(input);
        case 'G'
            P = priorityRuleG(input);

        case 8
            P = priorityRuleH(input);
        case 'h'
            P = priorityRuleH(input);
        case 'H'
            P = priorityRuleH(input);
        
        case 9
            P = priorityRuleI(input);
        case 'i'
            P = priorityRuleI(input);
        case 'I'
            P = priorityRuleI(input);
            
        case 10
            P = priorityRuleL(input);
        case 'l'
            P = priorityRuleL(input);
        case 'L'
            P = priorityRuleL(input);

        case 11
            P = priorityRuleM(input);
        case 'm'
            P = priorityRuleM(input);
        case 'M'
            P = priorityRuleM(input);

        case 12
            P = priorityRuleN(input, altezzaColonna);
        case 'n'
            P = priorityRuleN(input, altezzaColonna);
        case 'N'
            P = priorityRuleN(input, altezzaColonna);

        case 13
            P = priorityRuleO(input, altezzaColonna);
        case 'o'
            P = priorityRuleO(input, altezzaColonna);
        case 'O'
            P = priorityRuleO(input, altezzaColonna);

        case 14
            P = priorityRuleP(input);
        case 'p'
            P = priorityRuleP(input);
        case 'P'
            P = priorityRuleP(input);
    end
end