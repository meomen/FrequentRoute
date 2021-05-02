package com.carpooling.frequentroute.repository;

import com.carpooling.frequentroute.entity.FrequentPoint;
import com.carpooling.frequentroute.entity.Trip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface FrequentPointRepostory extends JpaRepository<FrequentPoint, UUID> {

    @Query(value = "select * from frequent_point where frequent_route_id = ?1", nativeQuery = true)
    List<FrequentPoint> findAllByFrequentRoute(UUID frequent_route_id);

    @Modifying
    @Query(value = "delete from frequent_point where frequent_route_id = ?1", nativeQuery = true)
    void deleteAllByFrequentRoute(UUID frequent_route_id);
}
