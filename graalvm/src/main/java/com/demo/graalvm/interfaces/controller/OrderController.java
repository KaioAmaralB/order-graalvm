package com.demo.graalvm.interfaces.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.demo.graalvm.application.dto.OrderRequestDto;
import com.demo.graalvm.application.dto.OrderResponseDto;
import com.demo.graalvm.application.service.OrderProducerService;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private static final Logger log = LoggerFactory.getLogger(OrderController.class);

    private final OrderProducerService orderProducerService;

    public OrderController(OrderProducerService orderProducerService) {
        this.orderProducerService = orderProducerService;
    }

    @PostMapping
    public OrderResponseDto createOrder(@RequestBody OrderRequestDto dto) {

        log.info("Order received: orderId={}", dto.getOrderId());
        orderProducerService.sendOrder(dto);
        
        log.info("Order accepted: orderId={}", dto.getOrderId());
        return new OrderResponseDto("Order accepted with ID=" + dto.getOrderId());
    }
}
