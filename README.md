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
│   ├── core/
│   ├── priority-rules/
│   └── utils/
├── data/
│   └── sample/
├── docs/
├── results/
│   └── plots/
├── reports/
├── README.md
└── .gitignore

cd C:\Users\miche\Desktop\github_inter\vertical-warehouse-optimization

# Check repository
if (-not (Test-Path ".git")) {
    Write-Host "ERROR: questa cartella non è una repository Git." -ForegroundColor Red
    exit
}

git checkout main
git pull origin main

# Create project structure
$folders = @(
    "src",
    "src/core",
    "src/priority-rules",
    "src/utils",
    "data",
    "data/sample",
    "docs",
    "results",
    "results/plots",
    "reports"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
    New-Item -ItemType File -Force -Path "$folder\.gitkeep" | Out-Null
}

# README
@'
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
│   ├── core/
│   ├── priority-rules/
│   └── utils/
├── data/
│   └── sample/
├── docs/
├── results/
│   └── plots/
├── reports/
├── README.md
└── .gitignore
```

---

## Planned contents

### `src/core`

Core MATLAB scripts and functions for tray allocation and optimization.

### `src/priority-rules`

Implementation of the priority rules used to select tray types during the allocation process.

### `src/utils`

Utility functions for preprocessing, postprocessing, metrics and visualization.

### `data/sample`

Small sanitized sample datasets used to reproduce the workflow without exposing private or course-specific files.

### `docs`

Technical notes about the mathematical model, constraints, algorithm flow and assumptions.

### `results/plots`

Generated plots and figures showing fill ratio, execution time and comparison between priority rules.

### `reports`

Optional summarized documentation or exported project notes.

---

## Status

Repository skeleton initialized. Source code, sample data and results will be added progressively.
