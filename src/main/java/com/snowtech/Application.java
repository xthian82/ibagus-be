package com.snowtech;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import com.snowtech.config.CustomerUserDetails;
import com.snowtech.entity.Role;
import com.snowtech.entity.User;
import com.snowtech.repository.UserRepository;
import com.snowtech.service.UserService;

import lombok.extern.slf4j.Slf4j;

@SpringBootApplication
@Slf4j
public class Application {

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private Environment env;
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
	
	@Autowired
	public void authenticationManager(AuthenticationManagerBuilder builder, UserRepository repo, UserService service) throws Exception {
		log.info("url {}", env.getProperty("datasource.url"));
		if (repo.count() == 0) {
			repo.save(new User("user", "user", Arrays.asList(new Role("USER"), new Role("ACTUATOR"))));
		}
		builder.userDetailsService(userDetailsService(repo)).passwordEncoder(passwordEncoder);
	}
	
	private UserDetailsService userDetailsService(final UserRepository repository) {
		return username -> new CustomerUserDetails(repository.findByUsername(username));
	}
}
