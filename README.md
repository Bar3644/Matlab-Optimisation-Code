# Optimization in MATLAB

A repository containing **MATLAB code, exercises, and exam preparation material** for an **Optimization** subject.

This project collects implementations of classical optimization methods used in engineering and applied mathematics, including **unconstrained optimization**, **constrained optimization**, **linear programming**, and **search / interpolation methods**.

---

## Overview

The repository was developed as part of coursework and exam preparation for an Optimization module. It includes MATLAB scripts for solving optimization problems analytically, numerically, and with MATLAB’s built-in optimization tools.

The material covers both theory-oriented examples and practical algorithm implementations.

---

## Repository Contents

Based on the folder structure, this repository includes work in the following areas:

### Chapter 2 – Constrained Optimization
- Lagrange multipliers for equality constraints
- Kuhn-Tucker / Karush-Kuhn-Tucker (KKT) conditions
- Mixed constrained optimization problems

### Chapter 5 – One-Dimensional Search Methods
- Dichotomous search
- Fibonacci search
- Interval halving
- Newton method for unimodal optimization
- Secant method
- Quasi-search approaches
- Accelerated step-size methods

### Chapter 6 – Multivariable Unconstrained Optimization
- Steepest descent
- Newton methods
- Quasi-Newton methods
- Rank-1 / Rank-2 updates
- DFP
- BFGS
- Fletcher-Reeves conjugate methods
- Marquardt method
- Random walk / random jump search
- Rosenbrock-based test functions

### Other Methods
- Grid search
- Exhaustive search
- Fixed step size methods
- Golden section search
- Cubic interpolation
- Quadratic interpolation
- Linear simplex methods
- Nonlinear constrained optimization using `fmincon`
- Linear constrained optimization using MATLAB toolbox methods

---

## Folder Structure

```text
Optimization-MATLAB/
│── CHP2/                             # Constrained optimization methods
│   ├── Legrange_equal.m
│   ├── Lagrange_inequality.m
│   ├── kuhn_tucker.m
│   ├── kuhn_tucker_exam.m
│
│── CHP5/                             # One-dimensional search methods
│   ├── Dico_CH5.m
│   ├── Fibonacci.m
│   ├── Interval_Halving_CH5.m
│   ├── Newton_Unimodal.m
│   ├── Secant.m
│   ├── Quasi_CH5.m
│
│── CHP6/                             # Multivariable unconstrained optimization
│   ├── Steepst_descent.m
│   ├── Newton_multi_Rosen.m
│   ├── Quasi_Newton_Rank1.m
│   ├── Quasi_Newton_Rank2.m
│   ├── DFB.m
│   ├── BFGS_comp.m
│   ├── Marquardt.m
│   ├── Fletcher_R_conjugate_comp.m
│   ├── Random_walk.m
│   ├── Random_jump_CH6.m
│
│── Linear simplex/
│   └── LINEAR_simplex.m
│
│── Linear_Constr/
│   └── TOOLBOX.m
│
│── Nonlinear_Constr/
│   ├── Constr_nonlinear.m
│   ├── objfun.m
│   └── confunceq.m
│
│── Cubic_method/
│   └── cubic_method.m
│
│── Quadratic_interpollation_method/
│   ├── quadratic_method.m
│   └── quad_obj_fun.m
│
│── Grid_search.m
│── exhaustive_search.m
│── Fixed_step_size.m
│── Golden_CH6.m
│── Kunh_tucker_solver.m
│── KhunTucker_MIXED.m
│── MUPAD_plotting_missions.m
