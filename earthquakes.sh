#!/bin/bash

# Get list of earthquakes from USGS happened recently within RADIUS km from LAT,LON
#
# Environment variables can be set to override coordinates and radius:
#   EQ_LAT
#   EQ_LON
#   EQ_RADIUS
#
# Dependencies: curl, jq >= 1.5
# Earthquake data source API:
#   https://earthquake.usgs.gov/fdsnws/event/1/
# Distance calculation:
#   http://stackoverflow.com/questions/365826/calculate-distance-between-2-gps-coordinates
#
# Stanislav German-Evtushenko <ginermail@gmail.com>, 2016 

# Tokyo
LAT=${EQ_LAT:-35.6895}
LON=${EQ_LON:-139.6917}

# Radius in km
RADIUS=${EQ_RADIUS:-300}

curl "http://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&latitude=${LAT}&longitude=${LON}&maxradiuskm=${RADIUS}&orderby=time-asc" 2>/dev/null | \
    jq -r --arg LAT $LAT --arg LON $LON '
        def dist(lat1; lon1; lat2; lon2):
            6371 as $R |
            3.1415926536 as $PI |
            ((lat2 - lat1) / 180 * $PI) as $dlat |
            ((lon2 - lon1) / 180 * $PI) as $dlon |
            (lat1 / 180 * $PI) as $lat1 |
            (lat2 / 180 * $PI) as $lat2 |
            ($dlat / 2 | sin) as $sin_dlat_2 |
            ($dlon / 2 | sin) as $sin_dlon_2 |
            ($lat1 | cos) as $cos_lat1 |
            ($lat2 | cos) as $cos_lat2 |
            (pow($sin_dlat_2;2) + pow($sin_dlon_2;2) * $cos_lat1 * $cos_lat2) as $a |
            (2 * atan2( pow ($a;0.5); pow(1-$a;0.5) )) as $c |
            ($R * $c) as $d |
            $d * 10 | floor / 10 | tostring
        ;

        ($LAT | tonumber) as $LAT |
        ($LON | tonumber) as $LON |
        [ "Time", "Magnitude", "Distance", "Depth", "Tsunami", "CDI", "MMI", "Felt", "Description" ],
        ( .features[] |
            [ (.properties.time / 1000 | strftime("%Y-%m-%d %H:%M:%S (UTC)")),
              .properties.mag,
              dist($LAT; $LON; .geometry.coordinates[1]; .geometry.coordinates[0]) + "km",
              ( .geometry.coordinates[2] | tostring + "km" ),
              .properties.tsunami,
              .properties.cdi,
              .properties.mmi,
              .properties.felt,
              .properties.place
              | select (. == null) = "-"
            ]
        ) |
        @tsv' | \
        column -ts$'\t' | \
        less -XF
