/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.apogee.services;

import com.apogee.EntityModel.User;
import com.apogee.payload.UserDto;
import java.util.List;

/**
 *
 * @author lENOVO
 */
public interface UserService {

	public UserDto createUser(UserDto userDto);

	public UserDto getUserById(int userId);

	public void deleteUser(int userId);

	public List<UserDto> getAllUser();

	public UserDto updateUser(UserDto userDto, int userId);

	public User validateUser(String username, String password);
}
