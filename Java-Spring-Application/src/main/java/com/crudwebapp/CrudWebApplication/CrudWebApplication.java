package com.crudwebapp.CrudWebApplication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@RestController
@EnableAutoConfiguration

@SpringBootApplication
public class CrudWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(CrudWebApplication.class, args);
	}
}
