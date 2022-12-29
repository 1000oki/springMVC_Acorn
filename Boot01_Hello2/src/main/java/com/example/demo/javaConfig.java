package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.demo.auto.MyCar;

// servlet-context.xml의 문서에서의 기능을 class에서 대처하고 있음.
@Configuration
public class javaConfig {
	
	/*
	 * @Bean 어노테이션과 함께 MyCar type을 리턴하는 메소드를 만들어 놓으면
	 * MyCar type 객체가 spring이 관리하는 bean이 된다.
	 * <bean id = "myCar" class="xxx.xxx.MyCar"/>을 아래와 같이 변경
	 */
	@Bean
	public MyCar myCar() {
		MyCar c1 = new MyCar();
		return c1;
	}
}
