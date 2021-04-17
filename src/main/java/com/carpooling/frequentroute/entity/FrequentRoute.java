package com.carpooling.frequentroute.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity
@Data
@Table (name = "frequent_route")
public class FrequentRoute {

    @Id
    @GeneratedValue
    private UUID id;

    private String account_id;

    private String frequent_route;
}
