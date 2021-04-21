package com.carpooling.frequentroute.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity
@Data
@Table (name = "route_point")
public class RoutePoint {

    @Id
    @GeneratedValue
    UUID id;

    int route_id;

    double lat;
    double lng;
}
