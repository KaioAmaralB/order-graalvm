package com.demo.graalvm.application.dto;

public class OrderRequestDto {
    private String orderId;
    private String paymentStatus;
    private String shipmentStatus;

    public OrderRequestDto() {
    }

    public OrderRequestDto(String orderId, String paymentStatus, String shipmentStatus) {
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
