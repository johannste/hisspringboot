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
        boolean isLegal = isLegal(bizCode);
        if (!isLegal) {
            throw new ServiceException("bizCode参数不合法");
        }
        String date = CurrentDate.getToday();
        String key = null;
        switch (bizCode) {
            case "00":
                key = SERIAL_NUMBER_Register + date;
                break;
            default:
                throw new ServiceException("bizCode参数不合法");
        }
        long sequence = redisDAO.incr(key);
        String seq = SequenceUtil.getSequence(sequence);
        StringBuilder sb = new StringBuilder();
        sb.append(date).append(bizCode).append(seq);
        String serial = sb.toString();
        return serial;
    }
}