package com.stephenlee.icecream.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stephenlee.icecream.models.Topping;

@Repository
public interface ToppingRepository extends CrudRepository<Topping, Long> {
    // this method retrieves all the books from the database
    List<Topping> findAll();
}