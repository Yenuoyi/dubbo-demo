package com.yebing.dao;

import com.yebing.domain.Orders;
import org.springframework.stereotype.Repository;

/**
 * @Author: yebing
 * @Date: 2018-8-27 10:18
 * @Version 1.0.0
 */
@Repository
public interface OrderDao {
    /**
     * 调用数据库存储过程插入数据
     * @param Orders
     * @return
     */
    int insertByGenerate(Orders Orders);

}
