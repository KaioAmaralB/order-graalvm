package com.demo.graalvm.infrastructure.messaging;

import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.demo.graalvm.application.dto.OrderMessageDto;

@Component
public class KafkaProducer {

    private static final Logger log = LoggerFactory.getLogger(KafkaProducer.class);


    private final KafkaTemplate<String, OrderMessageDto> kafkaTemplate;
    private static final String TOPIC = "orders-topic";

    public KafkaProducer(KafkaTemplate<String, OrderMessageDto> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    public void publish(OrderMessageDto message) {
        kafkaTemplate.send(TOPIC, message);
        log.info("Kafka published: topic={} orderId={}", TOPIC, message.getOrderId());
    }
}
