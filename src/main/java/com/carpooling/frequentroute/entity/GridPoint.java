package com.carpooling.frequentroute.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity
@Data
@Table (name = "grid_point")
public class GridPoint {

    @Id
    @GeneratedValue
    private UUID id;

    private UUID grid_trip_id;

    private int lat;

    private int lng;

    private int time;


    @Override
    public String toString(){
        return "(" + lat + ":" + lng + ":" + time +")";
    }
}
