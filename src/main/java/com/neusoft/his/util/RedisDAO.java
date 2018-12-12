package com.neusoft.his.util;

public interface RedisDAO {
    String get(String key);
    /**
     * 自增,+1,返回增加后的值
     *
     * @param key
     * @return
     */
    long incr(String key);
}
