package com.neusoft.his.util;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.rpc.ServiceException;

@Service
public class SerialNumberServiceImpl implements SerialNumberService {

    @Resource
    private RedisDAO redisDAO;

    @Override
    public String generate(String bizCode) throws ServiceException {
        // 检查业务码
        boolean isLegal = isLegal(bizCode);
        if (!isLegal) {
            throw new ServiceException("bizCode参数不合法");
        }
        // 获取今天的日期:yyyyMMdd
        String date = TimeUtil.getToday();
        // 构造redis的key
        String key = SERIAL_NUMBER + date;
        // 自增
        long sequence = redisDAO.incr(key);
        String seq = StringUtil.getSequence(sequence);
        StringBuilder sb = new StringBuilder();
        sb.append(date).append(bizCode).append(seq);
        String serial = sb.toString();
        return serial;
    }
}