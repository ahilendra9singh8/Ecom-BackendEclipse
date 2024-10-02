package com.apogee.services;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.apogee.EntityModel.Roles;
import com.apogee.EntityModel.User;
import com.apogee.Exception.ResourceNotFoundException;
import com.apogee.payload.UserDto;
import com.apogee.repository.RoleRepository;
import com.apogee.repository.UserRepository;

/**
 *
 * @author lENOVO
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepo;
	@Autowired
	RoleRepository roleRepository;
	@Autowired
	private ModelMapper mapper;
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public UserDto createUser(UserDto userDto) {
		UserDto saveUserDto = null;
		try {
			// UserDto to User
			User user = this.mapper.map(userDto, User.class);
			// password decrypt
			String pass = user.getPassword();
			String encode = this.passwordEncoder.encode(pass);
			user.setPassword(encode);
			

			List<Roles> roles = user.getRole();
			List<Roles> rolesToSave = new ArrayList<>();
			if (roles.isEmpty()) {
				Roles r = new Roles();
				r.setRoleId(4);
				r.setRoleName("ROLE_USER");
				roles.add(r);
			}

			for (Roles role : roles) {
				Roles existingRole = roleRepository.findByRoleName(role.getRoleName());
				if (existingRole == null) {
					Roles savedRole = roleRepository.save(role);
					rolesToSave.add(savedRole);
				} else {
					rolesToSave.add(existingRole);
				}
			}
			user.setRole(rolesToSave);

			// save
			User saveUser = this.userRepo.save(user);
			// User to UserDto
			saveUserDto = this.mapper.map(saveUser, UserDto.class);

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return saveUserDto;
	}

	@Override
	public UserDto getUserById(int userId) {
		UserDto userdto = null;
		try {
			User getUserById = userRepo.findById(userId)
					.orElseThrow(() -> new ResourceNotFoundException(+userId + "--from this userId User not found"));
			userdto = this.mapper.map(getUserById, UserDto.class);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return userdto;
	}

	@Override
	public void deleteUser(int userId) {
		try {
			userRepo.deleteById(userId);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}

	@Override
	public List<UserDto> getAllUser() {
		List<UserDto> findAllDto = null;
		try {
			List<User> viewAllUser = userRepo.findAll();
			findAllDto = viewAllUser.stream().map(user -> this.mapper.map(user, UserDto.class))
					.collect(Collectors.toList());
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return findAllDto;
	}

	@Override
	public UserDto updateUser(UserDto userDto, int userId) {
		UserDto c = null;
		try {
			User newUser = this.mapper.map(userDto, User.class);
			User oldUser = this.userRepo.findById(userId).orElseThrow(
					() -> new ResourceNotFoundException(+userId + "--from this categoryId category not found"));
			;
			oldUser.setName(newUser.getName());
			oldUser.setEmail(newUser.getEmail());
			oldUser.setPassword(newUser.getPassword());
			oldUser.setAddress(newUser.getAddress());
			oldUser.setAbout(newUser.getAbout());
			oldUser.setPhone(newUser.getPhone());
			oldUser.setGender(newUser.getGender());
			oldUser.setRole(newUser.getRole());
//        oldUser.setActive(newUser.getActive());

			User user = userRepo.save(oldUser);
			c = this.mapper.map(user, UserDto.class);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public User validateUser(String email, String password) {
		User user = null;
		try {
			user = userRepo.findByEmailAndPassword(email, password);

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return user;
	}
}
