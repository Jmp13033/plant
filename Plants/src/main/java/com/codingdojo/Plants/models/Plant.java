package com.codingdojo.Plants.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="plants")
public class Plant {
	
	
	
	// generating ID
			@Id
			@GeneratedValue(strategy= GenerationType.IDENTITY)
			private Long id;
		
			
			// generating the values of the Table 
			@NotEmpty
			@Size(min=5, max=15, message=" plant name needs to be bigger than 5 letters ")
			private String name;
				

			@NotEmpty
			@Size(min=5, max=30, message="needs to be bigger than 5 letters ")
			private String schedule;
			
			@NotEmpty
			@Size(min=5, max=30, message="needs to be bigger than 5 letters ")
			private String description;
			
			 @ManyToOne(fetch = FetchType.LAZY)
			    @JoinColumn(name="user_id")
			    private User user;
			 
			 
			 
			 
			 
			 
			

			
		public Long getId() {
				return id;
			}

			public void setId(Long id) {
				this.id = id;
			}

			public String getName() {
				return name;
			}

			public void setName(String name) {
				this.name = name;
			}

			public String getSchedule() {
				return schedule;
			}

			public void setSchedule(String schedule) {
				this.schedule = schedule;
			}

			public String getDescription() {
				return description;
			}

			public void setDescription(String description) {
				this.description = description;
			}

			public User getUser() {
				return user;
			}

			public void setUser(User user) {
				this.user = user;
			}

			public Date getCreatedAt() {
				return createdAt;
			}

			public void setCreatedAt(Date createdAt) {
				this.createdAt = createdAt;
			}

			public Date getUpdatedAt() {
				return updatedAt;
			}

			public void setUpdatedAt(Date updatedAt) {
				this.updatedAt = updatedAt;
			}

		

		
		public Plant() {
				super();
			}

	

		/////////	/////////	/////////	/////////	/////////	/////////	/////////	/////////	/////////	/////////	/////////		
		
			
			
			
			
			
			
			
			
			
			
			////////////////////////
			
			
			
			// updated/ created at /////////////
			@Column(updatable=false)
			@DateTimeFormat(pattern="yyyy-MM-dd")
			private Date createdAt;
			
			
			@DateTimeFormat(pattern="yyyy-MM-dd")
			private Date updatedAt;
			
			

			
			@PrePersist
			protected void onCreate() {
				this.createdAt = new Date();
			}

			@PreUpdate
			protected void onUpdate() {
				this.updatedAt = new Date();
			}
			
		
	
	
	
	
	
	
	
	
	
	



}
