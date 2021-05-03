package com.carpooling.frequentroute.repository;

import com.carpooling.frequentroute.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountRepository extends JpaRepository<Account,String> {

    @Query(value = "select * from account where user_name = ?1", nativeQuery = true)
    List<Account> getAccountByName (String user_name);
}