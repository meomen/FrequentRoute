package com.carpooling.frequentroute.repository;

import com.carpooling.frequentroute.entity.FrequentRoute;
import com.carpooling.frequentroute.entity.Trip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface TripRepostory extends JpaRepository<Trip, UUID> {
}
