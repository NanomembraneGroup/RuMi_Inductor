# fig1b_result.m: Inductance and Mutual Inductance Calculation

**`fig1b_result.m`** calculates **inductance** (*L*) and **mutual inductance** (*M*) for a coil system with varying turns (*n*). It defines key parameters such as conductor width (*w*), thickness (*h*), coil radius (*R*), and relative permeability (*μr*).

The script precomputes total conductor lengths for different coil structures and initializes storage arrays for *L3*, *L4*, *M3*, *M4*, *L5*, *L6*, *M5*, and *M6*. A loop iterates over different turn numbers (*n*), computing:

- **L3 and M3** using functions from `L1.m` and `Mc1.m`, considering self- and mutual inductance between turns.
- **L4 and M4**, including additional magnetic effects via `L_magnetic.m` and `Zp_t.m`.
- **L5 and M5**, based on the average magnetic field (*B_z*) from `magnetic_field_z.m` within a circular coil.
- **L6 and M6**, incorporating *μr* and field contributions from adjacent layers.

Finally, the results are plotted, showing inductance and mutual inductance versus total conductor length. The script effectively models inductive properties of spiral and circular coils, accounting for geometry and magnetic effects.

## **Function Descriptions**

### **L1.m**
- Calculates inductance (*L*) for a conductor of length *l*, considering width (*a*), thickness (*b*), and a correction factor (*T*).

### **Mc1.m**
- Computes mutual inductance (*M*) between two conductors using the vacuum permeability (*μ0*) and their relative spacing (*r*).

### **L_magnetic.m**
- Calculates the inductance contribution from magnetic effects.
- Defines the vacuum permeability (*μ0*) and computes a characteristic length scale *λ* based on gap (*g*), thickness (*t_m*), and relative permeability (*μr*).
- Uses the **tanh function** to model magnetic flux distribution across width (*w*).
- Computes final inductance (*L*) using *μ0*, *μr*, *t_m*, *l*, and **tanh-term scaling**.

### **magnetic_field_z.m**
- Calculates the **z-component of the magnetic field** (*B_z*) at a given point (*r, θ, z*) generated by a current cylinder using the **Biot-Savart law**.
#### **Steps:**
1. **Initialize Constants:**  
   - Defines total current (*I*), vacuum permeability (*μ0*), and discretization steps for coil thickness (*t*) and height (*h*).

2. **Loop Over Coil Geometry:**  
   - **Divides the coil into small current loops** at different heights and thicknesses.  
   - Each loop is discretized into **30 small segments**.

3. **Compute Magnetic Field:**  
   - Converts cylindrical coordinates (*r, θ*) to Cartesian (*x, y, z*).  
   - **Uses the Biot-Savart law** to compute the contribution of each segment.  
   - **Summarizes the z-component** of the magnetic field.
