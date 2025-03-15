# RuMi Inductor

This is the official repository for the paper:  
**Ultrahigh inductance density in CMOS-compatible magnetically integrated 3D microinductors for radio-frequency applications**

The complete calculation code and all calculation files required to reproduce the results presented in **Figure. 1b** are available in the uploaded folder.

The code files used for the calculations are divided into two parts: **Inductance calculations** and **Magnetic field calculations**. To maintain code organization, the main functions are defined in separate MATLAB files, and their physical significance and functionality are explained in the **Readme_L_Cal.md**, **Readme_magnetic_field_z.md**, and **Readme_Zp_t.md** files.

Finally, all the defined functions are referenced in the main program **corecode.m**, which generates the results shown in **Figure. 1b** of the main text. For detailed calculation principles, please refer to **Supplementary Note 1 & 2**.

## Requirements

The following package is required to run the simulation:

- [Matlab](https://www.mathworks.com/products/matlab.html)

## Cite

We would appreciate it if you cite the following paper in your publications if you find this code useful.

## Patent

The device architecture is patented (CN118571598A). Please contact the authors for more information.
