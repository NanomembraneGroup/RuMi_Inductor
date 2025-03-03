function Bz_avg_Z_range = average_magnetic_field_Z_range(r , z_min, z_max, R, t, w, nR, nH)
    % Parameter description:
    % z_min: Starting height on the Z-axis
    % z_max: Ending height on the Z-axis
    % R: Radius of the current loop
    % t: Thickness of the current loop
    % w: Height of the current loop
    % nR: Number of discretization points in the thickness direction
    % nH: Number of discretization points in the height direction
    nz = 10; % Number of discretization points in the Z-direction

    % Define discrete points in the z direction
    z_values = linspace(z_min, z_max, nz); % nz points along the Z-axis from z_min to z_max
    Bz_total = 0; % Initialize the total Bz
    
    % Compute the cross-section for each z value
    for i = 1:nz
        z_fixed = z_values(i);
        
        % Calculate the average magnetic field strength of the cross-section at this height
        Bz_avg_cross_section = average_magnetic_field_cross_section(r , z_fixed, R, t, w, nR, nH);
        
        % Accumulate the average magnetic field strength of each cross-section
        Bz_total = Bz_total + Bz_avg_cross_section;
    end
    
    % Compute the average magnetic field strength over a certain height range along the Z-axis
    Bz_avg_Z_range = Bz_total / nz; % Take the average of all cross-sections
end
