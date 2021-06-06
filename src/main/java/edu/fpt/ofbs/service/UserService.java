package edu.fpt.ofbs.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fpt.ofbs.entities.User;
import edu.fpt.ofbs.models.UserDTO;
import edu.fpt.ofbs.repositories.UserRepository;
//import edu.fpt.ofbs.service.UserService;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;

//	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User save(User user) {
		return userRepository.save(user);
	}

//	@Override
	public User findByPhoneNumberLogin(String phoneNumber) {
		return userRepository.findByPhoneNumberLogin(phoneNumber);
	}
	
	public UserDTO findByPhoneNumberLogin1(String phoneNumber) {
		return userRepository.findByPhoneNumberLogin1(phoneNumber);
	}

//	@Override
	public Optional<User> findById(int id) {
		return userRepository.findById(id);
	}

}
