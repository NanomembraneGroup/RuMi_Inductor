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



# License

MATLAB R2021a is installed using the Fudan University educational software license.

# Cite

We would appreciate it if you cite the following paper in your publications if you find this code useful.

# Patent

The device architecture is patented (CN118571598A). Please contact the authors for more information.
