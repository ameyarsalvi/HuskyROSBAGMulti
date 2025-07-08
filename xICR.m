function y = xICR(sensor,TSyn,K,A,B,clip)

    %Normalizing data to start X Y as 0 0
    TSyn(K).data.enu_x(A:B) = TSyn(K).data.enu_x(A:B) - TSyn(K).data.enu_x(A);
    TSyn(K).data.enu_y(A:B) = TSyn(K).data.enu_y(A:B) - TSyn(K).data.enu_y(A);

    path = [TSyn(K).data.enu_x(A:B)', TSyn(K).data.enu_y(A:B)'];
    
    heading = headingFromXY(path);
    
    %figure
    %plot(heading)
    % Global Velocity Trajectory
    
    time_ = sensor(K).time.joint_states(A:B);
    
    for i = 0:length(time_)-1
        X_dot(i+1) = (TSyn(K).data.enu_x(A+i+1)' - TSyn(K).data.enu_x(A+i)')/(sensor(K).time.joint_states(A+i+1) -sensor(K).time.joint_states(A+i));
    end

    for i = 0:length(time_)-1
        Y_dot(i+1) = (TSyn(K).data.enu_y(A+i+1)' - TSyn(K).data.enu_y(A+i)')/(sensor(K).time.joint_states(A+i+1) -sensor(K).time.joint_states(A+i));
    end
    
    % Model when no deviation wrt ICRx
    
    %X_dot_M = cos(heading).*TSyn(K).data.odom_VelLinX(A:B)' -sin(heading).*TSyn(K).data.IMU_fil_AngZ(A:B)';
    %X_dot_M_icr = cos(heading).*TSyn(K).data.odom_VelLinX(A:B)' - 0.25*sin(heading).*TSyn(K).data.IMU_fil_AngZ(A:B)';
    
    
    %figure
    %hold on
    %plot(X_dot)
    %plot(TSyn(K).data.odom_VelLinX(A:B))
    %plot(X_dot_M)
    %plot(X_dot_M_icr)
    
    % treating ICR as a random variable
    
    ICR_x = (cos(heading).*TSyn(K).data.odom_VelLinX(A:B)' - X_dot')./(-1*sin(heading).*TSyn(K).data.IMU_fil_AngZ(A:B)');
    LatVel_y = (cos(heading).*TSyn(K).data.odom_VelLinX(A:B)' - X_dot')./(-1*sin(heading));
    ICR_x(ICR_x>clip.high)=clip.high ;
    ICR_x(ICR_x<clip.low)=clip.low ;

    LatVel_yEst1 = (cos(heading).*TSyn(K).data.odom_VelLinX(A:B)' - X_dot')./(-1*sin(heading));
    LatVel_yEst2 = (sin(heading).*TSyn(K).data.odom_VelLinX(A:B)' - Y_dot')./(cos(heading));

    
    %figure
    %plot(ICR_x,'.')
    
    y = [ICR_x LatVel_y X_dot' Y_dot' heading LatVel_yEst1 LatVel_yEst2];

end