package com.carpooling.frequentroute;

import com.carpooling.frequentroute.entity.FrequentPoint;
import com.carpooling.frequentroute.gripmap.MapUtility;
import com.github.chen0040.fpm.AssocRuleMiner;
import com.github.chen0040.fpm.data.ItemSets;
import com.github.chen0040.fpm.data.MetaData;
import com.github.chen0040.fpm.fpg.FPGrowth;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;
import java.io.FileNotFoundException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.*;

@SpringBootApplication
@RequiredArgsConstructor
public class FrequentrouteApplication {

    public static void main(String[] args) {
        SpringApplication.run(FrequentrouteApplication.class, args);

    }



}
