package com.snowtech.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.snowtech.entity.User;

public interface UserRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);
}
