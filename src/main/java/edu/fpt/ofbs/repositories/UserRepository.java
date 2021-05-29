package edu.fpt.ofbs.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.fpt.ofbs.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	User findByPhoneLogin(String phoneLogin);
}
