package com.carpooling.frequentroute.controller;

import com.carpooling.frequentroute.entity.*;
import com.carpooling.frequentroute.gripmap.MapUtility;
import com.carpooling.frequentroute.model.ResultFR;
import com.carpooling.frequentroute.repository.*;
import com.carpooling.frequentroute.repositoryFirebase.RequestRepository;
import com.carpooling.frequentroute.repositoryFirebase.UserRepository;
import com.github.chen0040.fpm.data.ItemSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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

    @Autowired
    private RequestRepository requestRepository;

    @Autowired
    private UserRepository userRepository;

    @ModelAttribute
    public void setResponseHeader(HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", "*");
    }


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
        String resultTime = "Running time: " + (endingTime - startingTime) / 1000.0 + "s";
        return resultTime;

    }

    @Transactional
    @GetMapping("/findFrequentRoute")
    @ResponseBody
    public ResultFR findFrequentRoute(
                                      @RequestParam("type_search") String type_search,
                                      @RequestParam("account_id") String account_id,
                                      @RequestParam("min_support") float min_support,
                                      @RequestParam("min_length") int min_length) {
        if (type_search.equals("Name")) {
            List<Account> accountList = accountRepository.getAccountByName(account_id);
            if (accountList != null) account_id = accountList.get(0).getAccount_id();
        }

        ResultFR result = new ResultFR();
        result.setRuntime("");
        result.setData("");
        long startingTime = System.currentTimeMillis();

        List<FrequentRoute> routeList = frequentRouteRepostory.findAllByAccount_id(account_id);
        // Delete Route
        if (!routeList.isEmpty()) {
            frequentRouteRepostory.deleteAllByAccount_id(account_id);
        }
        for (FrequentRoute route : routeList) {
            frequentPointRepostory.deleteAllByFrequentRoute(route.getId());
        }

        // DataMining
        List<List<GridPoint>> gridmap = new ArrayList<>();
        List<GridTrip> gridTripList = gridTripRepostory.findAllByAccount_id(account_id);
        if (gridTripList == null || gridTripList.isEmpty()) {
            result.setData("fail");
            result.setRuntime("fail");
            return result;
        }
        for (GridTrip gridTrip : gridTripList) {
            List<GridPoint> gridPointList = gridPointRepostory.findAllByGrid_trip_id(gridTrip.getId());
            if (gridPointList == null || gridPointList.isEmpty()) continue;
            gridmap.add(gridPointList);
        }
        int support = (int) (min_support * (float) gridTripList.size());
        List<ItemSet> itemSets = MapUtility.findFrequentRoute(gridmap, support, min_length);
        int index = 0;
        for (ItemSet itemSet : itemSets) {
            index++;
            itemSet.getItems().sort(new Comparator<String>() {
                @Override
                public int compare(String o1, String o2) {
                    String a = o1.substring(1, o1.length() - 1);
                    String b = o2.substring(1, o2.length() - 1);
                    String[] arrString = a.split(":");
                    a = arrString[2];
                    arrString = b.split(":");
                    b = arrString[2];
                    return a.compareTo(b);
                }
            });
            String data = "Route" + index + ": " + itemSet + " \n";
            result.setData(result.getData() + data);
        }
        long endingTime = System.currentTimeMillis();
        //Save
        for (ItemSet itemSet : itemSets) {

            FrequentRoute frequentRoute = new FrequentRoute();
            frequentRoute.setAccount_id(account_id);
            frequentRouteRepostory.save(frequentRoute);

            for (String s : itemSet.getItems()) {
                FrequentPoint frequentPoint = MapUtility.createFrequentPoint(s, frequentRoute.getId());
                frequentPointRepostory.save(frequentPoint);
            }
        }

        String resultTime = (endingTime - startingTime) / 1000.0 + " (s)";
        result.setRuntime(resultTime);
        return result;
    }


    @GetMapping("/grid_map/trip/all")
    @ResponseBody
    public List<List<Waypoint>> getAllTripOfAccount(@RequestParam String type_search, @RequestParam String account_id) {
        if (type_search.equals("Name")) {
            List<Account> accountList = accountRepository.getAccountByName(account_id);
            if (accountList != null) account_id = accountList.get(0).getAccount_id();
        }
        List<List<Waypoint>> result = new ArrayList<>();

        List<Trip> tripList = tripRepostory.findAllByAccount_owner(account_id);
        for (Trip trip : tripList) {
            List<Waypoint> waypoints = waypointRepostory.findAllByOn_trip(trip.getTrip_id());
            result.add(waypoints);
        }
        return result;
    }

    @GetMapping("/grid_map/trip/date")
    @ResponseBody
    public List<List<Waypoint>> getAllTripOfAccountAndDate(@RequestParam String type_search, @RequestParam String account_id, @RequestParam String date) throws ParseException {
        if (type_search.equals("Name")) {
            List<Account> accountList = accountRepository.getAccountByName(account_id);
            if (accountList != null) account_id = accountList.get(0).getAccount_id();
        }
        List<List<Waypoint>> result = new ArrayList<>();
        Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        List<Trip> tripList = tripRepostory.findAllByAccount_ownerAndDate(account_id, date1);
        for (Trip trip : tripList) {
            List<Waypoint> waypoints = waypointRepostory.findAllByOn_trip(trip.getTrip_id());
            result.add(waypoints);
        }
        return result;
    }

    @GetMapping("/grid_map/grid/all")
    @ResponseBody
    public List<List<GridPoint>> getAllGripOfAccount(@RequestParam String type_search, @RequestParam String account_id) {
        if (type_search.equals("Name")) {
            List<Account> accountList = accountRepository.getAccountByName(account_id);
            if (accountList != null) account_id = accountList.get(0).getAccount_id();
        }

        List<List<GridPoint>> result = new ArrayList<>();
        List<GridTrip> gridTripList = gridTripRepostory.findAllByAccount_id(account_id);
        for (GridTrip gridTrip : gridTripList) {
            List<GridPoint> gridPoints = gridPointRepostory.findAllByGrid_trip_id(gridTrip.getId());
            result.add(gridPoints);
        }
        return result;
    }

    @GetMapping("/grid_map/grid/date")
    @ResponseBody
    public List<List<GridPoint>> getAllGripOfAccountAndDate(@RequestParam String type_search, @RequestParam String account_id, @RequestParam String date) throws ParseException {
        if (type_search.equals("Name")) {
            List<Account> accountList = accountRepository.getAccountByName(account_id);
            if (accountList != null) account_id = accountList.get(0).getAccount_id();
        }
        List<List<GridPoint>> result = new ArrayList<>();
        Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        List<GridTrip> gridTripList = gridTripRepostory.findAllByAccount_idAnDate(account_id, date1);
        for (GridTrip gridTrip : gridTripList) {
            List<GridPoint> gridPoints = gridPointRepostory.findAllByGrid_trip_id(gridTrip.getId());
            result.add(gridPoints);
        }
        return result;
    }

    @GetMapping("/grid_map/frequent_route")
    @ResponseBody
    public List<List<FrequentPoint>> getAllFrequent(@RequestParam String type_search, @RequestParam String account_id) {
        if (type_search.equals("Name")) {
            List<Account> accountList = accountRepository.getAccountByName(account_id);
            if (accountList != null) account_id = accountList.get(0).getAccount_id();
        }
        List<List<FrequentPoint>> result = new ArrayList<>();
        List<FrequentRoute> frequentRoutes = frequentRouteRepostory.findAllByAccount_id(account_id);
        for (FrequentRoute frequentRoute : frequentRoutes) {
            List<FrequentPoint> frequentPoints = frequentPointRepostory.findAllByFrequentRoute(frequentRoute.getId());
            result.add(frequentPoints);
        }
        return result;
    }

}
