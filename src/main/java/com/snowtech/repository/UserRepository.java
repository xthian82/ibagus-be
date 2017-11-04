package com.snowtech.repository;

import com.snowtech.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);
}
