function result = Zp_t(mu_r, h, r1, r2, a1, a2, t)
    % Computes Zp_t based on the given integrand and integral
    syms k; % Symbolic variable for integration    
    kxs1 = k*r2;
    kys1 = k*r1;
    kxs2 = k*a2;
    kys2 = k*a1;    
    kxq = k*h;
    kyq = k*h;
    mu0 = 4*pi*1e-7;
    % Define S and Q functions
    S1 = (besselj(0, kxs1) - besselj(0, kys1)) / k;
    S2 = (besselj(0, kxs2) - besselj(0, kys2)) / k;
    Q = (2 / k^2) * (cosh(k * (kxq + kyq) / 2) - cosh(k * (kxq - kyq) / 2));
    phi_k = (mu_r - 1) / (mu_r + 1);
    lambda_t = (phi_k * (1 - exp(-2 * k * t))) / (1 - phi_k^2 * exp(-2 * k * t));

    % Define the integrand
    integrand = S1 * S2 * Q * lambda_t;

    % Compute the integral
    integral_result = int(integrand, k, 0, Inf);

    % Compute Zp_t
    result = (mu0 * pi) / (h^2 * log(r2 / r1) * log(a2 / a1)) * integral_result;
end
