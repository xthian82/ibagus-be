package com.snowtech.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;

/**
 * Responsible for managing access tokens.
 * 
 * @author jerry
 */

@Configuration
@EnableAuthorizationServer
public class AuthServerOAuth2Config extends AuthorizationServerConfigurerAdapter {

	@Autowired
	@Qualifier("authenticationManagerBean")
	private AuthenticationManager authenticationManager;

	@Autowired
	private Environment env;

	// @Autowired
	// private PasswordEncoder passwordEncoder;

	/**
	 * We here defines the security constraints on the token endpoint. We set it
	 * up to isAuthenticated, which returns true if the user is not anonymous
	 */
	@Override
	public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
		security.tokenKeyAccess("permitAll()").checkTokenAccess("isAuthenticated()");
	}

	// Setting up the clients with a clientId, a clientSecret, a scope, the
	// grant types and the authorities.
	@Override
	public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
		clients.jdbc(dataSource()).withClient("sampleClientId").authorizedGrantTypes("implicit").scopes("read")
				.autoApprove(true).and().withClient("clientIdPassword").secret("secret")
				.authorizedGrantTypes("password", "authorization_code", "refresh_token").scopes("read");
		// clients.inMemory().withClient("my-trusted-client").authorizedGrantTypes("clients_credentials",
		// "password")
		// .authorities("ROLE_CLIENT", "ROLE_TRUSTED_CLIENT")
		// .scopes("read", "write", "trust")
		// .resourceIds("oauth2-resource")
		// .accessTokenValiditySeconds(5_000)
		// .secret("secret");
	}

	@ConfigurationProperties(prefix = "spring.datasource")
	@Bean
	public DataSource dataSource() {
		return DataSourceBuilder
		        .create()
		        .build();
		/*
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getProperty("datasource.driverClassName"));
		dataSource.setUrl(env.getProperty("datasource.url"));
		dataSource.setUsername(env.getProperty("datasource.user"));
		dataSource.setPassword(env.getProperty("datasource.password"));
		return dataSource;*/
	}

	// AuthorizationServerEndpointsConfigurer defines the authorization and
	// token endpoints and the token services.
	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
		endpoints //.tokenStore(tokenStore())
		.authenticationManager(authenticationManager);
	}

	// @Bean
	// public TokenStore tokenStore() {
	// 	return new JdbcTokenStore();
	//}

}
