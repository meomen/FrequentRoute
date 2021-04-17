package com.carpooling.frequentroute.controller;

import com.carpooling.frequentroute.entity.Account;
import com.carpooling.frequentroute.entity.GridTrip;
import com.carpooling.frequentroute.repository.AccountRepository;
import com.carpooling.frequentroute.repository.GridTripRepostory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class DataController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private GridTripRepostory gridTripRepostory;


    @GetMapping("/account")
    @ResponseBody
    public List<Account> getAccount () {
        return accountRepository.findAll();
    }

    @PostMapping("/gridtrip")
    @ResponseBody
    public GridTrip addGridTrip (@RequestBody GridTrip gridTrip) {
        gridTripRepostory.save(gridTrip);
        return gridTrip;
    }

    @GetMapping("/gridtrip")
    @ResponseBody
    private List<GridTrip> getGridTrip () {
        return gridTripRepostory.findAll();
    }

}
