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

