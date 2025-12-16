package com.demo.graalvm.infrastructure.messaging;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.demo.graalvm.application.dto.OrderMessageDto;
import com.demo.graalvm.application.service.OrderConsumerService;

@Component
public class KafkaConsumer {

    private static final Logger log = LoggerFactory.getLogger(KafkaConsumer.class);

    private final OrderConsumerService orderConsumerService;

    private static final String TOPIC = "orders-topic";

    public KafkaConsumer(OrderConsumerService orderConsumerService) {
        this.orderConsumerService = orderConsumerService;
    }

    @KafkaListener(topics = TOPIC)
    public void listen(OrderMessageDto message) {
        orderConsumerService.process(message);
        log.info("Kafka received: topic={} orderId={}", TOPIC, message.getOrderId());
    }
}
