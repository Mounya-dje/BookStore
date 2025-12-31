package re.spai.BookStore;

import org.springframework.security.core.userdetails.User;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import lombok.Builder;


@Configuration
@EnableMethodSecurity
public class Authentication {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
	    http
	        .csrf().disable()
	        .authorizeHttpRequests(auth -> auth
	        		.requestMatchers("/graphql", "/graphiql", "/test/**").permitAll()// secure all GraphQL requests
	            .anyRequest().authenticated()
	        )
	        .httpBasic();
	    return http.build();
	}


    @Bean
    public UserDetailsService users() {
        UserDetails admin = User.builder()
            .username("admin")
            .password("{noop}admin")   // {noop} = no encoding (for demo)
            .roles("ADMIN")
            .build();

        return new InMemoryUserDetailsManager(admin);
    }
}
