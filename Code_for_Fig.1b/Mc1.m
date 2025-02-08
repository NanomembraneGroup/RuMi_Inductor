function M = Mc1(l, r)
    mu0 = 4*pi*1e-7; % 真空磁导率
    M = (mu0/(2*pi)) * l * (log(l/r + sqrt(1 + (l/r)^2)) - sqrt(1 + (r/l)^2) + r/l);
end