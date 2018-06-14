CS 235 Tensor Decompositions Code
=======

## Description

This folder contains the code for the Coupled Matrix Tensor Factorization (CMTF) and Canonical Polyadic (CP) decomposition parts of the project.

## Dependencies

The code requires 4 main dependencies. However, loading all of them at the same time will result in conflicts (as different versions of the Tensor Toolbox are required).

1. The [CMTF toolbox, v1.1](http://www.models.life.ku.dk/joda/CMTF_Toolbox)
2. The [Tensor Toolbox, v2.5](http://www.sandia.gov/~tgkolda/TensorToolbox/index-2.5.html). _Note: the CMTF toolbox will not work with newer versions of the Tensor Toolbox_
3. The [Tensor Toolbox, commit `8357b956`](https://gitlab.com/tensors/tensor_toolbox). __Required for the CORCONDIA script, but it will conflict with (2)__
4. [L-BFGS-B-C](https://github.com/stephenbeckr/L-BFGS-B-C). Required for the `cmtf_opt` function in (3).

## Data

The data is stored inside of `all_avg_2015.mat`, which includes the data tensor `X`, which corresponds to data of all the sensors in 2015, and the matrix `weather`, which contains the weather data in 2015.

The data may have to be loaded before running the following scripts.

## Scripts

There are several scripts that perform useful functions:

- `melbourne_to_tensor_rev2.ipynb`: Converts the data from the database into a format easily parsed by MATLAB.
- `benchmark_cmtf`: Measures the performance of CMTF in predicting missing values. Randomly removes 5% of the data to test it.
- `mean_predict`: Estimates missing values by computing the mean of the data at the time slice of missing data. Requires `benchmark_cmtf` to be run first.
- `specific_mean_predict`: Estimates missing values by computing the mean of the previous and next value from the sensor, given a missing value.
- `diagnostic`: Performs CORCONDIA against various rank CP decompositions of `X` to find a good rank estimation.
- `explore_cp`: Creates a exploratory view of a CP decomposition (e.g. one output by `get_best_cp`).
- `get_best_cp`: Performs the CP decomposition of rank `R` against a tensor several times and returning the best fit.
