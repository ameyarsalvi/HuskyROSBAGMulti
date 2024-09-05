function TSyn = timeSync(sensor,k,Sync_topics)

% Sync_topics.odom_VelLinX = 1;
% Sync_topics.odom_pos = 1;
% Sync_topics.gps = 1;
% Sync_topics.IMU_fil_AngZ = 1;
%Sync_topics.gps_head = 1;

for i=1:k
    timeArray = sensor(i).time.joint_states;
    
    if Sync_topics.odom_VelLinX ==1
        sensorTimestamp = sensor(i).time.odom;
        
        for j = 1:length(timeArray)
            [~,closestIndex] = min(abs(sensorTimestamp-timeArray(j)));
            TSyn(i).data.odom_VelLinX(j) = sensor(i).data.odom_VelLinX(closestIndex);
        end

        

    end

    if Sync_topics.IMU_fil_AngZ ==1
        sensorTimestamp = sensor(i).time.imu_fil;
        
        for j = 1:length(timeArray)
            [~,closestIndex(j)] = min(abs(sensorTimestamp-timeArray(j)));
        end

        TSyn(i).data.IMU_fil_AngZ = sensor(i).data.IMU_fil_AngZ(closestIndex);

    end

    if Sync_topics.gps ==1
        sensorTimestamp = sensor(i).time.gps;
        
        for j = 1:length(timeArray)
            [~,closestIndex(j)] = min(abs(sensorTimestamp-timeArray(j)));
        end

        TSyn(i).data.enu_x = sensor(i).data.enu_x(closestIndex);
        TSyn(i).data.enu_y = sensor(i).data.enu_y(closestIndex);

    end

    if Sync_topics.gps_head ==1
        sensorTimestamp = sensor(i).time.gps_head;
        
        for j = 1:length(timeArray)
            [~,closestIndex(j)] = min(abs(sensorTimestamp-timeArray(j)));
        end

        TSyn(i).data.enu_x_head = sensor(i).data.enu_head_x(closestIndex);
        TSyn(i).data.enu_y_head = sensor(i).data.enu_head_y(closestIndex);

    end

    if Sync_topics.odom_pos ==1
        sensorTimestamp = sensor(i).time.odom;
        
        for j = 1:length(timeArray)
            [~,closestIndex(j)] = min(abs(sensorTimestamp-timeArray(j)));
        end

        TSyn(i).data.pos_x = sensor(i).data.odom_PosX(closestIndex);
        TSyn(i).data.pos_y = sensor(i).data.odom_PosY(closestIndex);

    end

    clear timeArray

% Same statements for other topics

end