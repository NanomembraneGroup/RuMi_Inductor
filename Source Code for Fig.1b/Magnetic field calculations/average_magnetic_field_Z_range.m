function Bz_avg_Z_range = average_magnetic_field_Z_range(r, z_min, z_max, R, t, w, nR, nH)
    % Parameter description:
    % z_min: starting height along the Z-axis
    % z_max: ending height along the Z-axis
    % R: radius of the current loop
    % t: thickness of the current loop
    % w: height of the current loop
    % nR: number of discrete points in the thickness direction
    % nH: number of discrete points in the height direction

    nz = 10; % Number of discrete points along the Z-axis

    % Define discrete points along the Z-axis
    z_values = linspace(z_min, z_max, nz); % nz points from z_min to z_max along the Z-axis
    Bz_total = 0; % Initialize total Bz

    % Calculate each cross-section at different z-values
    for i = 1:nz
        z_fixed = z_values(i);
        
        % Compute the average magnetic field at this cross-sectional height
        Bz_avg_cross_section = average_magnetic_field_cross_section(r, z_fixed, R, t, w, nR, nH);
        
        % Accumulate the average magnetic field of each cross-section
        Bz_total = Bz_total + Bz_avg_cross_section;
    end
    
    % Calculate the average magnetic field over the specified Z-axis range
    Bz_avg_Z_range = Bz_total / nz; % Take the average of all cross-sections
end
