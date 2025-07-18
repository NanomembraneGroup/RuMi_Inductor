function Bz_avg = average_magnetic_field_on_line(r, theta, z_min, z_max, R, t, h, nR, nH, nz)
    grid_size = 12;  
    % Discretize the line segment along the z-direction
    z_values = linspace(z_min, z_max, nz); % Discrete z values, nz is the number of points along the z-direction
    
    % Initialize the total Bz component
    Bz_total = 0;

    % Iterate through each point along the line in the z-direction and call the Bz computation function
    for z = z_values
        % Call the previously defined Bz computation function to get the z-component of the magnetic field at this point
        Bz_at_z = magnetic_field_z(r - R / grid_size, theta, z, R, t, h, nR, nH);
        
        % Add the magnetic field component at this point to the total
        Bz_total = Bz_total + Bz_at_z;
    end

    % Calculate the average Bz
    Bz_avg = Bz_total / nz; % nz is the number of discrete points along the z-direction
end
