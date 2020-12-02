package com.tientt.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private DataSource dataSource;


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //add our users for in memory authentication
        /*User.UserBuilder users  = User.withDefaultPasswordEncoder();
        auth.inMemoryAuthentication()
                .withUser(users.username("tien").password("123").roles("ADMIN", "EMPLOYEE"))
                .withUser(users.username("khanh").password("123").roles("EMPLOYEE"));
    */

        auth.jdbcAuthentication().dataSource(dataSource);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                //.anyRequest().authenticated()
                .antMatchers("/").hasRole("EMPLOYEE")
                .antMatchers("/admin/**").hasRole("ADMIN")
                .and()
                .formLogin()
                    .loginPage("/loginPage")
                    .loginProcessingUrl("/authenticate")
                    .permitAll()
                .and()
                .logout()
                .permitAll()
                .and()
                .exceptionHandling()
                .accessDeniedPage("/accessDenied");
    }
}
