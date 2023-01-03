package com.gura.boot07.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gura.boot07.interceptor.LoginInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	// 로그인 인터셉터 주입받기
	@Autowired LoginInterceptor loginInterceptor;
	
	// 인터셉터 동작하도록 등록하기
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor)
		.addPathPatterns("/users/*", "/gallery/*", "/file/*", "/cafe/*")
		.excludePathPatterns("/users/signup_form","/users/signup", "/users/loginform", "/users/login",
				"/gallery/list", "/gallery/detail",
				"/file/list", "/file/download",
				"/cafe/list", "/cafe/detail", "/cafe/ajax_comment_list",
				"/gallery/images/*",
				"/users/profile/*");
	
	}
	
	// resources 폴더 안에 있는 자원을 spring 컨트롤러를 거치지 않고 응답되도록 설정
	// webapp 안에 resources 폴더를 만들어야 함.
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
}
