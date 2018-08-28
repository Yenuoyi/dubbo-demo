package com.yebing.domain;

import java.io.Serializable;

/**
 * @Author: yebing
 * @Date: 2018-8-27 14:35
 * @Version 1.0.0
 */
public class Orders implements Serializable {
    private String orderNo;//订单编号
    private String productTypes;//商品类型
    private int orderNumber;//订单商品数量
    private float unitPrice;//单价
    private float totalPrice;//总价

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getProductTypes() {
        return productTypes;
    }

    public void setProductTypes(String productTypes) {
        this.productTypes = productTypes;
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderNo='" + orderNo + '\'' +
                ", productTypes='" + productTypes + '\'' +
                ", orderNumber=" + orderNumber +
                ", unitPrice=" + unitPrice +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
