package com.stephenlee.icecream.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

@Service
public class MainService {
	@Autowired
	private Environment env;
	
	public String getApiKey(String apiKey) {
		return env.getProperty(apiKey);
	}

}
