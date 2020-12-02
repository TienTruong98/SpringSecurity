package com.tientt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping("loginPage")
    public String getLoginPage(){
        return "login";
    }

    @GetMapping("accessDenied")
    public String accessDenied(){
        return "accessDenied";
    }
}
