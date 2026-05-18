clear
clc
input.vassoi = [2;4;7;8];
input.numeroVassoi = [109;5;2;11];
work = input;
coppia = zeros(1,2);
L = 1;
hC = 20;
numColonne = 18;
magazzino = zeros(numel(input.vassoi),numColonne);
%% Formo la coppia
while sum(work.numeroVassoi) > 0
    coppia = zeros(1,2);
    [coppia(1),ia] = max(work.vassoi);
    while work.numeroVassoi(ia) <= 0
        work.vassoi(ia) = [];
        work.numeroVassoi(ia) = [];
        [coppia(1),ia] = max(work.vassoi);
    end
    workCoppia = work;
    workCoppia.vassoi(ia) = [];
    workCoppia.numeroVassoi(ia) = [];
    if ~isempty(workCoppia.vassoi)
        workCoppia = sortStruct(workCoppia,'numeroVassoi','ascend');
        set = find(workCoppia.numeroVassoi >= work.numeroVassoi(ia));
        if ~isempty(set)
            workCoppiaDue.vassoi = [];
            workCoppiaDue.numeroVassoi = [];
            for i = 1: numel(set)
                workCoppiaDue.vassoi(i) = workCoppia.vassoi(set(i));
                workCoppiaDue.numeroVassoi(i) = workCoppia.numeroVassoi(set(i));
            end
            coppia(2) = max(workCoppiaDue.vassoi);
            work.numeroVassoi(find(work.vassoi == coppia(1))) = work.numeroVassoi(find(work.vassoi == coppia(1))) - 1;
            work.numeroVassoi(find(work.vassoi == coppia(2))) = work.numeroVassoi(find(work.vassoi == coppia(2))) - 1;
        else
            work.numeroVassoi(find(work.vassoi == coppia(1))) = work.numeroVassoi(find(work.vassoi == coppia(1))) - 1;
        end
    else
        work.numeroVassoi(find(work.vassoi == coppia(1))) = work.numeroVassoi(find(work.vassoi == coppia(1))) - 1;
    end
    coppie(L,:) = coppia;
    L = L + 1;
end

    