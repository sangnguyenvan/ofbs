package edu.fpt.ofbs.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import edu.fpt.ofbs.entities.Restaurant;
import edu.fpt.ofbs.models.RestaurantDTO;

@Repository
public interface RestaurantRepository extends JpaRepository<Restaurant, Integer>{
	@Query(value = "exec Script_Home @restaurant_type = ?1;", nativeQuery = true)
	List<RestaurantDTO> getRestaurantByType(int type);
}
