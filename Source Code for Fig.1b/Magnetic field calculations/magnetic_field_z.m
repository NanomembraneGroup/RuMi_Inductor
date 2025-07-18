function Bz = magnetic_field_z(r, theta, z, R, t, h, nR, nH)
    % Define constants
    I_total = 1; % Total current, unit: Ampere
    mue0 = 4*pi*10^(-7); % Vacuum permeability, unit: N/A^2
    nL = 30; % Number of segments per current loop
    dR = t / nR; % Discretization increment in the thickness direction
    dH = h / nH; % Discretization increment in the height direction
    I_per_ring = I_total / (nH * nR); % Current in each small loop

    % Initialize the z-component of the magnetic field
    Bz = 0;

    % Integrate over each small current loop along the height direction
    for zL = -h/2 + dH : dH : h/2 - dH % Current loops from -h/2 to h/2
        % Integrate over each small ring in the thickness direction
        for rL = R : dR : (R + t)
            % Parametrize the current loop
            phi = linspace(0, 2*pi, nL); % Angle phi from 0 to 2π
            xL = rL * cos(phi); % x-coordinates of the loop
            yL = rL * sin(phi); % y-coordinates of the loop
            zL_array = zL * ones(size(xL)); % z-coordinates at plane zL

            % Store current loop points in matrix L
            L = [xL', yL', zL_array'];

            % Convert cylindrical to Cartesian coordinates
            x = r * cos(theta); % Convert (r, theta) to x
            y = r * sin(theta); % Convert (r, theta) to y

            % Compute magnetic field from the current loop at current (rL, zL)
            for i = 1:nL
                if i == nL
                    dL = L(end, :) - L(1, :); % Last segment
                    vec = (L(end, :) + L(1, :)) * 0.5; % Midpoint of the current element
                else
                    dL = L(i+1, :) - L(i, :); % i-th current element
                    vec = (L(i+1, :) + L(i, :)) * 0.5; % Midpoint of the current element
                end

                % Compute position vectors
                vecR = [x, y, z]; % Position vector of the field point
                vecd = vecR - vec; % Vector from current element midpoint to field point

                % Compute magnetic field increment using the Biot–Savart law
                dB = mue0 * I_per_ring / (4 * pi) * cross(dL', vecd') / (norm(vecd)^3); 

                % Accumulate only the z-component of the magnetic field
                Bz = Bz + dB(3);
            end
        end
    end
end
