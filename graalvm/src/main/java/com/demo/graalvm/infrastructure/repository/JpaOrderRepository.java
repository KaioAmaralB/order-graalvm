package com.demo.graalvm.infrastructure.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.graalvm.domain.model.Order;
import com.demo.graalvm.domain.repository.OrderRepository;

@Repository
public interface JpaOrderRepository extends OrderRepository, JpaRepository<Order, String> {
    @Override
    Optional<Order> findByOrderId(String orderId);
}