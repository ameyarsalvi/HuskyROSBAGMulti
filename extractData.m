function sensor = extractData(bag,which_topic,pwd,k,origin)
    

    %{
    Available topics now
which_topic.tf
which_topic.gps_head
which_topic.gps_pos
which_topic.imu
which_topic.imu_fil
which_topic.js
which_topic.cmd_vel
which_topic.odom
which_topic.axis_camera
which_topic.realsense_camera_rgb = 1;
which_topic.realsense_camera_d = 1;
which_topic.camera_pan = 1;
which_topic.axis_info == 1; 
which_topic.status == 1
    %}

    if which_topic.status == 1 
        status = select(bag,'Topic','/status');
        statusStructs = readMessages(status,'DataFormat','struct');
        status_var = [statusStructs{:,1}];
        for i = 1: length(status_var)
            data.status(i) = status_var(i);
        end
        time.status = [status.MessageList{:,1}];
    end
    
    if which_topic.camera_pan == 1 
        camera_pan = select(bag,'Topic','/camera_pan');
        camera_panStructs = readMessages(camera_pan,'DataFormat','struct');
        camera_pan = [camera_panStructs{:,1}];
        for i = 1: length(camera_pan)
            data.camera_pan(i) = camera_pan(i);
        end
        %time.camera_pan = [camera_pan.MessageList{:,1}];
    end

    % if which_topic.axis_info == 1 
    %     axis_info = select(bag,'Topic','/axis/camera_info');
    %     axis_infoStructs = readMessages(axis_info,'DataFormat','struct');
    %     axis_info = [axis_infoStructs{:,1}];
    %     for i = 1: length(axis_info)
    %         data.axis_info(i) = axis_info(i);
    %     end
    %     time.axis_info = [axis_info.MessageList{:,1}];
    % end

    if which_topic.realsense_camera_rgb == 1
        img_folder = strcat('rs_imgs_bag_',num2str(k));
        if not(isfolder(img_folder))
            mkdir(img_folder)
        end
        cam_images = select(bag,'Topic','/camera/color/image_raw/compressed');
        image_strct= readMessages(cam_images,'DataFormat','struct');
        for i =1:length(image_strct)
            image= rosReadImage(image_strct{i,1});
            imwrite(uint8(image), strcat(pwd,'\',img_folder,'\',img_folder,'_',num2str(i),'.jpg'));
            data.rs_image_no{i} = strcat(pwd,'\',img_folder,'\',img_folder,'_',num2str(i),'.jpg');
        end
        time.rs_camera = [cam_images.MessageList{:,1}];
    else
        %pass
    end
    clear img_folder

    if which_topic.realsense_camera_d == 1
        img_folder = strcat('rsD_imgs_bag_',num2str(k));
        if not(isfolder(img_folder))
            mkdir(img_folder)
        end
        cam_images = select(bag,'Topic','/camera/depth/image_rect_raw/compressedDepth');
        image_strct= readMessages(cam_images,'DataFormat','struct');
        for i =1:length(image_strct)
            image= rosReadImage(image_strct{i,1});
            imwrite(uint8(image), strcat(pwd,'\',img_folder,'\',img_folder,'_',num2str(i),'.jpg'));
            data.rs_depth_image_no{i} = strcat(pwd,'\',img_folder,'\',img_folder,'_',num2str(i),'.jpg');
        end          
    else
        %pass
    end
    clear img_folder

    if which_topic.axis_camera == 1
        img_folder = strcat('imgs_bag_',num2str(k));
        if not(isfolder(img_folder))
            mkdir(img_folder)
        end
        cam_images = select(bag,'Topic','/axis/image_raw/compressed');
        image_strct= readMessages(cam_images,'DataFormat','struct');
        for i =1:length(image_strct)
            image= rosReadImage(image_strct{i,1});
            %imwrite(uint8(image), strcat(pwd,'\',img_folder,'\',img_folder,'_',num2str(i),'.jpg'));
            data.image_no{i} = strcat(pwd,'\',img_folder,'\',img_folder,'_',num2str(i),'.jpg');
        end
        time.axis_camera = [cam_images.MessageList{:,1}];
    else
        %pass
    end

    
    
    if which_topic.tf == 1
        tf = select(bag,'Topic','/tf');
        tfStructs = readMessages(tf,'DataFormat','struct');
        tf_var = [tfStructs{:,1}];
        tf_static = select(bag,'Topic','/tf_static');
        tf_staticStructs = readMessages(tf_static,'DataFormat','struct');
        tf_static_var = [tf_staticStructs{:,1}];
        for i = 1:length(tf_var)
            %pass
        end
    else
        %pass
    end


    if which_topic.gps_pos == 1
        gps = select(bag, 'Topic', '/piksi_multi_position/navsatfix_best_fix');
        gpsStructs = readMessages(gps, 'DataFormat', 'struct');
        
        % Check if gpsStructs is empty
        if isempty(gpsStructs)
            %pass
        else
            gps_var = [gpsStructs{:,1}];
            data.gpsLat = [gps_var.Latitude];
            data.gpsLong = [gps_var.Longitude];
            data.gpsAlt = [gps_var.Altitude];
            enu = gps2enu(data.gpsLat, data.gpsLong, data.gpsAlt, origin);
            data.enu_x = enu.X;
            data.enu_y = enu.Y;
            data.enu_z = enu.Z;
            time.gps = [gps.MessageList{:,1}];
        end    
        
    else
        %pass
    end


    if which_topic.gps_head == 1
        gps_head = select(bag,'Topic','/piksi_multi_heading/navsatfix_best_fix');
        gps_headStructs = readMessages(gps_head,'DataFormat','struct');

        % Check if gpsStructs is empty
        if isempty(gps_headStructs)
            %pass
        else
            gps_head_var = [gps_headStructs{:,1}];
            data.gps_head_Lat = [gps_head_var.Latitude];
            data.gps_head_Long = [gps_head_var.Longitude];
            data.gps_head_Alt = [gps_head_var.Altitude];
            enu_head = gps2enu(data.gps_head_Lat,data.gps_head_Long,data.gps_head_Alt,origin);
            data.enu_head_x = enu_head.X;
            data.enu_head_y = enu_head.Y;
            data.enu_head_z = enu_head.Z;
            time.gps_head = [gps_head.MessageList{:,1}];
        end
    else
        %pass
    end


    
    if which_topic.imu == 1 
        imu = select(bag,'Topic','/gx5/imu/data');
        imuStructs = readMessages(imu,'DataFormat','struct');
        imu_var = [imuStructs{:,1}];
        for i = 1:length(imu_var)
            data.IMU_LinX(i) = imu_var(i).LinearAcceleration.X;
            data.IMU_LinY(i) = imu_var(i).LinearAcceleration.Y;
            data.IMU_LinZ(i) = imu_var(i).LinearAcceleration.Z;
            data.IMU_AngX(i) = imu_var(i).AngularVelocity.X;
            data.IMU_AngY(i) = imu_var(i).AngularVelocity.Y;
            data.IMU_AngZ(i) = imu_var(i).AngularVelocity.Z;
        end
        time.imu = [imu.MessageList{:,1}];
    end

    
    if which_topic.imu_fil == 1 
        imu_fil = select(bag,'Topic','/gx5/nav/filtered_imu/data');
        imu_filStructs = readMessages(imu_fil,'DataFormat','struct');
        imu_fil_var = [imu_filStructs{:,1}];
        for i = 1:length(imu_fil_var)
            data.IMU_fil_LinX(i) = imu_fil_var(i).LinearAcceleration.X;
            data.IMU_fil_LinY(i) = imu_fil_var(i).LinearAcceleration.Y;
            data.IMU_fil_LinZ(i) = imu_fil_var(i).LinearAcceleration.Z;
            data.IMU_fil_AngX(i) = imu_fil_var(i).AngularVelocity.X;
            data.IMU_fil_AngY(i) = imu_fil_var(i).AngularVelocity.Y;
            data.IMU_fil_AngZ(i) = imu_fil_var(i).AngularVelocity.Z;
        end
        time.imu_fil = [imu_fil.MessageList{:,1}];
    end


    if which_topic.js == 1 
        joint_states = select(bag,'Topic','/joint_states');
        JSStructs = readMessages(joint_states,'DataFormat','struct');
        js_var = [JSStructs{:,1}];
        data.joint_states = [js_var.Velocity];
        time.joint_states = [joint_states.MessageList{:,1}];
    end


    if which_topic.cmd_vel == 1 
        cmd_vel = select(bag,'Topic','/husky_velocity_controller/cmd_vel');
        cmdVelStructs = readMessages(cmd_vel,'DataFormat','struct');
        cmdVel = [cmdVelStructs{:,1}];
        for i = 1: length(cmdVel)
            data.cmd_VelLinX(i) = cmdVel(i).Linear.X;
            data.cmd_VelAngZ(i) = cmdVel(i).Angular.Z;
        end
        time.cmd_Vel = [cmd_vel.MessageList{:,1}];
    end

    if which_topic.odom == 1 
        odom = select(bag,'Topic','/husky_velocity_controller/odom');
        odomStructs = readMessages(odom,'DataFormat','struct');
        odom_var = [odomStructs{:,1}];
        for i = 1:length(odom_var)
            data.odom_PosX(i) = odom_var(i).Pose.Pose.Position.X;
            data.odom_PosY(i) = odom_var(i).Pose.Pose.Position.Y;
            data.odom_VelLinX(i) = odom_var(i).Twist.Twist.Linear.X ;
            data.odom_VelLinY(i) = odom_var(i).Twist.Twist.Linear.Y;
            data.odom_VelAngZ(i) = odom_var(i).Twist.Twist.Linear.Z;
        end
        time.odom = [odom.MessageList{:,1}];
    end

    

    
    sensor.time = time;
    sensor.data = data;

end
