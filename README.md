# Primary repo for Husky ROSBag data extraction using Matlab ROSBag reader

``` HuskyDataParse.mlx ```
Primary data parsing file. Different topics can be selected to be extracted (or not).
The primary file requires : 
1. ``` extractData.m ``` : For extracting data
2. ``` gps2enu.m ``` : Converting GPS data from lat-long to enu
3. ``` timeSync.m ``` : Time synchroinzation on the closest data point approximation (closeset to wheel velocities)
4. ``` syncRotation.m ``` : (Optional) to re-orient pose data to GPS data
5. ``` compareCurves.m ``` : (Optional) to compare different position curves
6. ``` xICR.m ``` : (Optional) compute the X cooridinate of ICR. Needs extremely accurate GPS 


Following datasets/ROSBags were collected when working towards my dissertaion (circa 2020 - 2025). Please contact asalvi@clemson.edu to get access to any of the dataset. All datasets can be parsed using the Matlab based data extraction code provided above.

[09/15/2025] : Following topics are available to be extracted and parsed.
More topics can be introduced by modification of the  ``` extractData.m ``` script and toggled using `1` or `0` in the main script.


* which_topic.tf
* which_topic.gps_head
* which_topic.gps_pos
* which_topic.imu
* which_topic.imu_fil
* which_topic.js
* which_topic.cmd_vel
* which_topic.odom
* which_topic.axis_camera
* which_topic.realsense_camera_rgb
* which_topic.realsense_camera_d
* which_topic.camera_pan
* which_topic.axis_info
* which_topic.status
* which_topic.usb_cam
* which_topic.april_pose

## Dynamics Datasets

### x. Rocky Terrain (Jan 29, 2023)

Drive Link : https://drive.google.com/drive/folders/140V68WBoQtFlgO6YT5m-Z0Be8mbpEPj3?usp=sharing
(~4.2 gb)

<< Add representative Image(s) >>

Straight light manuever of the Huksy on a rocky terrain for gathering IMU response


### x. Different Terrains (June 16, 2023)

Drive Link : https://drive.google.com/drive/folders/1pTLT3omF6HafHMgtaER2hTnyHAJD2v7o?usp=sharing

### x. Fishook maneuvers (May 6, 2023)

Drive Link : Drive Link (May 6) : https://drive.google.com/drive/folders/1bdnNomHRv0fetA6OMJiaAnwcdbJEKz8E?usp=sharing

> Collected with Sumedh before he left for vacation

### x. Battery ID (July 15,2023)

Drive Link : https://drive.google.com/drive/folders/1wvvyDjach5nPMAu5HNXDzXWxSioRrSkH?usp=sharing

<< Add representative Image(s) >>

Dataset primarily collected to identify motor/drive-train characteristics in open-loop fashion.
> Husky propped on jack for huksy powertrain parameter identification for different input wheel velocities
> Available topics
    > /joint_states (wheel velocities)
    > /status (battery voltage, current, motor current, temp)


### x. Sikdpad (Sept 30, 2023)

Drive Link : https://drive.google.com/drive/folders/1LPeZdRsjdeM3OFIEuAnN6cbqPAzMmsis?usp=sharing

### x. Skidpad Extented (Oct 4, 2023)

Drive Link : https://drive.google.com/drive/folders/1DkLylAhfK5CPok4wZaFxkQMAae1p3KYs?usp=sharing

> With sand bags
> Asphalt, outside CGEC

### x. Skidpad Extended State Space (Oct 7, 2023)

Drive Link : https://drive.google.com/drive/folders/1gn_zhjJI6nmZ3hTlg4UR_N4LWog5qPuu?usp=sharing

> Collected with Harshal
> Skidpads over wide range of velocities

### x. GPS based powertrain/ torqure characterisitics (Oct 28, 2023)

Drive Link : https://drive.google.com/drive/folders/1sWb-icKx04x1ugC5ZY2JwiMTnYa6qJq3?usp=sharing

> Husky straght line motion 
> GPS based position/velocity/torque estimation

### x. Sinusoidal Wheel input velocities (Nov 17 - Nov 28, 2023)

Drive Link : https://drive.google.com/drive/folders/1Pp5JurZOUNSc5pOjsdFllmVANObeVO22?usp=sharing

> Dataset collected around Thanksgiving time

### x. Clothoid Trajectories (Nov 30, Dec 22, 2023)

Drive Link : https://drive.google.com/drive/folders/1TZ4q0cLXffdlkhs4KjDjgzjtKOyBRlaC?usp=sharing

> Dataset for simulator calibration

### x. Grass and Concrete Data for fitting GP Models (Feb 16, March 10 2024)

Drive Link (Feb 16) : https://drive.google.com/drive/folders/1jdQzN60SEhvpY0-trw40F7W1dS5s58dQ?usp=sharing
Drive Link (March 10) : https://drive.google.com/drive/folders/1e-ilHhtBYwRqARSzcMMhJy1q8MHqtN-U?usp=sharing


### x. Camera Calibration (March 24, 2024)

Drive Link : https://drive.google.com/drive/folders/1esnM_JIoQCbYHk3W3edag9E0AsOAa-da?usp=sharing

> Finding camera extrinsic/intrinsic parameters for calibration

### x. Husky Vertical Acceleration (April 5, 2024)

Drive Link : https://drive.google.com/drive/folders/1h9E-nxd5KRmxJps8W7E7eMJktXlPdBaE?usp=sharing

> Vertical acceleration response for Huksy
> Collected with Jagadeesh


### x. Husky IMM Experiment Data (April 28, 2024)

Drive Link : https://drive.google.com/drive/folders/1pbEEiwqXRqfME2BYImVcJP1tbdj35Y90?usp=sharing

> Clothoids with tarp
> Asphalt near pond

### x. Husky IMM Experiment Data-2 (May 3, 2024)

Drive Link : https://drive.google.com/drive/folders/1mGPutXksEHyyNlHXyF5OvQ6DgyD1FzhL?usp=sharing

> Clothoid maneuvers with tarp
> Grass behind CGEC, mixed flat and slop
> Huge dataset collected with help of Harshal

### x. Husky ICR Noise dataset (May 5, 2024)

Drive Link : https://drive.google.com/drive/folders/1uJcTa5xDAbXFJx8mKIDorgUeGkzm82FS?usp=sharing

> Husky without tarp, skidpads
> On flat terrains like asphalt, crushed concrete, grass, etc


### x. Husky ICR Noise dataset-2 (May 7, 2024)

Drive Link : https://drive.google.com/drive/folders/1T2hpV4ocLkn5nPLN8VR-Bk8WHfRv21vz?usp=sharing

> Husky on grass, clothoids
> With weights, behind CGEC
> Collected with Jagadeesh

### x. Husky ICR Noise/ IMM dataset-3 (May 9, May 10, May 11, 2024)

Drive Link(a) : https://drive.google.com/drive/folders/1l99D9oLy3z_fxasi_BbA3MLefcxlFeWI?usp=sharing
Drive Link (b) : https://drive.google.com/drive/folders/1bXLTR2Wi1TfYdWd1G3yF2icRS0lYGelF?usp=sharing

> Difficult to remeber what data is this
> 

### x. Lateral Velocity Estimation dataset (May 23/ May 24 , 2024)

Drive Link : https://drive.google.com/drive/folders/1QIbzQzrDYprZnF_INdYAizJsj32U5xZ_?usp=sharing


### x. Mixture Model Identification datasets (July 2024)

Drive Link (July 3) : https://drive.google.com/drive/folders/1_vqYlMoCXqULTLRuvXKri7TkboGu_8sC?usp=sharing
Drive Link (July 5) : https://drive.google.com/drive/folders/1LU6L6NwquKaxFShKvWIsm8h5bE_o6EbR?usp=sharing
Drive Link (July 11) : https://drive.google.com/drive/folders/1D9-b524Y-Yg6d6bqcMFxmglKDV-mA_HZ?usp=sharing


### x. Extended Skidpad for simulator tuning (Sept 21/23 2024)

Drive Link : https://drive.google.com/drive/folders/1R5kQL7F6gGLBh3oBs8bkDhJhJy0m1kB7?usp=sharing



## Vision Dataset/ Runs

Datasets collected primarily for diffusion training

### x. Driving Rig Lane Keeping dataset (Jul 27, 2025)

Drive Link : https://drive.google.com/drive/u/1/folders/1W2jeuOZydfJ1VKoV44SRHsh1tsabZT6X

### x. Off-road / CGEC Parking lot dataset (Dec 31, 2024)

Drive Link : https://drive.google.com/drive/u/1/folders/1zKW6OX9xo5xUCrTdWPhi-ihdMdiwN2-W

### x. Balcony random cones teleop dataset - cam calibration (Dec 30, 2024)

Drive Link : https://drive.google.com/drive/u/1/folders/187cnhs5odGsi8RQDCEzn1BiyJ-a_6tgL


### x. Husky Visual Nav experiemnts used for training (Nov 12, 2024)

Drive Link : https://drive.google.com/drive/u/1/folders/1SgPmVCvgAAdERyveNyUZX1ZojEVdDhBd

### x. Simulation Dataset with moving camera

Drive Link : https://drive.google.com/drive/u/1/folders/1fAkbwGGDIzvBOG8k4r-c_hyzfgkq2yty

## Miscellaneous Data
### x. Random bags archive (Feb 7, 2023)

Drive Link (a) : https://drive.google.com/drive/folders/1Y5H8sA1-CamXb5Aa9EJUgplRTjtZvnmd?usp=sharing
Drive Link (b) : https://drive.google.com/drive/folders/1ku7YIHg4hDkvfTfauAiI_1oKkLHrTve8?usp=sharing 

Archiving random bags for slam/ teloperation/ data parsing for exploring Husky Characteristics

> Available topics
    > All
