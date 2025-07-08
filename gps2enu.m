function enu = gps2enu(lat,long,alt)

    [xEastGPS, yNorthGPS, zUpGPS] = geodetic2enu(lat ,long,alt,...
                                    lat(1), long(1), alt(1),...
                                    wgs84Ellipsoid,"degrees");

    enu.X = xEastGPS;
    enu.Y = yNorthGPS;
    enu.Z = zUpGPS;

end
