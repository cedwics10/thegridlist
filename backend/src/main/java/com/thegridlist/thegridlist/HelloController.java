package com.thegridlist.thegridlist;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String home() {
        return "TheGridList server is up and running.";
    }

    @GetMapping("/ping")
    public String ping() {
        return "pong";
    }
}
