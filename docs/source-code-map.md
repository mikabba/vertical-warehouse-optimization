# Source Code Map

This document maps the original delivered MATLAB project folder to the cleaned GitHub repository structure.

| Original folder | Repository folder | Purpose |
|---|---|---|
| `evalResult.m`, `evalResultMain.m` | `src/` | Entry-point and result-evaluation scripts |
| `EstimateColumn/` | `src/core/EstimateColumn/` | Column estimation functions |
| `OptimizationAlgorithm/` | `src/core/OptimizationAlgorithm/` | Main optimization workflow and processing stages |
| `OptimizationFullTray/` | `src/core/OptimizationFullTray/` | Full-tray allocation model and optimization functions |
| `OptimizationNewTray/` | `src/core/OptimizationNewTray/` | Empty/new-tray allocation model and optimization functions |
| `PriorityRules/` | `src/priority-rules/PriorityRules/` | Priority rules used by the allocation algorithm |
| `OtherFunction/` | `src/utils/OtherFunction/` | Utility functions used across the project |
| `view/` | `src/visualization/view/` | Output, graph and visualization scripts |
| `dataSet/` | `data/sample/dataSet/` | Sample MATLAB datasets |
| `resultimageGraph/` | `results/plots/resultimageGraph/` | Exported result plots |

The original `result/` folder contained compressed simulation archives and was not imported into the repository.
