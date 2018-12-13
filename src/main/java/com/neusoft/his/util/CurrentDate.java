package com.neusoft.his.util;

import java.util.Calendar;

public class CurrentDate {
    private CurrentDate() {
    }

    public static String getToday() {
        Calendar now = Calendar.getInstance();
        return now.get(Calendar.YEAR) + "" + now.get(Calendar.MONTH) + now.get(Calendar.DATE);
    }
}
