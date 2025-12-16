package com.demo.graalvm.infrastructure.config;

import java.util.HashMap;
import java.util.Map;

import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.annotation.EnableKafka;
import org.springframework.kafka.config.ConcurrentKafkaListenerContainerFactory;
import org.springframework.kafka.core.ConsumerFactory;
import org.springframework.kafka.core.DefaultKafkaConsumerFactory;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.core.ProducerFactory;
import org.springframework.kafka.support.serializer.JsonDeserializer;
import org.springframework.kafka.support.serializer.JsonSerializer;

import com.demo.graalvm.application.dto.OrderMessageDto;

@EnableKafka
@Configuration
public class KafkaConfig {

    @Bean
    public ProducerFactory<String, OrderMessageDto> producerFactory(KafkaProperties props) {
        Map<String, Object> config = new HashMap<>(props.buildProducerProperties());

        config.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        config.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class);

        config.put(JsonSerializer.ADD_TYPE_INFO_HEADERS, true);
        return new DefaultKafkaProducerFactory<>(config);
    }

    @Bean
    public KafkaTemplate<String, OrderMessageDto> kafkaTemplate(ProducerFactory<String, OrderMessageDto> producerFactory) {
        return new KafkaTemplate<>(producerFactory);
    }

    @Bean
    public ConsumerFactory<String, OrderMessageDto> consumerFactory(KafkaProperties props) {

        Map<String, Object> config = new HashMap<>(props.buildConsumerProperties());

        JsonDeserializer<OrderMessageDto> deserializer
                = new JsonDeserializer<>(OrderMessageDto.class);
        deserializer.setRemoveTypeHeaders(false);
        deserializer.addTrustedPackages("com.demo.graalvm.application.dto");
        deserializer.setUseTypeMapperForKey(true);

        config.putIfAbsent(org.apache.kafka.clients.consumer.ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");

        return new DefaultKafkaConsumerFactory<>(config, new StringDeserializer(), deserializer);
    }

    @Bean
    public ConcurrentKafkaListenerContainerFactory<String, OrderMessageDto> kafkaListenerContainerFactory(ConsumerFactory<String, OrderMessageDto> consumerFactory) {
        ConcurrentKafkaListenerContainerFactory<String, OrderMessageDto> factory
                = new ConcurrentKafkaListenerContainerFactory<>();
        factory.setConsumerFactory(consumerFactory);
        return factory;
    }
}
