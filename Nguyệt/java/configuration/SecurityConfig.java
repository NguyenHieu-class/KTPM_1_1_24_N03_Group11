//package com.project.CarRental2.configuration;
//
//import static org.springframework.security.config.Customizer.withDefaults;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//@EnableMethodSecurity
//public class SecurityConfig {
//
//	private static final String[] WHITE_LIST_URL =
//		{
//            "/",
//            "/css/**","/js/**","/lib/**",
//            "/images/**","/uploads/**",
//            "/sum-delivery-in-car","/sum-car-has-driver","/sum-car-no-driver",
//            "/login","/logout","/sign-up", "/help-Ower-Car", };
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
////        http.authorizeHttpRequests(auth -> auth
////                        .requestMatchers("/","/css/**","/js/**","/lib/**","/images/**","/uploads/**","/sum-delivery-in-car","/sum-car-has-driver","/sum-car-no-driver").permitAll()
////                        .anyRequest().
////                        authenticated())
////
////                .csrf(AbstractHttpConfigurer::disable);
////   	      return http.build();
//
//    	http
//        .csrf(AbstractHttpConfigurer::disable)
//        .authorizeHttpRequests(req ->
//                req.requestMatchers(WHITE_LIST_URL)
//                        .permitAll()
//                        .requestMatchers(HttpMethod.GET, "/admin").hasAnyRole("ADMIN")
//                        .requestMatchers("/api/v1/management/**").hasAnyRole("ADMIN")
//                        .anyRequest()
//                        .authenticated()
//        )
//        .formLogin(login -> login.loginPage("/login").isCustomLoginPage());
//
//return http.build();
//
//    }
//}