package com.snowtech.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import lombok.Data;

@Configuration
@ConfigurationProperties(prefix = "app")
@Data
public class App {
	
	private String version;
	private String description;
	private String allowedOrigin;
	
}
