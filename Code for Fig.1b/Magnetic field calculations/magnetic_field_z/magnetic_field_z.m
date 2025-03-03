function Bz = magnetic_field_z(r, theta, z, R, t, h, nR, nH)
    % Define constants
    I_total = 1; % Total current, unit: Ampere
    mue0 = 4*pi*10^(-7); % Vacuum permeability, unit: N/A^2
    nL = 30; % Number of segments per current loop
    dR = t / nR; % Discretization increment in the thickness direction
    dH = h / nH; % Discretization increment in the height direction
    I_per_ring = I_total / (nH*nR); % Current for each small loop

    % Initialize Bz component
    Bz = 0;

    % Integrate over each small current loop in the height direction
    for zL = -h/2:dH:h/2 % Current loops from -h/2 to h/2 in height
        % Integrate over each small loop in the thickness direction
        for rL = R:dR:(R+t)
            % Define current loop parameterization
            phi = linspace(0, 2*pi, nL); % Angle phi distributed from 0 to 2*pi
            xL = rL * cos(phi); % x-coordinates of the current loop
            yL = rL * sin(phi); % y-coordinates of the current loop
            zL_array = zL * ones(size(xL)); % z-coordinates of the current loop at plane zL

            % Store current loop points in matrix L
            L = [xL', yL', zL_array'];

            % Convert cylindrical coordinates to Cartesian coordinates
            x = r * cos(theta); % Convert r, theta to x
            y = r * sin(theta); % Convert r, theta to y

            % Compute the magnetic field for the current loop at the current thickness and height
            for i = 1:nL
                if i == nL
                    dL = L(end, :) - L(1, :); % Last line segment
                    vec = (L(end, :) + L(1, :)) * 0.5; % Midpoint of the current element
                else
                    dL = L(i+1, :) - L(i, :); % i-th current element
                    vec = (L(i+1, :) + L(i, :)) * 0.5; % Midpoint of the current element
                end

                % Compute position vector
                vecR = [x, y, z]; % Position vector of the point to be calculated
                vecd = vecR - vec; % Vector from the midpoint of the current element to the point

                % Compute the magnetic field increment using Biot-Savart's law
                dB = mue0 * I_per_ring / (4 * pi) * cross(dL', vecd') / (norm(vecd)^3); 

                % Retain only the z-component of the magnetic field
                Bz = Bz + dB(3);
            end
        end
    end
end
