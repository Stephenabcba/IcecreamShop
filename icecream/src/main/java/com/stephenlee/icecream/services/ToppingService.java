package com.stephenlee.icecream.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stephenlee.icecream.models.Topping;
import com.stephenlee.icecream.repositories.ToppingRepository;

@Service
public class ToppingService {
    @Autowired
    private ToppingRepository toppingRepo;

    // returns all the toppings
    public List<Topping> allToppings() {
        return toppingRepo.findAll();
    }
    // creates a topping
    public Topping createTopping(Topping e) {
        return toppingRepo.save(e);
    }
    // retrieves a topping
    public Topping findTopping(Long id) {
        Optional<Topping> optionalTopping = toppingRepo.findById(id);
        if(optionalTopping.isPresent()) {
            return optionalTopping.get();
        } else {
            return null;
        }
    }
    
    public Topping updateTopping(Long id, Topping newTopping) {
        Optional<Topping> optionalTopping = toppingRepo.findById(id);
        if(optionalTopping.isPresent()) {
            Topping topping = optionalTopping.get();
            // TODO add all attributes from new model into the instance
            return toppingRepo.save(topping);
        } else {
            return null;
        }
    }
    
    public void deleteTopping(Long id) {
        toppingRepo.deleteById(id);
    }
}

