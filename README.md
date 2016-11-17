Script to get the list of earthquakes from USGS happened recently within RADIUS km from LAT,LON

# Environment variables
can be set to override coordinates and radius
* EQ_LAT
* EQ_LON
* EQ_RADIUS

# Dependencies
* curl
* jq >= 1.5

# Example
```
$ earthquakes.sh
Time                       Magnitude  Distance  Depth     Tsunami  CDI  MMI  Felt  Description
2016-10-19 14:40:38 (UTC)  4.4        67.3km    51.33km   0        2.8  -    7     8km SW of Ishioka, Japan
2016-10-20 02:49:54 (UTC)  5.4        83.4km    26.27km   0        4.4  -    82    2km NW of Omigawa, Japan
2016-10-24 01:54:24 (UTC)  4.4        96.5km    29.7km    0        -    -    -     8km NW of Hasaki, Japan
2016-10-25 17:35:49 (UTC)  4.6        208.5km   30.76km   0        -    -    -     59km ESE of Iwaki, Japan
2016-10-26 10:12:34 (UTC)  4.5        41.5km    61.23km   0        3.4  -    42    7km WNW of Sakura, Japan
2016-11-01 13:37:43 (UTC)  4.7        294.5km   54.31km   0        -    -    -     96km E of Hachijo-jima, Japan
2016-11-01 22:37:32 (UTC)  4.9        272.1km   12.71km   0        3.1  -    5     62km E of Namie, Japan
2016-11-08 12:43:20 (UTC)  4.2        152.1km   35km      0        -    -    -     44km ESE of Hitachi, Japan
2016-11-11 04:53:37 (UTC)  4.7        293.8km   348.15km  0        -    -    -     4km S of Toba, Japan
2016-11-11 12:17:20 (UTC)  4.1        299.1km   355.34km  0        -    -    -     31km SSE of Toba, Japan
2016-11-12 22:43:22 (UTC)  4.6        255.7km   18.22km   0        -    -    -     102km E of Iwaki, Japan
2016-11-14 16:15:48 (UTC)  5          104.2km   50.48km   0        3.4  -    11    17km ESE of Kashima-shi, Japan
2016-11-16 16:01:57 (UTC)  4.6        45km      61.26km   0        3.1  -    26    5km ESE of Chiba-shi, Japan
```

# See also
Earthquake data source API
* https://earthquake.usgs.gov/fdsnws/event/1/

Distance calculation
* http://stackoverflow.com/questions/365826/calculate-distance-between-2-gps-coordinates
