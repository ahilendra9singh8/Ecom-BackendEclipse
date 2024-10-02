package com.apogee.EntityModel;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
//@Getter
//@Setter
//@AllArgsConstructor
public class Roles {

	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "role_id", nullable = false)
	private int roleId;

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<User> getUser() {
		return user;
	}

	public void setUser(Set<User> user) {
		this.user = user;
	}

	@Column(name = "role_name", nullable = false)
	private String roleName;

	@ManyToMany(mappedBy = "role")
	Set<User> user = new HashSet<>();
}
