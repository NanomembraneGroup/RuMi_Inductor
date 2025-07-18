function Bz_avg_cross_section = average_magnetic_field_cross_section(r, z_fixed, R, t, w, nR, nH) 
    % Parameter description:
    % z_fixed: the fixed z-coordinate of the cross-sectional plane
    % R: radius of the current loop
    % t: thickness of the current loop
    % w: height of the current loop
    % nR: number of discrete points in the thickness direction
    % nH: number of discrete points in the height direction
    grid_size = 70;
    
    % Define the range of r and theta
    r_values = linspace(0, r , grid_size); % radial range
    theta_values = linspace(0, 2 * pi, grid_size); % angular range
    [r_grid, theta_grid] = meshgrid(r_values, theta_values); % create the meshgrid
    
    % Initialize the total magnetic field
    Bz_total = 0;
    
    % Compute the magnetic field at each grid point
    for i = 1:grid_size-1
        for j = 1:grid_size-1
            r = r_grid(i, j);
            theta = theta_grid(i, j);
            
            % Call the previous function to calculate the z-component of the magnetic field at each point
            Bz = magnetic_field_z(r, theta, z_fixed, R, t, w, nR, nH);
            
            % Accumulate the magnetic field strength
            Bz_total = Bz_total + Bz;
        end
    end
    
    % Calculate the average magnetic field strength over the cross section
    Bz_avg_cross_section = Bz_total / ((grid_size-1)^2);
end
