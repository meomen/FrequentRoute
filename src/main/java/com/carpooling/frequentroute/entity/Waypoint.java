package com.carpooling.frequentroute.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

@Entity
@Data
@Table(name = "waypoint")
public class Waypoint implements Serializable {

    @Id
    @GeneratedValue
    private UUID id;

    private UUID on_trip;

    private Double latitude;

    private Double longitude;

    @Temporal(TemporalType.TIMESTAMP)
    private Date time;
}
