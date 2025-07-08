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


## Datasets
Following datasets/ROSBags were collected when working towards my dissertaion (circa 2020 - 2025). Please contact asalvi@clemson.edu to get access to any of the dataset. All datasets can be parsed using the Matlab based data extraction code provided above.

### 1. Battery ID (July 15,2023)

Drive Link : https://drive.google.com/drive/folders/1wvvyDjach5nPMAu5HNXDzXWxSioRrSkH?usp=sharing

Dataset primarily collected to identify motor/drive-train characteristics in open-loop fashion.



