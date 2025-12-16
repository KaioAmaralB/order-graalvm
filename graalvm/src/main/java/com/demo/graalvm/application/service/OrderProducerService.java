package com.demo.graalvm.application.service;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.demo.graalvm.application.dto.OrderMessageDto;
import com.demo.graalvm.application.dto.OrderRequestDto;
import com.demo.graalvm.domain.model.Order;
import com.demo.graalvm.domain.repository.OrderRepository;
import com.demo.graalvm.infrastructure.messaging.KafkaProducer;

@Service
public class OrderProducerService {

    private static final Logger log = LoggerFactory.getLogger(OrderProducerService.class);


    private final OrderRepository orderRepository;
    private final KafkaProducer kafkaProducer;

    public OrderProducerService(OrderRepository orderRepository, KafkaProducer kafkaProducer) {
        this.orderRepository = orderRepository;
        this.kafkaProducer = kafkaProducer;
    }

    public void sendOrder(OrderRequestDto dto) {
        
        log.info("Persisting order: orderId={}", dto.getOrderId());
        Order order = new Order(dto.getOrderId(), dto.getPaymentStatus(), dto.getShipmentStatus());
        orderRepository.save(order);

        OrderMessageDto message = new OrderMessageDto(
                dto.getOrderId(),
                dto.getPaymentStatus(),
                dto.getShipmentStatus()
        );

        log.info("Publishing order event: orderId={}", dto.getOrderId());
        kafkaProducer.publish(message);
    }
}
