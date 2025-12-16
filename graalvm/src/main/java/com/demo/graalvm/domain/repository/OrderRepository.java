package com.demo.graalvm.domain.repository;

import java.util.Optional;

import com.demo.graalvm.domain.model.Order;

public interface OrderRepository {
    Order save(Order order);
    Optional<Order> findByOrderId(String orderId);
}

