% Parameter settings
w = 15e-6;
h = 380e-9;
R = 120e-6;

num_points = 15;  % The range of k and j is 1 to 15
nPairs = num_points * (num_points + 1) / 2;  % Total number of (k, j) pairs in the upper triangle

% Construct a list of (k, j) index pairs (upper triangular part only, ensuring k <= j)
indexList = zeros(nPairs, 2);
count = 0;
for k = 1:num_points
    for j = k:num_points
        count = count + 1;
        indexList(count, :) = [k, j];
    end
end

% Preallocate arrays to store computation results
result1 = zeros(nPairs, 1);
result2 = zeros(nPairs, 1);

% Use a single parfor loop to parallelize the computation over all (k, j) pairs
parfor idx = 1:nPairs
    k = indexList(idx, 1);
    j = indexList(idx, 2);
    
    % Compute Bz_avg_1
    z_coord     = R + (k - 1) * 2 * h;
    other_coord = R + (j - 1) * 2 * h;
    result1(idx) = average_magnetic_field_Z_range(...
                        z_coord, -w/2, w/2, other_coord, h, w, 50, 50);
                    
    % Compute Bz_avg_2
    x_coord     = R - (k - j) * 2 * h;
    result2(idx) = average_magnetic_field_on_line(...
                        x_coord, 0, -w/2, w/2, other_coord, h, w, 50, 50, 50);
end

% Reconstruct full symmetric matrices
Bz_avg_1_temp = zeros(num_points, num_points);
Bz_avg_2_temp = zeros(num_points, num_points);
count = 0;
for k = 1:num_points
    for j = k:num_points
        count = count + 1;
        Bz_avg_1_temp(k, j) = result1(count);
        Bz_avg_2_temp(k, j) = result2(count);
        if k ~= j
            % Fill symmetric entries using symmetry
            Bz_avg_1_temp(j, k) = result1(count);
            Bz_avg_2_temp(j, k) = result2(count);
        end
    end
end

% Store results in two 3D arrays (currently only 1 layer in the 3rd dimension, but extendable)
Bz_avg1_3D = zeros(num_points, num_points, 1);
Bz_avg2_3D = zeros(num_points, num_points, 1);
Bz_avg1_3D(:, :, 1) = Bz_avg_1_temp;
Bz_avg2_3D(:, :, 1) = Bz_avg_2_temp;
