package com.demo.graalvm.domain.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    private String orderId;

    private String paymentStatus;
    private String shipmentStatus;

    public Order() {}
    public Order(String orderId, String paymentStatus, String shipmentStatus) {
        this.orderId = orderId;
        this.paymentStatus = paymentStatus;
        this.shipmentStatus = shipmentStatus;
    }

    public String getOrderId() { return orderId; }
    public void setOrderId(String orderId) { this.orderId = orderId; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getShipmentStatus() { return shipmentStatus; }
    public void setShipmentStatus(String shipmentStatus) { this.shipmentStatus = shipmentStatus; }
}