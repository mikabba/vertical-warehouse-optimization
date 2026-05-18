clear
clc
load("quattroVassoi.mat");
colonna ="";
scenario ="";
tipo ="";
for i = 1:numel(input)
    if input(i).altezzaColonna == 3000
        colonna = "3000";
    elseif input(i).altezzaColonna == 9000
        colonna = "9000";
    elseif input(i).altezzaColonna == 15000
        colonna = "15000";
    end

    if sum(input(i).numeroVassoi) == 12
        scenario = "piccoloScenario";
    elseif sum(input(i).numeroVassoi) == 24
        scenario = "medioScenario";
    elseif sum(input(i).numeroVassoi) == 48
        scenario = "grandeScenario";
    end
    if all(input(i).numeroVassoi == input(i).numeroVassoi(1))
        tipo = "Omogeneo";
    else
        tipo = "Eterogeneo";
    end
    salva = input;
    input = input(i);
    save("4Vassoi"+scenario+tipo+colonna+".mat","input","-mat");
    input = salva;
end