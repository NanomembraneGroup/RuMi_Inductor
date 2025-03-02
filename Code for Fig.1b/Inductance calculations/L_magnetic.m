function L = L_magnetic(g,tm,w,mu_r,l)
mu_0 = 4*pi*10^-7; % 真空的磁导率
lambda = sqrt(g * tm * mu_r / 2);
tanh_term = tanh(w / (2*lambda));
L = (mu_0 * mu_r * tm *l / (4*w)) * (1 - (2*lambda/w) * tanh_term);
end