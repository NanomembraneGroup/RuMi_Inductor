function Bz_avg = average_magnetic_field_on_line(r, theta, z_min, z_max, R, t, h, nR, nH, nz)
    grid_size = 12;  
    % Discretize the line segment in the z direction
    z_values = linspace(z_min, z_max, nz); % Discretized z values, nz is the number of points in the z direction
    
    % Initialize the total Bz component
    Bz_total = 0;

    % Iterate over each point on the line segment in the z direction and call the Bz computation function
    for z = z_values
        % Call the previously written Bz computation function to obtain the z-component of the magnetic field at this point
        Bz_at_z = magnetic_field_z(r-R/grid_size, theta, z, R, t, h, nR, nH);
        
        % Add the magnetic field component at this point to the total sum
        Bz_total = Bz_total + Bz_at_z;
    end

    % Compute the average Bz
    Bz_avg = Bz_total / nz; % nz is the number of discrete points in the z direction
end
