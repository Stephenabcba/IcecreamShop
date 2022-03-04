package com.stephenlee.icecream.services;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.stephenlee.icecream.models.Flavor;
import com.stephenlee.icecream.repositories.FlavorRepository;

@Service
public class FlavorService {
    @Autowired
    private FlavorRepository flavorRepo;
    

    @Autowired
    private MainService mainService;
    

    // returns all the flavors
    public List<Flavor> allFlavors() {
        return flavorRepo.findAll();
    }
    // creates a flavor
    public Flavor createFlavor(Flavor e) {
        return flavorRepo.save(e);
    }
    
    public Flavor createFlavor(Flavor flavor, MultipartFile multipartFile, BindingResult result) {
    	if (multipartFile.isEmpty()) {
			result.rejectValue("file","fileError", "Your icecream should have a picture to go with it!");
		}
    	Optional<Flavor> optionalFlavor = flavorRepo.findByName(flavor.getName());
    	if (optionalFlavor.isPresent()) {
    		result.rejectValue("name", "unique name", "Icecream Flavors should have unique names!");
    	}
    	if (result.hasErrors()) {
    		return null;
    	}
    	String fileName = StringUtils.stripFilenameExtension(StringUtils.cleanPath(multipartFile.getOriginalFilename()));
    	// line below was used for saving image to local server.
		// FileUploadUtil.saveFile("./testLocation", fileName, multipartFile);
    	try {
    		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
    	    		  "cloud_name", "stephenabcba",
    	    		  "api_key", mainService.getApiKey("CLOUDINARY_API_KEY"),
    	    		  "api_secret", mainService.getApiKey("CLOUDINARY_SECRET_KEY")));
			Map uploadResult = cloudinary.uploader().upload(multipartFile.getBytes(),
					  ObjectUtils.asMap("public_id", "icecream/" +fileName));
			String imageUrl = uploadResult.get("url").toString();
			flavor.setImageUrl(imageUrl);
			flavorRepo.save(flavor);
		} catch (IOException e) {
			result.rejectValue("file","fileError", "Unable to upload image!");
		}
    	return flavorRepo.save(flavor);
    }
    
    // retrieves a flavor
    public Flavor findFlavor(Long id) {
        Optional<Flavor> optionalFlavor = flavorRepo.findById(id);
        if(optionalFlavor.isPresent()) {
            return optionalFlavor.get();
        } else {
            return null;
        }
    }
    
    public Flavor updateFlavor(Long id, Flavor newFlavor) {
        Optional<Flavor> optionalFlavor = flavorRepo.findById(id);
        if(optionalFlavor.isPresent()) {
            Flavor flavor = optionalFlavor.get();
            // TODO add all attributes from new model into the instance
            return flavorRepo.save(flavor);
        } else {
            return null;
        }
    }
    
    public void deleteFlavor(Long id) {
        flavorRepo.deleteById(id);
    }
    
    public Flavor findFlavorByName(String name) {
    	Optional<Flavor> optionalFlavor = flavorRepo.findByName(name);
    	if (optionalFlavor.isPresent()) {
    		return optionalFlavor.get();
    	} else {
    		return null;
    	}
    }
}

