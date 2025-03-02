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

### **Function Descriptions:**  
1. **`average_magnetic_field_on_line`**  
   - Computes the **average \( B_z \) along a line segment** from `z_min` to `z_max`.  
   - Calls `magnetic_field_z` at **discretized points along the line** and averages the results.  

2. **`average_magnetic_field_cross_section`**  
   - Computes the **average \( B_z \) over a circular cross-section** at a fixed height (`z_fixed`).  
   - Uses a **grid-based approach** in cylindrical coordinates (`r, θ`).  

3. **`average_magnetic_field_Z_range`**  
   - Computes the **average \( B_z \) over a height range** (`z_min` to `z_max`).  
   - Calls `average_magnetic_field_cross_section` at multiple heights and averages the results.  

Detailed calculation process can be found in **Supplymentary Note 2.1**