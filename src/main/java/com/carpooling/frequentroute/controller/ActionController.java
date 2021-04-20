package com.carpooling.frequentroute.controller;

import com.carpooling.frequentroute.entity.*;
import com.carpooling.frequentroute.gripmap.MapUtility;
import com.carpooling.frequentroute.repository.*;
import com.github.chen0040.fpm.data.ItemSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

@Controller
public class ActionController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private TripRepostory tripRepostory;

    @Autowired
    private GridTripRepostory gridTripRepostory;

    @Autowired
    private WaypointRepostory waypointRepostory;


    @Autowired
    private GridPointRepostory gridPointRepostory;

    @Autowired
    private FrequentRouteRepostory frequentRouteRepostory;

    @Autowired
    private FrequentPointRepostory frequentPointRepostory;


    @GetMapping("/createGridTrip")
    @ResponseBody
    public String createGridTrip(@RequestParam("account_id") String account_id) {

        long startingTime = System.currentTimeMillis();

        List<Trip> tripList = tripRepostory.findAllByAccount_owner(account_id);
        for (Trip trip : tripList) {

            long count = gridTripRepostory.countGridTrip(trip.getTrip_id());

            if (count > 0) {
            } else {
                GridTrip newGridTrip = new GridTrip();
                newGridTrip.setTrip_id(trip.getTrip_id());
                newGridTrip.setAccount_id(account_id);
                newGridTrip.setDate(trip.getDate());
                newGridTrip.setWeekday(trip.getWeekday());
                gridTripRepostory.save(newGridTrip);

                List<GridPoint> gridPointList = new ArrayList<>();

                List<Waypoint> waypoints = waypointRepostory.findAllByOn_trip(trip.getTrip_id());
                if (waypoints != null && !waypoints.isEmpty()) {
                    gridPointList = MapUtility.tranformTriptoGrid(waypoints, newGridTrip.getId());
                }
                gridPointRepostory.saveAll(gridPointList);
            }
        }

        long endingTime = System.currentTimeMillis();
        String resultTime = "Running time: " + (endingTime - startingTime)/1000.0+"s";
        return resultTime;

    }

    @GetMapping("/findFrequentRoute")
    @ResponseBody
    public String findFrequentRoute(@RequestParam("account_id") String account_id,
                                  @RequestParam("min_support") int min_support,
                                  @RequestParam("min_length") int min_length) {
        long startingTime = System.currentTimeMillis();

        List<FrequentRoute> routeList = frequentRouteRepostory.findAllByAccount_id(account_id);
        // Delete Route
        if (!routeList.isEmpty()) frequentRouteRepostory.deleteAllByAccount_id(account_id);
        for (FrequentRoute route : routeList) {
            frequentPointRepostory.deleteAllByFrequentRoute(route.getId());
        }

        // DataMining
        List<List<GridPoint>> gridmap = new ArrayList<>();
        List<GridTrip> gridTripList = gridTripRepostory.findAllByAccount_id(account_id);
        if (gridTripList == null || gridTripList.isEmpty()) return "fail";
        for (GridTrip gridTrip : gridTripList) {
            List<GridPoint> gridPointList = gridPointRepostory.findAllByGrid_trip_id(gridTrip.getId());
            if (gridPointList == null || gridPointList.isEmpty()) continue;
            gridmap.add(gridPointList);
        }
        List<ItemSet> itemSets = MapUtility.findFrequentRoute(gridmap, min_support, min_length);

        for (ItemSet itemSet : itemSets) {
            itemSet.getItems().sort(new Comparator<String>() {
                @Override
                public int compare(String o1, String o2) {
                    String a = o1.substring(1,o1.length()-1);
                    String b = o2.substring(1,o2.length()-1);
                    String[] arrString = a.split(":");
                    a = arrString[2];
                    arrString = b.split(":");
                    b = arrString[2];
                    return a.compareTo(b);
                }
            });
            System.out.println("itemset:"+ itemSet);
        }

        //Save
        for (ItemSet itemSet : itemSets) {

            FrequentRoute frequentRoute = new FrequentRoute();
            frequentRoute.setAccount_id(account_id);
            frequentRouteRepostory.save(frequentRoute);

            for (String s : itemSet.getItems()) {
                FrequentPoint frequentPoint = MapUtility.createFrequentPoint(s,frequentRoute.getId());
                frequentPointRepostory.save(frequentPoint);
            }
        }

        long endingTime = System.currentTimeMillis();
        String resultTime = "Running time: " + (endingTime - startingTime)/1000.0 +"s";
        return resultTime;
    }
}
