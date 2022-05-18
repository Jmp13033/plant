package com.codingdojo.Plants.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.Plants.models.Plant;
import com.codingdojo.Plants.repositories.PlantRepository;

@Service
public class PlantService {
	// injection the Repository 
private final PlantRepository PlantRepo;
	

	public PlantService(PlantRepository PlantRepo) {
		this.PlantRepo = PlantRepo;
		
	}
	
	// Find All Plant From Repo 
	
	public List<Plant> allPlants()
	{
		return PlantRepo.findAll();
		
	}
	
	// Create Plant 
	public Plant createPlant(Plant b) {
		return PlantRepo.save(b);
	}
	
	
	/// Find one Plant 
	
	public Plant findPlant(Long id) {
		Optional<Plant> optPlant = PlantRepo.findById(id);
		if(optPlant.isPresent()) {
			return optPlant.get();
			
		}
		
		else {
			return null;
		}
		
	}
	
	
	// update Plant 
	public Plant updatePlant(Plant b) {
			return PlantRepo.save(b);
		}
		
		
	
	// Delete Plant 
		public void PlantMan(Long id) {
			
			PlantRepo.deleteById(id);
		}
	

}

