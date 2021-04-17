package com.carpooling.frequentroute.repository;

import com.carpooling.frequentroute.entity.FrequentRoute;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface FrequentRouteRepostory extends JpaRepository<FrequentRoute, UUID> {
}
