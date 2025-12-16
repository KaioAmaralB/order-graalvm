package com.demo.graalvm.application.service;

import org.springframework.stereotype.Service;

import com.demo.graalvm.application.dto.OrderMessageDto;
import com.demo.graalvm.domain.repository.OrderRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class OrderConsumerService {

    private static final Logger log = LoggerFactory.getLogger(OrderConsumerService.class);

    private final OrderRepository orderRepository;

    public OrderConsumerService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public void process(OrderMessageDto dto) {
        orderRepository.findByOrderId(dto.getOrderId()).ifPresent(order -> {
            order.setShipmentStatus("Shipped");
            orderRepository.save(order);
        });

        log.info("Order updated to Shipped: {}", dto.getOrderId());
    }
}
