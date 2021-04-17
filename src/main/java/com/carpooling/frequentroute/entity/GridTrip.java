package com.carpooling.frequentroute.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Data
@Table (name = "grid_trip")
public class GridTrip implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "grid_trip_id")
    private UUID id;

    @Column(name = "account_id")
    private String account_id;

    @Column(name = "trip_id")
    private UUID trip_id;

    @Column(name = "data")
    private String data;
}
