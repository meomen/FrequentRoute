package com.carpooling.frequentroute.entity;

import com.sun.xml.internal.ws.developer.Serialization;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Data
@Table (name = "trip")
public class Trip implements Serializable {

    @Id
    @GeneratedValue
    private UUID trip_id;

    private String account_owner;

}
