package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
//		failForRollbackTest();
		SpringApplication.run(DemoApplication.class, args);
	}

	private static void failForRollbackTest() {
		throw new RuntimeException("Intentional deployment failure test");
	}
}
