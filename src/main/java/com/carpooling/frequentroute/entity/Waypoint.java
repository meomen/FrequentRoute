package com.carpooling.frequentroute.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Data
@Table(name = "waypoint")
public class Waypoint {

    @Id
    @GeneratedValue
    private UUID id;

    private UUID on_trip;

    private Double latitude;

    private Double longitude;

    private String time;
}
