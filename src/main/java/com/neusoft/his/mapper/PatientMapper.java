package com.neusoft.his.mapper;

import org.apache.ibatis.annotations.Select;

import javax.websocket.server.PathParam;

public interface PatientMapper {

    @Select("SELECT identify_number FROM identify WHERE identify_number=#{identifyNumber};")
    Boolean queryIndentify(@PathParam("card_number") String identifyNumber);
}
