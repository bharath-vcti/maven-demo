package test.exapmle.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class TestApplication {

	public static void main(String[] args) {
		System.out.println("Hello World");
		SpringApplication.run(TestApplication.class, args);
	}

	@GetMapping("/")
	public String applicationWorking() {
		return "Application is up and running??";
	}
}
