clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 3000;
end
input(1).numeroVassoi = 12;
input(2).numeroVassoi = 12;
input(3).numeroVassoi = [6;6];
input(4).numeroVassoi = [4;4;4];
input(5).numeroVassoi = [6;6];
input(6).numeroVassoi = [6;6];
input(7).numeroVassoi = [4;4;4];

save('piccoloScenarioOmogeneo3000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 3000;
end
input(1).numeroVassoi = 24;
input(2).numeroVassoi = 24;
input(3).numeroVassoi = [12;12];
input(4).numeroVassoi = [8;8;8];
input(5).numeroVassoi = [12;12];
input(6).numeroVassoi = [12;12];
input(7).numeroVassoi = [8;8;8];

save('medioScenarioOmogeneo3000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 3000;
end
input(1).numeroVassoi = 48;
input(2).numeroVassoi = 48;
input(3).numeroVassoi = [24;24];
input(4).numeroVassoi = [16;16;16];
input(5).numeroVassoi = [24;24];
input(6).numeroVassoi = [24;24];
input(7).numeroVassoi = [16;16;16];

save('grandeScenarioOmogeneo3000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 3000;
end
input(1).numeroVassoi = 12;
input(2).numeroVassoi = 12;
input(3).numeroVassoi = [7;5];
input(4).numeroVassoi = [6;4;2];
input(5).numeroVassoi = [7;5];
input(6).numeroVassoi = [7;5];
input(7).numeroVassoi = [6;4;2];

save('piccoloScenarioEterogeneo3000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 3000;
end
input(1).numeroVassoi = 24;
input(2).numeroVassoi = 24;
input(3).numeroVassoi = [14;10];
input(4).numeroVassoi = [12;8;4];
input(5).numeroVassoi = [14;10];
input(6).numeroVassoi = [14;10];
input(7).numeroVassoi = [12;8;4];

save('medioScenarioEterogeneo3000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 3000;
end
input(1).numeroVassoi = 48;
input(2).numeroVassoi = 48;
input(3).numeroVassoi = [28;20];
input(4).numeroVassoi = [24;16;8];
input(5).numeroVassoi = [28;20];
input(6).numeroVassoi = [28;20];
input(7).numeroVassoi = [24;16;8];

save('grandeScenarioEterogeneo3000.mat',"input")
%%
clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 9000;
end
input(1).numeroVassoi = 12;
input(2).numeroVassoi = 12;
input(3).numeroVassoi = [6;6];
input(4).numeroVassoi = [4;4;4];
input(5).numeroVassoi = [6;6];
input(6).numeroVassoi = [6;6];
input(7).numeroVassoi = [4;4;4];

save('piccoloScenarioOmogeneo9000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 9000;
end
input(1).numeroVassoi = 24;
input(2).numeroVassoi = 24;
input(3).numeroVassoi = [12;12];
input(4).numeroVassoi = [8;8;8];
input(5).numeroVassoi = [12;12];
input(6).numeroVassoi = [12;12];
input(7).numeroVassoi = [8;8;8];

save('medioScenarioOmogeneo9000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 9000;
end
input(1).numeroVassoi = 48;
input(2).numeroVassoi = 48;
input(3).numeroVassoi = [24;24];
input(4).numeroVassoi = [16;16;16];
input(5).numeroVassoi = [24;24];
input(6).numeroVassoi = [24;24];
input(7).numeroVassoi = [16;16;16];

save('grandeScenarioOmogeneo9000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 9000;
end
input(1).numeroVassoi = 12;
input(2).numeroVassoi = 12;
input(3).numeroVassoi = [7;5];
input(4).numeroVassoi = [6;4;2];
input(5).numeroVassoi = [7;5];
input(6).numeroVassoi = [7;5];
input(7).numeroVassoi = [6;4;2];

save('piccoloScenarioEterogeneo9000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 9000;
end
input(1).numeroVassoi = 24;
input(2).numeroVassoi = 24;
input(3).numeroVassoi = [14;10];
input(4).numeroVassoi = [12;8;4];
input(5).numeroVassoi = [14;10];
input(6).numeroVassoi = [14;10];
input(7).numeroVassoi = [12;8;4];

save('medioScenarioEterogeneo9000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 9000;
end
input(1).numeroVassoi = 48;
input(2).numeroVassoi = 48;
input(3).numeroVassoi = [28;20];
input(4).numeroVassoi = [24;16;8];
input(5).numeroVassoi = [28;20];
input(6).numeroVassoi = [28;20];
input(7).numeroVassoi = [24;16;8];

save('grandeScenarioEterogeneo9000.mat',"input")
%%
clear
clc
load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 15000;
end
input(1).numeroVassoi = 12;
input(2).numeroVassoi = 12;
input(3).numeroVassoi = [6;6];
input(4).numeroVassoi = [4;4;4];
input(5).numeroVassoi = [6;6];
input(6).numeroVassoi = [6;6];
input(7).numeroVassoi = [4;4;4];

save('piccoloScenarioOmogeneo15000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 15000;
end
input(1).numeroVassoi = 24;
input(2).numeroVassoi = 24;
input(3).numeroVassoi = [12;12];
input(4).numeroVassoi = [8;8;8];
input(5).numeroVassoi = [12;12];
input(6).numeroVassoi = [12;12];
input(7).numeroVassoi = [8;8;8];

save('medioScenarioOmogeneo15000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 15000;
end
input(1).numeroVassoi = 48;
input(2).numeroVassoi = 48;
input(3).numeroVassoi = [24;24];
input(4).numeroVassoi = [16;16;16];
input(5).numeroVassoi = [24;24];
input(6).numeroVassoi = [24;24];
input(7).numeroVassoi = [16;16;16];

save('grandeScenarioOmogeneo15000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 15000;
end
input(1).numeroVassoi = 12;
input(2).numeroVassoi = 12;
input(3).numeroVassoi = [7;5];
input(4).numeroVassoi = [6;4;2];
input(5).numeroVassoi = [7;5];
input(6).numeroVassoi = [7;5];
input(7).numeroVassoi = [6;4;2];

save('piccoloScenarioEterogeneo15000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 15000;
end
input(1).numeroVassoi = 24;
input(2).numeroVassoi = 24;
input(3).numeroVassoi = [14;10];
input(4).numeroVassoi = [12;8;4];
input(5).numeroVassoi = [14;10];
input(6).numeroVassoi = [14;10];
input(7).numeroVassoi = [12;8;4];

save('medioScenarioEterogeneo15000.mat',"input")

clear
clc

load('dataSetMichele.mat')
dataSet = removeZeroFromDataSet(dataSet);
for i = 1:7
    input(i).vassoi = dataSet{i};
    input(i).altezzaColonna = 15000;
end
input(1).numeroVassoi = 48;
input(2).numeroVassoi = 48;
input(3).numeroVassoi = [28;20];
input(4).numeroVassoi = [24;16;8];
input(5).numeroVassoi = [28;20];
input(6).numeroVassoi = [28;20];
input(7).numeroVassoi = [24;16;8];

save('grandeScenarioEterogeneo15000.mat',"input")