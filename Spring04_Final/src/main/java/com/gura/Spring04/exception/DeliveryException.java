package com.gura.Spring04.exception;

import org.springframework.dao.DataAccessException;

/*
 *  트랜잭션에 영향을 주는 예외 클래스 만들기
 *  - DataAccessException 클래스 상속 받아서 만든다. 
 */

// 배송 관련 에러를 발생시키고 싶을 때 사용할 클래스
public class DeliveryException extends DataAccessException{

	public DeliveryException(String msg) {
		super(msg);

	}

}
