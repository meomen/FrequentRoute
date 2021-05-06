package com.carpooling.frequentroute.controller;

import com.carpooling.frequentroute.entity.*;
import com.carpooling.frequentroute.gripmap.MapUtility;
import com.carpooling.frequentroute.model.Offer;
import com.carpooling.frequentroute.model.Request;
import com.carpooling.frequentroute.model.User;
import com.carpooling.frequentroute.repository.*;
import com.carpooling.frequentroute.repositoryFirebase.OfferRepository;
import com.carpooling.frequentroute.repositoryFirebase.RequestRepository;
import com.carpooling.frequentroute.repositoryFirebase.UserRepository;
import com.github.fabiomaffioletti.firebase.repository.Filter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
public class DataController {

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
    private RouteRepository routeRepository;


    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RequestRepository requestRepository;
    @Autowired
    private OfferRepository offerRepository;

    private List<Route> driverRoute = new ArrayList<>();
    private List<Route> passengerRoute = new ArrayList<>();

    @GetMapping("/account")
    @ResponseBody
    public List<Account> getAllAccount() {
        return accountRepository.findAll();
    }

    @GetMapping("/account/{account_id}")
    @ResponseBody
    public Account getAccountById(@PathVariable("account_id") String accountId) {
        return accountRepository.findById(accountId).get();
    }

    @PostMapping("/account")
    @ResponseBody
    public Account addAccount(@RequestBody Account account) {
        accountRepository.save(account);
        return account;
    }

    @GetMapping("/trip")
    @ResponseBody
    public List<Trip> getAllTrip() {
        return tripRepostory.findAll();
    }

    @GetMapping("/trip/{trip_id}")
    @ResponseBody
    public Trip getTripById(@PathVariable("trip_id") UUID tripId) {
        return tripRepostory.findById(tripId).get();
    }

    @GetMapping("/trip/account_owner")
    @ResponseBody
    public List<Trip> getTripByAccountId(@RequestParam String account_owner) {
        return tripRepostory.findAllByAccount_owner(account_owner);
    }

    @PostMapping("/trip")
    @ResponseBody
    public Trip addTrip(@RequestBody Trip tripBody) {
        tripRepostory.save(tripBody);
        return tripBody;
    }

    @GetMapping("/gridtrip")
    @ResponseBody
    public List<GridTrip> getAllGridTrip() {
        return gridTripRepostory.findAll();
    }

    @GetMapping("/gridtrip/{grid_trip_id}")
    @ResponseBody
    public GridTrip getGridTripById(@PathVariable("grid_trip_id") UUID gridtripId) {
        return gridTripRepostory.findById(gridtripId).get();
    }

    @GetMapping("/gridtrip/account_id")
    public List<GridTrip> getGridTripByAccountId(@RequestParam String account_id) {
        return gridTripRepostory.findAllByAccount_id(account_id);
    }

    @GetMapping("/gridtrip/trip_id")
    public List<GridTrip> getGridTripByTripId(@RequestParam UUID trip_id) {
        return gridTripRepostory.findAllByTrip_id(trip_id);
    }

    @GetMapping("/gridtrip/account_trip_id")
    public List<GridTrip> getGridTripByAccountIdAndTripId(@RequestParam String account_id, @RequestParam UUID trip_id) {
        return gridTripRepostory.findAllByAccount_idAndTrip_id(account_id, trip_id);
    }

    @PostMapping("/gridtrip")
    @ResponseBody
    public GridTrip addGridTrip(@RequestBody GridTrip gridTrip) {
        gridTripRepostory.save(gridTrip);
        return gridTrip;
    }

    @GetMapping("/waypoint")
    @ResponseBody
    public List<Waypoint> getAllWaypoint() {
        return waypointRepostory.findAll();
    }

    @GetMapping("/waypoint/{id}")
    @ResponseBody
    public Waypoint getWaypointById(@PathVariable("id") UUID id) {
        return waypointRepostory.findById(id).get();
    }

    @GetMapping("/waypoint/on_trip")
    @ResponseBody
    public List<Waypoint> getWaypointByTripId(@RequestParam("on_trip") UUID on_trip) {
        return waypointRepostory.findAllByOn_trip(on_trip);
    }

    @PostMapping("/waypoint")
    @ResponseBody
    public Waypoint addWaypoint(@RequestBody Waypoint waypoint) {
        waypointRepostory.save(waypoint);
        return waypoint;
    }

    @GetMapping("/gridpoint/{id}")
    @ResponseBody
    public GridPoint getGridpointById(@PathVariable("id") UUID id) {
        return gridPointRepostory.findById(id).get();
    }

    @GetMapping("/gridpoint/grid_trip_id")
    @ResponseBody
    public List<GridPoint> getGridPointByGridTripId(@RequestParam("grid_trip_id") UUID grid_trip_id) {
        return gridPointRepostory.findAllByGrid_trip_id(grid_trip_id);
    }

    @PostMapping("/gridpoint")
    @ResponseBody
    public GridPoint addGridpoint(@RequestBody GridPoint gridPoint) {
        gridPointRepostory.save(gridPoint);
        return gridPoint;
    }

    @GetMapping("/frequentroute")
    @ResponseBody
    public List<FrequentRoute> getAllFrequentRoute() {
        return frequentRouteRepostory.findAll();
    }

    @GetMapping("/frequentroute/{id}")
    @ResponseBody
    public FrequentRoute getFrequentRouteById(@PathVariable("id") UUID id) {
        return frequentRouteRepostory.findById(id).get();
    }

    @GetMapping("/frequentroute/account_id")
    @ResponseBody
    public List<FrequentRoute> getFrequentRouteByAccountId(@RequestParam String account_id) {
        return frequentRouteRepostory.findAllByAccount_id(account_id);
    }

    @PostMapping("/frequentroute")
    @ResponseBody
    public FrequentRoute addFrequentRoute(@RequestBody FrequentRoute frequentRoute) {
        frequentRouteRepostory.save(frequentRoute);
        return frequentRoute;
    }

    @GetMapping("/route")
    @ResponseBody
    public List<Route> getAllRoute() {
        return routeRepository.findAll();
    }

    @GetMapping("/route/{id}")
    @ResponseBody
    public Route getRouteById(@PathVariable("id") int id) {
        return routeRepository.findById(id).get();
    }

    @GetMapping("/route/account_id")
    @ResponseBody
    public List<Route> getRouteByAccountId(@RequestParam String account_id) {
        return routeRepository.findAllByAccount_id(account_id);
    }

    @GetMapping("/route/frequent_route_id")
    @ResponseBody
    public Route getRouteByFrequentRoute(@RequestParam UUID frequent_route_id) {
        return routeRepository.findAllByFrequent_route_id(frequent_route_id);
    }

    @PostMapping("/route")
    @ResponseBody
    public Route addRoute(@RequestBody Route route) {
        routeRepository.save(route);
        return route;
    }

    @Transactional
    @PutMapping("/route/is_shared")
    public void updateIsShared(@RequestParam int is_shared, @RequestParam String type_shared, @RequestParam int id, @RequestParam String account_id) {
        try {
            routeRepository.updateIsSharedAndTypeShare(is_shared, type_shared, id);
        } finally {
            if (is_shared == 1) {
                User user = userRepository.get(account_id, new Object());
                Route currentRoute = routeRepository.findById(id).get();
                List<FrequentRoute> listFR = new ArrayList<>();

                if (type_shared.equals("Participant")) {
                    listFR = frequentRouteRepostory.getFrequentRouteParticipant(account_id);
                } else if (type_shared.equals("Passenger")) {
                    listFR = frequentRouteRepostory.getFrequentRoutePassengerAndDiver(account_id, "Driver");
                } else {
                    listFR = frequentRouteRepostory.getFrequentRoutePassengerAndDiver(account_id, "Passenger");
                }

                if (!listFR.isEmpty()) {
                    matchingRoute(currentRoute.getFrequent_route_id(), listFR, type_shared);
                }

                boolean flag_continue = true;
                if (!driverRoute.isEmpty()) {
                    List<Offer> offers = offerRepository.findAll(new Object());
                    for (Route route : driverRoute) {
                        Offer offerAvailable = MapUtility.checkAvailableSeatOffer(offers, route.getAccount_id(), route.getAddress_start(), route.getAddress_end());
                        if (offerAvailable != null) {
                            createRequest(user, offerAvailable, currentRoute);
                            flag_continue = false;
                            break;
                        }
                    }
                }
                if (!passengerRoute.isEmpty() && flag_continue) {
                    Offer offer = createOffer(user, currentRoute);
                    for (Route route : passengerRoute) {
                        User anotherUser = userRepository.get(route.getAccount_id(), new Object());
                        createRequest(anotherUser, offer, route);
                        try {
                            routeRepository.updateIsShared(2, route.getId());
                        } finally {
                            continue;
                        }
                    }
                }
            } else {
                User user = userRepository.get(account_id, new Object());
                Route currentRoute = routeRepository.findById(id).get();
                if (type_shared.equals("Participant")) {
                    if (currentRoute.getIs_shared() == 1) {

                    } else if (currentRoute.getIs_shared() == 2) {
                        deleteRequest(user, currentRoute);
                    }
                } else if (type_shared.equals("Passenger")) {
                    deleteRequest(user, currentRoute);
                } else {
                    deleteOffer(user, currentRoute);
                }
            }
        }
    }


    private void matchingRoute(UUID currentFrId, List<FrequentRoute> listFR, String type_shared) {

        List<FrequentPoint> currentPoint = frequentPointRepostory.findAllByFrequentRoute(currentFrId);

        for (FrequentRoute fr : listFR) {

            List<FrequentPoint> anotherPoint = frequentPointRepostory.findAllByFrequentRoute(fr.getId());
            List<String> currentString = new ArrayList<>();
            List<String> anotherString = new ArrayList<>();
            MapUtility.covertFrequentPointToString(currentPoint, currentString);
            MapUtility.covertFrequentPointToString(anotherPoint, anotherString);

            if (type_shared.equals("Passenger")) {
                if (anotherString.containsAll(currentString)) {
                    Route route = routeRepository.findAllByFrequent_route_id(fr.getId());
                    driverRoute.add(route);
                }
            } else if (type_shared.equals("Diver")) {
                if (currentString.containsAll(anotherString)) {
                    Route route = routeRepository.findAllByFrequent_route_id(fr.getId());
                    passengerRoute.add(route);
                }
            } else {
                if (currentString.containsAll(anotherString)) {
                    Route route = routeRepository.findAllByFrequent_route_id(fr.getId());
                    passengerRoute.add(route);
                } else {
                    if (anotherString.containsAll(currentString)) {
                        Route route = routeRepository.findAllByFrequent_route_id(fr.getId());
                        driverRoute.add(route);
                    }
                }
            }
        }
    }

    public void createRequest(User user, Offer offer, Route route) {
        Request request = new Request();
        request.setUser_id(user.getUser_id());
        request.setAccepted(true);
        request.setUsername(user.getUsername());
        request.setDateOfJourney(offer.getDateOfJourney());
        request.setPickupTime(route.getTime_start());
        request.setPickupLocation(route.getAddress_start());
        request.setSeats(1);
        request.setDestination(route.getAddress_end());
        request.setLocation(offer.getCurrentLocation());
        request.setLuggage(1);
        request.setRide_id(offer.getRideID());
        request.setLicencePlate(offer.getLicencePlate());
        request.setProfile_photo(user.getProfile_photo());

        double cost = route.getLength_route() * MapUtility.COST_OF_KM;
        request.setCost((float) cost);

        request.setId(offer.getRideID() + "/" + user.getUser_id());
        requestRepository.set(request, new Object());
        offer.setId(offer.getRideID());
        offer.setSeatsAvailable(offer.getSeatsAvailable() - 1);
        offerRepository.update(offer, new Object());
    }

    public Offer createOffer(User user, Route route) {
        Offer offer = new Offer();
        offer.setRideID(UUID.randomUUID().toString());
        offer.setUser_id(user.getUser_id());
        offer.setUsername(user.getUsername());
        offer.setCurrentLocation(route.getAddress_start());
        offer.setDestination(route.getAddress_end());
        offer.setDateOfJourney("Every day");
        offer.setSeatsAvailable(user.getSeats());
        offer.setLicencePlate(user.getRegistration_plate());
        offer.setLuggageAllowance(10);
        offer.setCar(user.getCar());
        offer.setPickupTime(route.getTime_start());
        offer.setProfile_picture(user.getProfile_photo());
        offer.setCompleteRides(0);
        offer.setUserRating(user.getUserRating());
        offer.setDuration("30 mins");
        offer.setExtraTime(5);
        offer.setSameGender(false);

        double cost = route.getLength_route() * MapUtility.COST_OF_KM;
        offer.setCost((int) cost);

        offer.setId(offer.getRideID());

        return offerRepository.set(offer, new Object());
    }

    private void deleteRequest(User user, Route currentRoute) {
        List<Request> requests = requestRepository.findAll(new Object());
        for (Request request : requests) {
            if (request.getUser_id().equals(user.getUser_id())
                    && request.getPickupLocation().equals(currentRoute.getAddress_start())
                    && request.getDestination().equals(currentRoute.getAddress_end())) {
                try {
                    UUID uuid = UUID.fromString(request.getRide_id());
                    String id = request.getRide_id() + "/" + user.getUser_id();
                    requestRepository.remove(id, new Object());
                } catch (IllegalArgumentException exception) {
                }
            }
        }
    }

    private void deleteRequest(String ride_Id) {
        List<Request> requests = requestRepository.findAll(new Object());
        for (Request request : requests) {
            if (request.getRide_id().equals(ride_Id)) {
                try {
                    UUID uuid = UUID.fromString(request.getRide_id());
                    String id = request.getRide_id() + "/" + request.getUser_id();
                    requestRepository.remove(id, new Object());
                    List<Route> listRoute = routeRepository.findRouteByRequest(request.getUser_id(), request.getPickupLocation(), request.getDestination());
                    for (Route route : listRoute) {
                        try {
                            routeRepository.updateIsShared(1, route.getId());
                        } finally {
                            continue;
                        }
                    }
                } catch (IllegalArgumentException exception) {
                }
            }
        }
    }

    private void deleteOffer(User user, Route currentRoute) {
        List<Offer> offers = offerRepository.findAll(new Object());
        for (Offer offer : offers) {
            if (offer.getUser_id().equals(user.getUser_id())
                    && offer.getCurrentLocation().equals(currentRoute.getAddress_start())
                    && offer.getDestination().equals(currentRoute.getAddress_end())) {
                try {
                    UUID uuid = UUID.fromString(offer.getRideID());
                    offerRepository.remove(offer.getRideID(), new Object());
                    deleteRequest(offer.getRideID());

                } catch (IllegalArgumentException exception) {
                }
            }
        }
    }

}
