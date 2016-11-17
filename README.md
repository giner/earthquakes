Script to get the list of earthquakes from USGS happened recently within RADIUS km from LAT,LON

# Environment variables
can be set to override coordinates and radius
* EQ_LAT
* EQ_LON
* EQ_RADIUS

# Dependencies
* curl
* jq >= 1.5

# See also
Earthquake data source API
* https://earthquake.usgs.gov/fdsnws/event/1/

Distance calculation
* http://stackoverflow.com/questions/365826/calculate-distance-between-2-gps-coordinates
