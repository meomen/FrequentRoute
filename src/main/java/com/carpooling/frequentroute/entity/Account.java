package com.carpooling.frequentroute.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Data
@Table (name = "account")
public class Account implements Serializable {

    @Id
    @Column(name = "account_id")
    private String account_id;

    @Column(name = "user_name")
    private String user_name;
}
