package com.yebing.controller;

import com.yebing.domain.Orders;
import com.yebing.service.api.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: yebing
 * @Date: 2018-8-27 14:41
 * @Version 1.0.0
 */
@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @RequestMapping(value = "/insert")
    @ResponseBody
    public String insertByGenerate(@RequestParam(value="orderNumber",defaultValue ="1") int orderNumber,
                                @RequestParam(value = "productTypes",defaultValue = "休闲裤") String productTypes,
                                @RequestParam(value = "unitPrice",defaultValue = "100") float unitPrice){
        String result;
        Orders orders = new Orders();
        orders.setOrderNumber(orderNumber);
        orders.setProductTypes(productTypes);
        orders.setUnitPrice(unitPrice);
        result = "{\"result\":"+orderService.insertByGenerate(orders)+"}";
        return result;
    }
}
