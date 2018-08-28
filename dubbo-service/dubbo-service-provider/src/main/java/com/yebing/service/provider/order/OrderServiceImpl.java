package com.yebing.service.provider.order;

import com.yebing.dao.OrderDao;
import com.yebing.domain.Orders;
import com.yebing.service.api.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: yebing
 * @Date: 2018-8-27 14:12
 * @Version 1.0.0
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    /**
     * 调用数据库存储过程插入数据
     * @param orders
     * @return
     */
    @Override
    public int insertByGenerate(Orders orders) {
        return orderDao.insertByGenerate(orders);
    }
}
