close all
clear
clc
addpath("view\GraphFunction\")
index = 5;
timestamp = datestr(now,'dd.mmm.yyyy.HH.MM.SS');
folderResult = "result/simulazione-"+timestamp ;
mkdir(folderResult);
set(0,'DefaultFigureVisible','off')
evalResult(folderResult);


