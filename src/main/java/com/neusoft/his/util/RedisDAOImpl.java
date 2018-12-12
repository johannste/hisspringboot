package com.neusoft.his.util;

public class RedisDAOImpl implements RedisDAO {
    @Override
    public String get(String key) {
        return "1234567890";
    }

    @Override
    public long incr(String key) {
        return 0;
    }
}
