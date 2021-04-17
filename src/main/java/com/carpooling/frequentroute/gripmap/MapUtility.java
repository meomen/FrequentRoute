package com.carpooling.frequentroute.gripmap;

import com.carpooling.frequentroute.model.LatLng;

import java.util.ArrayList;
import java.util.List;

public class MapUtility {
    public static double START_LATITUDE = 20.95;
    public static double START_LONGITUDE = 105.765;
    public static double END_LATITUDE = 21.085;
    public static double END_LONGITUDE = 105.9;
    public static double LENGTH_REGION = 0.0025;

    /**
     * Method to decode polyline points Courtesy :
     * jeffreysambells.com/2010/05/27
     * /decoding-polylines-from-google-maps-direction-api-with-java
     */
    public static List<LatLng> decodePoly(String encoded) {

        List<LatLng> poly = new ArrayList<>();
        int index = 0, len = encoded.length();
        int lat = 0, lng = 0;

        while (index < len) {
            int b, shift = 0, result = 0;
            do {
                b = encoded.charAt(index++) - 63;
                result |= (b & 0x1f) << shift;
                shift += 5;
            } while (b >= 0x20);
            int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
            lat += dlat;

            shift = 0;
            result = 0;
            do {
                b = encoded.charAt(index++) - 63;
                result |= (b & 0x1f) << shift;
                shift += 5;
            } while (b >= 0x20);
            int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
            lng += dlng;

            LatLng p = new LatLng((((double) lat / 1E5)),
                    (((double) lng / 1E5)));
            poly.add(p);
        }

        return poly;
    }

    public static String tranformToGrid(List<LatLng> listPoint) {
        StringBuilder builder = new StringBuilder();
        int preIndexLat = -1;
        int preIndexLong = -1;
        for (LatLng latLng : listPoint) {
            if (latLng.latitude >= START_LATITUDE && latLng.latitude <= END_LATITUDE
                    && latLng.longitude >= START_LONGITUDE && latLng.longitude <= END_LONGITUDE) {

                double latTemp = latLng.latitude - START_LATITUDE;
                double longTemp = latLng.longitude - START_LONGITUDE;
                int indexLat = (int) (latTemp / LENGTH_REGION) + 1;
                int indexLong = (int) (longTemp / LENGTH_REGION) + 1;
                if(indexLat != preIndexLat || indexLong != preIndexLong){
                    if (builder.length() != 0) builder.append(", ");
                    builder.append("(").append(indexLat).append(":").append(indexLong).append(")");
                    preIndexLat = indexLat; preIndexLong = indexLong;
                }
            }
        }
        return builder.toString();
    }
}
