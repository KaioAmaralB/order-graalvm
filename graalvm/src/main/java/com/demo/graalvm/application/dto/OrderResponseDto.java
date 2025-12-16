package com.demo.graalvm.application.dto;

public class OrderResponseDto {
    private final String message;

    public OrderResponseDto(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}