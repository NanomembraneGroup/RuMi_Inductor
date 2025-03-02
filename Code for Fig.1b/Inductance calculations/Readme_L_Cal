**fig1b_result.m** calculates inductance (\(L\)) and mutual inductance (\(M\)) for a coil system with varying turns (\(n\)). It defines key parameters such as conductor width (\(w\)), thickness (\(h\)), coil radius (\(R\)), and relative permeability (\(μr\)).  

The script precomputes total conductor lengths for different coil structures and initializes storage arrays for \(L3, L4, M3, M4, L5, L6, M5\) and \(M6\). A loop iterates over different turn numbers (n), computing:  
- **L3 and M3** using functions (L1, code file L1.m) and (Mc1, code file Mc1.m), considering self- and mutual inductance between turns.  
- **L4 and M4**, including additional magnetic effects via (L_magnetic, code file L_magnetic.m) and (Zp_t2, code file Zp_t2.m).  
- **L5 and M5**, based on the average magnetic field (B_z, code file magnetic_field_z.m) within a circular coil.  
- **L6 and M6**, incorporating (μr) and field contributions from adjacent layers.  

Finally, the results are plotted, showing inductance and mutual inductance versus total conductor length. The script effectively models inductive properties of spiral and circular coils, accounting for geometry and magnetic effects.



- **L1.m**: Calculates inductance (\(L\)) for a conductor of length \(l\), considering width (\(a\)), thickness (\(b\)), and a correction factor (\(T\)).  
- **Mc1**: Computes mutual inductance (\(M\)) between two conductors using the vacuum permeability (\(\μ0\)) and their relative spacing \(r\).  
These functions help calculate the self-inductance and mutual inductance.

**L_magnetic.m** calculates the inductance contribution from magnetic effects.  
-It defines the vacuum permeability (\(\μ0\)) and computes a characteristic length scale **\(\lambda\)** based on gap (\(g\)), thickness (\(tm\)), and relative permeability (\(\μr\)).  
- It uses the **tanh function** to model magnetic flux distribution across width (\(w\)).  
- The final inductance (\(L\)) is determined using **\(\μ0, \μr, tm, l,\)** and **tanh-term scaling**.  
This function helps estimate the inductance increased by the the magnetic layers.


**magnetic_field_z.m** calculates the **z-component of the magnetic field** (\(B_z\)) at a given point (\(r, \theta, z\)) genetated by a current cylinder  using the **Biot-Savart law**.  

### **Steps:**  
1. **Initialize Constants:**  
   - Defines total current (\(I\)), vacuum permeability (\(\mu_0\)), and discretization steps for coil thickness (\(t\)) and height (\(h\)).  
2. **Loop Over Coil Geometry:**  
   - **Divides the coil into small current loops** at different heights and thicknesses.  
   - Each loop is discretized into **30 small segments**.  
3. **Compute Magnetic Field:**  
   - Converts cylindrical coordinates (\(r, \theta\)) to Cartesian (\(x, y, z\)).  
   - **Uses the Biot-Savart law** to compute the contribution of each segment.  
   - **Summarizes the z-component** of the magnetic field.  

### **Application:**  
This function models the **magnetic field distribution of a solenoid or thick current loop**, useful for **electromagnetism and coil design simulations**.


