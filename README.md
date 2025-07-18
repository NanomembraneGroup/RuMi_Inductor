# RuMi Inductor Related Calculations

This is the official repository for the paper:  
**Ultrahigh inductance density in CMOS-compatible magnetically integrated 3D microinductors for radio-frequency applications**

# Overview

The complete calculation code and all calculation files required to reproduce the results presented in **Figure. 1b & 1c** are available in the uploaded folder. The package utilizes a simple class structure to enhance usability while also allowing easy extension of the package for developers. The source code can be executed and produce results on any major operating system with a compatible version of MATLAB installed.

# Documentation

The code files used for the calculations are divided into two parts: **Inductance calculations** and **Magnetic field calculations**. To maintain code organization, the main functions are defined in separate MATLAB files, and their physical significance and functionality are explained in the **Readme_L_Cal.md**, **Readme_magnetic_field_z.md**, and **Readme_Zp_t.md** files.

Finally, all the defined functions are referenced in the main program **corecode.m**, which generates the results shown in **Figure. 1b &1c** of the main text. For detailed calculation principles, please refer to **Supplementary Note 1 & 2**.

# System Requirements

## Hardware requirements

**Processor**: Any Intel or AMD x86-64 processor (4 cores or more recommended)

**RAM**: Minimum 4 GB (8 GB or more recommended)

**Disk Space**: Minimum 3.1 GB for MATLAB only, up to 32 GB for a typical installation with all toolboxes## Software requirements

## Software requirements

**Windows**：

Windows 10 (version 1809 or higher)

Windows Server 2016 (or higher)

**macOS**：

macOS Big Sur (11 or higher)

**Linux**：

Ubuntu 18.04 LTS (or higher)
 

The following package is required to run the simulation:

- [Matlab](https://www.mathworks.com/products/matlab.html)


# Installation Guide

MATLAB R2021a can be installed through the MathWorks installer, which provides a user-friendly graphical interface for downloading and installing MATLAB and selected toolboxes. 

No additional environment configuration is required after installation. All necessary dependencies, including the Java Runtime Environment and required libraries, are bundled with the software. As long as the system meets the official operating system and hardware requirements, MATLAB R2021a will run smoothly without the need for manual setup.

# Demo

## Instructions to run on data
Place all the code files in the same directory path. Then select and run the code from the "corecode" file in matlab. You can define specific parameter values in the file, such as Width (w), Height (h), Radius (R), Relative Permeability (μ_r), Thickness (T), and Number of Turns (turns).

```
w = 15e-6;
h = 380e-9;
R = 120e-6;
mu_r = 25;
T = 1;
```

## Expected output
Running the code will directly generate the curve corresponding to Fig. 1b in the manuscript, along with the Excel data. You can modify the path '/fig1b.xlsx' to save the results to a specific location.

```
% Save the plot
saveas(gcf, '/fig1b.png');  % Save the figure as a PNG file

% Prepare data for Excel output
output_data = table(n_values', L3_values', M3_values', L4_values', M4_values', ...
    L5_values', M5_values', L6_values', M6_values', 'VariableNames', ...
    {'Turn Number', 'L3', 'M3', 'L4', 'M4', 'L5', 'M5', 'L6', 'M6'});

% Save to Excel file
filename = '/fig1b.xlsx';
writetable(output_data, filename);

disp(['Results saved']);
```

## Expected run time for demo on a "normal" desktop computer
Typically, the runtime for the corecode is about 5-10 seconds based on pre-calculated magnetic field data. You can also check the accuracy of the magnetic field data by running Bz_avg to obtain results. Generally, running with 20 cores on a Windows Server will take around 4-5 hours for the calculation.

# License

MATLAB R2021a is installed using the Fudan University educational software license.

# Cite

We would appreciate it if you cite the following paper in your publications if you find this code useful.

# Patent

The device architecture is patented (CN118571598A). Please contact the authors for more information.
