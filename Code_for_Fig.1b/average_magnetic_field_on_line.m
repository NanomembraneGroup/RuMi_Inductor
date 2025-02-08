function Bz_avg = average_magnetic_field_on_line(r, theta, z_min, z_max, R, t, h, nR, nH, nz)
    grid_size = 12;  
    % 离散化 z 方向的线段
    z_values = linspace(z_min, z_max, nz); % 离散 z 值，nz 是 z 方向上的点数
    
    % 初始化 Bz 分量总和
    Bz_total = 0;

    % 遍历 z 方向的线段上的每个点，调用 Bz 计算函数
    for z = z_values
        % 调用之前写好的 Bz 计算函数，获取该点的磁场 z 分量
        Bz_at_z = magnetic_field_z(r-R/grid_size, theta, z, R, t, h, nR, nH);
        
        % 将该点的磁场分量加入总和
        Bz_total = Bz_total + Bz_at_z;
    end

    % 计算平均 Bz
    Bz_avg = Bz_total / nz; % nz 是 z 方向的离散点数
end
