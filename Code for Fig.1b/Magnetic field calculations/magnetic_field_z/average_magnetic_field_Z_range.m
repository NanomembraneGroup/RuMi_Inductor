function Bz_avg_Z_range = average_magnetic_field_Z_range(r , z_min, z_max, R, t, w, nR, nH)
    % 参数说明:
    % z_min: Z轴上的起始高度
    % z_max: Z轴上的结束高度
    % R: 电流环的半径
    % t: 电流环的厚度
    % w: 电流环的高度
    % nR: 厚度方向上的离散点数
    % nH: 高度方向上的离散点数
    nz = 10; %Z方向的离散点数

    % 定义z方向的离散点
    z_values = linspace(z_min, z_max, nz); % 在Z轴上从z_min到z_max的nz个点
    Bz_total = 0; % 初始化Bz总和
    
    % 对每个z值的横截面进行计算
    for i = 1:nz
        z_fixed = z_values(i);
        
        % 计算该高度的横截面的平均磁场强度
        Bz_avg_cross_section = average_magnetic_field_cross_section(r , z_fixed, R, t, w, nR, nH);
        
        % 累加每个横截面的平均磁场强度
        Bz_total = Bz_total + Bz_avg_cross_section;
    end
    
    % 计算Z轴某段高度的平均磁场强度
    Bz_avg_Z_range = Bz_total / nz; % 取所有横截面平均值
end
