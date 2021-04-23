package com.carpooling.frequentroute.repositoryFirebase;

import com.carpooling.frequentroute.model.Offer;
import com.github.fabiomaffioletti.firebase.repository.DefaultFirebaseRealtimeDatabaseRepository;
import org.springframework.stereotype.Repository;

@Repository
public class OfferRepository extends DefaultFirebaseRealtimeDatabaseRepository<Offer, String> {
}
