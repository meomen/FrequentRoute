package com.carpooling.frequentroute.model;

import lombok.Data;


@Data
public class SpaTemRegion {

    public int lat,lng,time;

    @Override
    public String toString(){
        return "(" + lat + ":" + lng + ":" + time +")";
    }
}
