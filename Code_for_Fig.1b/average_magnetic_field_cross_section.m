function Bz_avg_cross_section = average_magnetic_field_cross_section(r,z_fixed, R, t, w, nR, nH)
    % 参数说明:
    % z_fixed: 横截面固定的z坐标
    % R: 电流环的半径
    % t: 电流环的厚度
    % w: 电流环的高度
    % nR: 厚度方向上的离散点数
    % nH: 高度方向上的离散点数
    grid_size = 70;
    
    % 定义r和theta的范围
    r_values = linspace(0, r , grid_size); % 半径范围
    theta_values = linspace(0, 2 * pi, grid_size); % 角度范围
    [r_grid, theta_grid] = meshgrid(r_values, theta_values); % 创建网格
    
    % 初始化磁场总和
    Bz_total = 0;
    
    % 计算每个网格点上的磁场
    for i = 1:grid_size-1
        for j = 1:grid_size-1
            r = r_grid(i, j);
            theta = theta_grid(i, j);
            
            % 调用之前的函数计算每个点的磁场z分量
            Bz = magnetic_field_z(r, theta, z_fixed, R, t, w, nR, nH);
            
            % 累加磁场强度
            Bz_total = Bz_total + Bz;
        end
    end
    
    % 计算横截面的平均磁场强度
    Bz_avg_cross_section = Bz_total / ((grid_size-1)^2);
end
