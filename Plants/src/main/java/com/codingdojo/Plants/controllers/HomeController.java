package com.codingdojo.Plants.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.AbstractBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.Plants.models.LoginUser;
import com.codingdojo.Plants.models.Plant;
import com.codingdojo.Plants.models.User;
import com.codingdojo.Plants.services.PlantService;
import com.codingdojo.Plants.services.UserService;


@Controller
public class HomeController {
	
	private final UserService userServ;
	private final PlantService plantServ;
	
	
	public HomeController(UserService userServ, PlantService plantServ ) {
		super();
		this.plantServ = plantServ;
		this.userServ = userServ;
	}


	// Login Registeration////////////
	@GetMapping("/")
	public String index(Model model, @ModelAttribute("newUser") User newuser) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
		
	}
	
	
	@GetMapping("/login")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
		
	}
	
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newuser, BindingResult result, Model model, HttpSession session) {
		userServ.register(newuser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
			
		}
		session.setAttribute("user_id",newuser.getId() );
		return "redirect:/dashboard";
		
		
	}
	
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		
		User user = userServ.login(newLogin, result); 
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		
		}
		session.setAttribute("user_id", user.getId());
		return "redirect:/dashboard";
	}
	
	
	
	
	
	
	
	
	
	
	
	//////// Dashboard////////////
	
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		
		if(session.getAttribute("user_id") != null) {
			
			model.addAttribute("allplants", plantServ.allPlants());
			model.addAttribute("user", userServ.oneUser((Long) session.getAttribute("user_id")));
			
			return "dashboard.jsp";
			
			
		}
		else {
		return " redirect:/";
		
		}		
	}
	
	
	
	
	
	
	
	////// Create Plant render  ////////////

	
	@GetMapping("/newPlant" )
	public String createplant(@ModelAttribute("plant") Plant plant, Model model, HttpSession session) {
		model.addAttribute("user", userServ.oneUser((Long) session.getAttribute("user_id")));
		return "newPlant.jsp";
		
	}
	
	
	
	
	
	
	
	
//////Create Plant processs form  ////////////


	@PostMapping("/create")
	public String ProcessPlant(@Valid @ModelAttribute("plant") Plant plant,  BindingResult result, Model model ,HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("user", userServ.oneUser((Long) session.getAttribute("user_id")));
			return "newPlant.jsp" ;
		}
		plantServ.createPlant(plant);
		return "redirect:/dashboard";
		
	}
	



	
	
	
	
	
	
	
	
//////Update Plant  ////////////
	
	
	@GetMapping("/editPlant/{id}")
	public String updatePlantForm(@PathVariable("id") Long id, @ModelAttribute("plant") Plant plant, BindingResult result, Model model, HttpSession session ) {
		model.addAttribute( "plant",plantServ.findPlant(id));
		model.addAttribute("user", userServ.oneUser((Long) session.getAttribute("user_id")));
		return "editPlant.jsp";
		
	}
	
	

////// Update Plant process ////////////
	
	@PutMapping("/editingPlant/{id}")
	public String editingplantroute( @PathVariable("id") Long id, @Valid @ModelAttribute("plant") Plant plant, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("user", userServ.oneUser((Long) session.getAttribute("user_id")));
			
			return "editPlant.jsp";
		}
		plantServ.updatePlant(plant);
		
		
		 
		return "redirect:/dashboard";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//////Show One Plant   ////////////
	
	
	@GetMapping("/onePlant/{id}")
	public String onePlant(@PathVariable("id") Long id, Model model, HttpSession session) {
		
		
		model.addAttribute("user", userServ.oneUser((Long) session.getAttribute("user_id")));
		model.addAttribute( "plant",plantServ.findPlant(id));
		
		return "onePlant.jsp";
		
	}
	
	
	
	
	
	
	
	
	
	
	
////// Delete Plant  ////////////

	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		plantServ.PlantMan(id);
		return "redirect:/dashboard";
		
	}
	

}
