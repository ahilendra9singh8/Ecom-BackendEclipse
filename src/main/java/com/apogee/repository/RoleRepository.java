package com.apogee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.apogee.EntityModel.Roles;

public interface RoleRepository extends JpaRepository<Roles, Integer> {
	Roles findByRoleName(String rolename);

}
