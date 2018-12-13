package com.neusoft.his.util;

import javax.xml.rpc.ServiceException;

public interface SerialNumberService {

    String SERIAL_NUMBER = "serial.number:";

    String SERIAL_NUMBER_Register = "GH";

    String generate(String bizCode) throws ServiceException;

    // TODO 应该对bizCode做白名单验证 以免恶意伪造
    default boolean isLegal(String bizCode) {
        if (bizCode == null || bizCode.length() != 2) {
            throw new RuntimeException("bizCode: " + bizCode + "异常");
        }
        if (Character.isDigit(bizCode.charAt(0))
                && Character.isDigit(bizCode.charAt(1)))
            return true;
        return false;
    }
}