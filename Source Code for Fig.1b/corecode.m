% Parameters
w = 15e-6;
h = 380e-9;
R = 120e-6;
mu_r = 25;
T = 1;
data = load('Bz_avg.mat');
Bz_avg1_3D = data.Bz_avg1_3D;
Bz_avg2_3D = data.Bz_avg2_3D;
% Initialize variables
n_values = 1:15; % Number of turns (n)
l_tot_1_values = 100*4 * (n_values.^2+n_values) * w; % Total length for L3, M3, L4, M4
l_tot_2_values = 100*2 * pi * R * n_values; % Total length for L5, M5, L6, M6

% Preallocate results
L3_values = zeros(size(n_values));
L4_values = zeros(size(n_values));
M3_values = zeros(size(n_values));
M4_values = zeros(size(n_values));
L5_values = zeros(size(n_values));
L6_values = zeros(size(n_values));
M5_values = zeros(size(n_values));
M6_values = zeros(size(n_values));

% Loop over n values
for idx = 1:length(n_values)
    n = n_values(idx);
    
    % Initialize L3, M3, L4, M4
    L_3 = 0; M_3 = 0;
    L_4 = 0; M_4 = 0; M_4_mag = 0;
    
      % Compute L3
    for i = 1:n
        l = 2 * i * w ;
        if i ==1
            L_3 = L_3 + 4 * L1(w, h, T, l - w) - 4 * 1e9 * Mc1(l, l-w); 
        else
            L_3 = L_3 + 3 * L1(w, h, T, l - w) + L1(w, h, T, l - 2*w) - 4 * 1e9 * Mc1(l, l-w);
        end
    end
    
    % Compute M3
    for i = 2:n
        for j = 1:i-1
            l1 = 2 * i * w;
            l2 = 2 * j * w;
            M_3 = M_3 + 1e9 * 2 * 4 * ((Mc1((l1 + l2) / 2, (i - j) * w) - Mc1((l1 - l2) / 2, (i - j) * w))-(Mc1((l1 + l2) / 2, (i + j - 1) * w) - Mc1((l1 - l2) / 2, (i + j - 1) * w)));
        end
    end
    
    % Compute L4
    for i = 1:n
        l = 2 * i * w;
        L_4 = L_4 + 4 * (L1(w, h, T, l) + 1e9 * L_magnetic(h, h, w, mu_r, l));
    end
    
    % Compute M4
    for i = 2:n
        for j = 1:i-1
            r1 = (i - 1) * w;
            r2 = i * w;
            a1 = (j - 1) * w;
            a2 = j * w;
            M_4_mag = M_4_mag + 1e9 * 2 * abs(Zp_t(mu_r, h, r1, r2, a1, a2, h));
        end
    end
    M_4 = M_3 + M_4_mag;
    
    % Store results for L3, M3, L4, M4
    L3_values(idx) = L_3;
    M3_values(idx) = M_3;
    L4_values(idx) = L_4;
    M4_values(idx) = M_4;
    
    % Initialize L5, M5, L6, M6
    L_5 = 0; M_5 = 0;
    L_6_mag = 0; M_6_mag = 0;

    % Compute L5 and M5
    for j = 1:n
        L_5 = L_5 + 1e9 * Bz_avg1_3D(j,j,1) * pi * (R + (j - 1) * 2 * h)^2;
    end
               
    for j = 2:n
        for k = 1:j-1 
            M_5 = M_5 + 2 * 1e9 * Bz_avg1_3D(j,k,1) *  pi * (R + (k - 1)*h)^2;
        end
    end
    
    % Compute L6
    for j = 1:n
        for k = 1:j
            L_6_mag = L_6_mag + 1e9 * mu_r * Bz_avg2_3D(j-k+1,j,1) * 2 * pi * (R - (k - j) * 2 * h) * h;
        end
    end
    L_6 = L_5 + L_6_mag;
    
    % Compute M6
    for j = 2:n
        for k = 1:j-1
            for m = 1:k
                M_6_mag = M_6_mag + 2*1e9 * mu_r * Bz_avg2_3D(j-m+1,j,1) * 2 * pi * (R - (m - j) * 2 * h) * h;
            end
        end
    end
    M_6 = M_5 + M_6_mag;
    
    % Store results for L5, M5, L6, M6
    L5_values(idx) = L_5;
    M5_values(idx) = M_5;
    L6_values(idx) = L_6;
    M6_values(idx) = M_6;
end

% Plot results
figure;
subplot(2, 1, 1);
plot(l_tot_1_values, L3_values, '-o', 'DisplayName', 'L3'); hold on;
plot(l_tot_1_values, L4_values, '-s', 'DisplayName', 'L4'); hold on;
plot(l_tot_1_values, M3_values, '-^', 'DisplayName', 'M3'); hold on;
plot(l_tot_1_values, M4_values, '-d', 'DisplayName', 'M4'); hold on;
xlabel('l_{tot,1} (m)');
ylabel('Inductance/Mutual (H)');
legend;
grid on;
title('L3, L4, M3, M4 vs l_{tot,1}');

subplot(2, 1, 2);
plot(l_tot_2_values, L5_values, '-o', 'DisplayName', 'L5'); hold on;
plot(l_tot_2_values, L6_values, '-s', 'DisplayName', 'L6'); hold on;
plot(l_tot_2_values, M5_values, '-^', 'DisplayName', 'M5'); hold on;
plot(l_tot_2_values, M6_values, '-d', 'DisplayName', 'M6'); hold on;
xlabel('l_{tot,2} (m)');
ylabel('Inductance/Mutual (H)');
legend;
grid on;
title('L5, L6, M5, M6 vs l_{tot,2}'); 

% Save the plot
saveas(gcf, '/fig1b.png');  % Save the figure as a PNG file

% Prepare data for Excel output
output_data = table(n_values', L3_values', M3_values', L4_values', M4_values', ...
    L5_values', M5_values', L6_values', M6_values', 'VariableNames', ...
    {'Turn Number', 'L3', 'M3', 'L4', 'M4', 'L5', 'M5', 'L6', 'M6'});

% Save to Excel file
filename = '/fig1b.xlsx';
writetable(output_data, filename);

disp(['Results saved']);