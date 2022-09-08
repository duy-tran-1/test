package com.example.demo.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import com.example.demo.model.Greeting;

@RestController
public class HelloController {

    @GetMapping("/")
    public String index() {
        return "Hello World!";
    }

    @GetMapping(value = "/greeting", produces = {MediaType.APPLICATION_JSON_VALUE})
    @CrossOrigin(origins = "http://localhost:8000")
    @ResponseBody
    public ResponseEntity<Greeting> greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
        Greeting greeting = new Greeting(1,String.format("Hello, %s!", name));
        return ResponseEntity.ok().body(greeting);
    }

}