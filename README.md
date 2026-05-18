# Vertical Warehouse Optimization

MATLAB optimization project for tray allocation in Vertical Lift Modules, focused on reducing wasted space and maximizing the fill ratio of storage columns.

The project studies the allocation of full trays and empty trays inside fixed-height storage columns. Different priority rules are evaluated to compare storage efficiency, execution time and number of columns used.

---

## Project context

Vertical Lift Modules are automated storage systems designed to reduce floor space and improve material handling efficiency.

This project focuses on the mathematical modelling and algorithmic optimization of tray allocation inside vertical warehouse columns.

The case study is based on vertical warehouse configurations inspired by ICAM SILO² systems.

---

## Goals

The main goals are:

- allocate trays into fixed-height columns;
- minimize free space inside each column;
- maximize the fill ratio;
- reduce the number of required columns;
- compare different tray allocation priority rules;
- evaluate execution time and storage efficiency.

---

## Methodology

The optimization workflow is based on:

1. definition of tray types and quantities;
2. definition of column height constraints;
3. generation of feasible tray allocations;
4. application of priority rules;
5. allocation of full trays;
6. allocation of empty trays;
7. computation of performance metrics.

The main performance indicators are:

- fill ratio;
- free space;
- number of columns;
- execution time.

---

## Repository structure

```text
vertical-warehouse-optimization/
├── src/
│   ├── evalResult.m
│   ├── evalResultMain.m
│   ├── core/
│   │   ├── EstimateColumn/
│   │   ├── OptimizationAlgorithm/
│   │   ├── OptimizationFullTray/
│   │   └── OptimizationNewTray/
│   ├── priority-rules/
│   │   └── PriorityRules/
│   ├── utils/
│   │   └── OtherFunction/
│   └── visualization/
│       └── view/
├── data/
│   └── sample/
│       └── dataSet/
├── docs/
├── results/
│   └── plots/
│       └── resultimageGraph/
├── reports/
├── README.md
└── .gitignore
```

---

## Source code organization

### `src/core`

Core MATLAB functions for column estimation, tray allocation and optimization.

### `src/priority-rules`

Priority-rule implementations used to select tray types during the allocation process.

### `src/utils`

Utility functions for preprocessing, sorting, decisional-set generation, time evaluation and residual-memory estimation.

### `src/visualization`

MATLAB scripts for console output, graph generation, HTML/image visualization and result inspection.

### `data/sample`

Sample MATLAB datasets used to reproduce the workflow.

### `results/plots`

Exported result plots generated during the original project work.

---

## How to run

Open MATLAB from the repository root and add the source folders to the path:

```matlab
addpath(genpath('src'));
addpath(genpath('data/sample'));
```

Then run the available entry-point scripts in `src/`, such as:

```matlab
evalResultMain
```

or inspect the optimization functions under `src/core/OptimizationAlgorithm`.

---

## Notes

Compressed simulation archives and intermediate generated files are intentionally excluded from the repository.

The repository contains the MATLAB implementation, sample datasets and selected result plots required to document the project workflow.

---

## Status

MATLAB implementation imported from the delivered project folder. Further documentation and result summaries will be added progressively.
