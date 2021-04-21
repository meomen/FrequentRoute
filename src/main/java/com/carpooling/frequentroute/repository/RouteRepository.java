package com.carpooling.frequentroute.repository;

import com.carpooling.frequentroute.entity.GridTrip;
import com.carpooling.frequentroute.entity.Route;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface RouteRepository extends JpaRepository<Route,Integer> {
    @Query(value = "select * from route where account_id = ?1", nativeQuery = true)
    List<Route> findAllByAccount_id(String account_id);

    @Query(value = "select * from route where frequent_route_id = ?1", nativeQuery = true)
    List<Route> findAllByFrequent_route_id(UUID account_id);
}
