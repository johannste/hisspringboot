package com.neusoft.his.util;

import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Response;
import redis.clients.jedis.Transaction;

@Service
public class RedisDAOImpl implements RedisDAO {

    @Override
    public long incr(String key, String prefix) {
        Jedis jedis = new Jedis("localhost", 6379);
        jedis.auth("redis");
        String jedisKey = key + prefix;
        Transaction tx = jedis.multi();
        Response<Long> incr = tx.incr(jedisKey);
        tx.exec();
        int a = incr.get().intValue();
        return a;
    }
}
