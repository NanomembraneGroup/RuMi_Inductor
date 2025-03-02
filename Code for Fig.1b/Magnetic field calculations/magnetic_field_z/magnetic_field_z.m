function Bz = magnetic_field_z(r, theta, z, R, t, h, nR, nH)
    % 定义常量
    I_total = 1; % 总电流，单位：安培
    mue0 = 4*pi*10^(-7); % 真空磁导率，单位：N/A^2
    nL = 30; % 每个电流回路的分段数
    dR = t / nR; % 厚度方向离散化增量
    dH = h / nH; % 高度方向离散化增量
    I_per_ring = I_total / (nH*nR); % 每个小环的电流

    % 初始化 Bz 分量
    Bz = 0;

    % 对高度方向的每个小电流环进行积分
    for zL = -h/2:dH:h/2 % 从 -h/2 到 h/2 高度的电流环
        % 对厚度方向的每个小环进行积分
        for rL = R:dR:(R+t)
            % 定义电流回路参数化
            phi = linspace(0, 2*pi, nL); % 角度 phi 从 0 到 2*pi 的分布
            xL = rL * cos(phi); % 电流回路的 x 坐标
            yL = rL * sin(phi); % 电流回路的 y 坐标
            zL_array = zL * ones(size(xL)); % 电流回路的 z 坐标位于 zL 平面

            % 将电流回路的点放入矩阵 L
            L = [xL', yL', zL_array'];

            % 将柱坐标转换为笛卡尔坐标
            x = r * cos(theta); % 将 r, theta 转换为 x
            y = r * sin(theta); % 将 r, theta 转换为 y

            % 对当前厚度和高度下的电流回路计算磁场
            for i = 1:nL
                if i == nL
                    dL = L(end, :) - L(1, :); % 最后一个线元
                    vec = (L(end, :) + L(1, :)) * 0.5; % 电流元中点
                else
                    dL = L(i+1, :) - L(i, :); % i 个电流元
                    vec = (L(i+1, :) + L(i, :)) * 0.5; % 电流元中点
                end

                % 计算位置矢量
                vecR = [x, y, z]; % 待计算点位置矢量
                vecd = vecR - vec; % 电流元中点到该点的矢量

                % 计算磁场增量，使用毕奥-萨伐尔定律
                dB = mue0 * I_per_ring / (4 * pi) * cross(dL', vecd') / (norm(vecd)^3); 

                % 只保留磁场的 z 分量
                Bz = Bz + dB(3);
            end
        end
    end
end
