package com.stephenlee.icecream.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stephenlee.icecream.models.Flavor;

@Repository
public interface FlavorRepository extends CrudRepository<Flavor, Long> {
    // this method retrieves all the books from the database
    List<Flavor> findAll();
    
    Optional<Flavor> findByName(String name);
}