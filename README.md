# Vertical Warehouse Optimization

MATLAB project for optimizing tray allocation in Vertical Lift Modules (VLMs), with the goal of reducing wasted space, maximizing column fill ratio and comparing different allocation priority rules.

The project models the storage of trays with different heights inside fixed-height warehouse columns. It evaluates how different priority criteria affect the final storage configuration, the number of columns used, the remaining free space and the execution time.

---

## Overview

Vertical Lift Modules are automated storage systems that exploit vertical space to reduce floor usage and improve material handling efficiency.

This project focuses on the optimization of tray allocation inside vertical warehouse columns. Given a set of tray types, tray quantities and column-height constraints, the algorithm determines how trays should be assigned to columns while minimizing unused space.

The case study is inspired by ICAM SILO² vertical warehouse configurations.

---

## Problem statement

The input of the problem is a set of trays characterized by:

- tray height;
- tray quantity;
- number of tray types;
- fixed column height;
- handling clearance between trays.

The objective is to allocate full trays into fixed-height columns and then use empty trays to reduce the remaining free space.

The main goals are:

- maximize the occupied space in each column;
- minimize the unused vertical space;
- reduce the number of required columns;
- compare different priority rules;
- evaluate fill ratio, execution time and number of columns used.

---

## Methodology

The algorithm is organized into three main phases:

1. **Pre-processing**  
   Input data are prepared, the number of required columns is estimated and the selected priority rule is applied.

2. **Processing**  
   Full trays are allocated into columns according to the selected priority rule and the optimization constraints.

3. **Post-processing**  
   Remaining free space is evaluated and empty trays are inserted when useful to improve the final fill ratio.

The implemented workflow follows the structure shown below.

![Algorithm workflow](assets/algorithm-workflow.png)

---

## Mathematical model

The optimization model considers integer decision variables representing the number of trays of each type assigned to a column.

The model includes:

- geometric constraints on the maximum column height;
- availability constraints on the number of trays;
- priority constraints depending on the selected rule;
- non-negativity and integrality constraints;
- additional constraints for empty-tray allocation.

The full-tray allocation maximizes the occupied vertical space, while the empty-tray allocation reduces the remaining free space.

---

## Priority rules

Several priority rules are evaluated to determine the order in which tray types are selected during allocation.

The rules represent different trade-offs between:

- giving priority to larger trays;
- giving priority to more frequent trays;
- combining tray height and quantity information;
- improving the final column fill ratio.

---

## Results

The project evaluates each configuration using:

- fill ratio;
- free space;
- number of columns;
- execution time.

The simulations compare different datasets, column heights and priority rules.

![Fill ratio by priority rule](assets/fill-ratio-priority-rules.png)

A second analysis evaluates the improvement obtained by inserting empty trays into the remaining free space.

![Fill ratio with full and empty trays](assets/fill-ratio-full-empty-trays.png)

Main observations:

- the algorithm is able to generate feasible tray allocations under column-height constraints;
- different priority rules lead to different fill-ratio and execution-time behaviours;
- the post-processing phase improves space usage by inserting empty trays where possible;
- the approach provides a structured way to compare tray allocation strategies.

---

## Repository structure

```text
vertical-warehouse-optimization/
├── assets/
│   ├── algorithm-workflow.png
│   ├── fill-ratio-priority-rules.png
│   └── fill-ratio-full-empty-trays.png
├── data/
│   └── sample/
├── docs/
│   ├── algorithm-overview.md
│   ├── mathematical-model.md
│   ├── results-summary.md
│   ├── source-code-map.md
│   └── publication-notes.md
├── results/
│   └── plots/
├── src/
│   ├── core/
│   ├── priority-rules/
│   ├── utils/
│   ├── visualization/
│   ├── evalResult.m
│   └── evalResultMain.m
├── README.md
└── .gitignore
```

---

## How to run

Open MATLAB and set the repository root as the current working directory.

Then add the source folders to the MATLAB path:

```matlab
addpath(genpath("src"));
```

Run the main evaluation script:

```matlab
src/evalResultMain.m
```

Depending on the dataset and configuration, the scripts evaluate the allocation performance and generate result plots.

---

## Requirements

The project was developed in MATLAB.

Recommended environment:

- MATLAB R2022a or newer;
- Optimization Toolbox, if required by the selected optimization functions;
- basic MATLAB plotting utilities for result visualization.

---

## Notes on publication

This repository contains a cleaned version of the MATLAB implementation prepared for portfolio and educational purposes.

Generated archives, temporary files and heavy simulation outputs are intentionally excluded from version control.

---

## Authors

- Michele Abbaticchio
- Nicolò Gentile

---

## Academic context

Project developed for the **Dynamical Systems Theory** course, MSc in Automation Engineering, Politecnico di Bari.

---

## Status

Cleaned repository version prepared for GitHub portfolio publication.
