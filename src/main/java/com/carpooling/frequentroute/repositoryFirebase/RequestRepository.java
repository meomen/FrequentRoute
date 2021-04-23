package com.carpooling.frequentroute.repositoryFirebase;

import com.carpooling.frequentroute.model.Request;
import com.github.fabiomaffioletti.firebase.repository.DefaultFirebaseRealtimeDatabaseRepository;
import org.springframework.stereotype.Repository;

@Repository
public class RequestRepository extends DefaultFirebaseRealtimeDatabaseRepository<Request, String> {
}
