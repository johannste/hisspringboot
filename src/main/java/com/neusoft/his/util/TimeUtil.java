package com.neusoft.his.util;

import java.util.Calendar;
import java.util.Date;

public class TimeUtil {
    private TimeUtil() {
    }

    /**
     * 获取今日日期
     *
     * @return
     */
    public static String getToday() {
        Calendar now = Calendar.getInstance();
        return now.get(Calendar.YEAR) + "" + now.get(Calendar.MONTH) + now.get(Calendar.DATE);
    }
}
