function result = Zp_t(mu_r, h, r1, r2, a1, a2, t)
    % Computes Zp_t based on the given integrand and numerical integral
    
    % Define constants
    mu0 = 4*pi*1e-7; % Permeability of free space
    
    % Define S and Q functions as nested functions
    function S1_val = S1(k)
        S1_val = (besselj(0, k*r2) - besselj(0, k*r1)) ./ k;
    end

    function S2_val = S2(k)
        S2_val = (besselj(0, k*a2) - besselj(0, k*a1)) ./ k;
    end

    function Q_val = Q(k)
        Q_val = (2 ./ k.^2) .* (cosh(k * (h + h) / 2) - cosh(k * (h - h) / 2));
    end

    function lambda_t_val = lambda_t(k)
        phi_k = (mu_r - 1) / (mu_r + 1);
        lambda_t_val = (phi_k .* (1 - exp(-2 .* k .* t))) ./ (1 - phi_k^2 .* exp(-2 .* k .* t));
    end

    % Define the integrand as a function handle
    integrand = @(k) S1(k) .* S2(k) .* Q(k) .* lambda_t(k);
    
    % Compute the numerical integral
    integral_result = integral(@(k) integrand(k), 0, 0.775e8, 'ArrayValued', true);
    
    % Compute Zp_t
    result = (mu0 * pi) / (h^2 * log(r2 / r1) * log(a2 / a1)) * integral_result;
end
