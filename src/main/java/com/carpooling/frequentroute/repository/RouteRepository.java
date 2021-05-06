package com.carpooling.frequentroute.repository;

import com.carpooling.frequentroute.entity.Route;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface RouteRepository extends JpaRepository<Route,Integer> {
    @Query(value = "select * from route where account_id = ?1", nativeQuery = true)
    List<Route> findAllByAccount_id(String account_id);

    @Query(value = "select * from route where frequent_route_id = ?1", nativeQuery = true)
    Route findAllByFrequent_route_id(UUID account_id);

    @Modifying
    @Query(value = "update route set is_shared = ?1, type_shared = ?2 where id = ?3 ", nativeQuery = true)
    void updateIsSharedAndTypeShare(int is_shared, String type, int id);

    @Modifying
    @Query(value = "update route set is_shared = ?1 where id = ?2 ", nativeQuery = true)
    void updateIsShared(int is_shared, int id);

    @Query(value = "select * from route where account_id = ?1 and address_start = ?2 and address_end = ?3", nativeQuery = true)
    List<Route> findRouteByRequest(String account_id,String address_start,String address_end);
}
