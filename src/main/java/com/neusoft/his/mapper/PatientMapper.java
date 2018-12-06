package com.neusoft.his.mapper;

import org.apache.ibatis.annotations.Select;

import javax.websocket.server.PathParam;

public interface PatientMapper {


    @Select("SELECT pl.`name` FROM patient_list pl LEFT JOIN identify i ON pl.id=i.uid WHERE i.identify_number=#{identifyNumber}")
    String queryIdentify(@PathParam("card_number") String identifyNumber);
}
