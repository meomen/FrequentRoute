package com.carpooling.frequentroute.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Data
@Table (name = "route")
public class Route {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    String account_id;

    UUID frequent_route_id;

    String address_start;
    String address_end;

    double lat_start;
    double lng_start;

    double lat_end;
    double lng_end;

    String time_start;
    String time_end;

    int is_shared;
    String type_shared;

    double length_route;
    int weekday;

}
