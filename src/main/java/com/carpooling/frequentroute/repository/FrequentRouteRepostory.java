package com.carpooling.frequentroute.repository;

import com.carpooling.frequentroute.entity.FrequentRoute;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface FrequentRouteRepostory extends JpaRepository<FrequentRoute, UUID> {

    @Query(value = "select * from frequent_route where account_id = ?1", nativeQuery = true)
    List<FrequentRoute> findAllByAccount_id(String account_id);
}
