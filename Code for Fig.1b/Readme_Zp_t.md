# Zp_t Function in MATLAB

The **`Zp_t`** function in MATLAB numerically computes an **impedance-related integral** for a magnetic system as described in **Supplementary Note 1.4**.

## **Function Breakdown**

1. **Constant Definition**  
   - Defines the **vacuum permeability** `mu0`.  

2. **Nested Functions**  
   - `S1(k)`, `S2(k)`: Compute terms involving **Bessel functions**, representing cylindrical symmetry.  
   - `Q(k)`: Defines a function based on **hyperbolic cosines**, adjusting for height (`h`).  
   - `lambda_t(k)`: Incorporates **relative permeability** (`mu_r`) and thickness (`t`).  

3. **Numerical Integration**  
   - The **integrand** is defined as a function handle using `S1`, `S2`, `Q`, and `lambda_t`.  
   - The **integral** is computed using MATLAB’s `integral` function over the range `[0, ∞]`, ensuring efficient evaluation.  

4. **Final Computation**  
   - The integral result is used to calculate **`Zp_t2`**, incorporating logarithmic factors of radii (`r1`, `r2`, `a1`, `a2`).  
