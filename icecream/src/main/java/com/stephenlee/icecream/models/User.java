package com.stephenlee.icecream.models;



import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private Boolean admin;
    
    @NotEmpty(message = "Name must not be blank")
	private String name;
	@NotEmpty(message = "Email must not be blank")
	@Email(message = "Email must be in valid format")
	private String email;

	@NotNull(message = "Password must not be blank")
	@Size(min = 8, message = "Password must be at lease 8 characters long")
	private String password;

	@Transient
	@NotNull(message = "Confirm Password must not be blank")
	@Size(min = 8, message = "Confirm Password must be at lease 8 characters long")
	private String passwordConfirm;
    
    @ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "favorite_flavors", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "flavor_id"))
	private List<Flavor> favoriteFlavors;
    
    // This will not allow the createdAt column to be updated after creation
    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    public User() {
    }

    // TODO CREATE CONSTRUCTORS, GETTERS & SETTERS

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	
	

	public List<Flavor> getFavoriteFlavors() {
		return favoriteFlavors;
	}

	public void setFavoriteFlavors(List<Flavor> favoriteFlavors) {
		this.favoriteFlavors = favoriteFlavors;
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
    
}
