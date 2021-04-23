package com.carpooling.frequentroute.repositoryFirebase;

import com.carpooling.frequentroute.model.User;
import com.github.fabiomaffioletti.firebase.repository.DefaultFirebaseRealtimeDatabaseRepository;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository extends DefaultFirebaseRealtimeDatabaseRepository<User, String> {
}
