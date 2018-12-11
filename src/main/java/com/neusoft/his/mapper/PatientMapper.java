package com.neusoft.his.mapper;

import com.neusoft.his.model.*;
import org.apache.ibatis.annotations.*;

import javax.websocket.server.PathParam;
import java.util.List;
import java.util.Map;

public interface PatientMapper {

    @Insert("INSERT INTO patient_list VALUES (NULL, #{name}, #{gender}, #{age}, #{province}, #{city}, 0, #{more_address}, #{phone}, #{related_name}, #{related_phone_number}, #{relationship}, #{symptoms}, #{ill_history}, #{region}, sysdate());")
    Boolean registerPatient(Map patientMap);

    @Select("SELECT * FROM identify_type;")
    List<IdentifyType> queryIdentifyType();

    @Select("SELECT pl.`name` FROM patient_list pl LEFT JOIN identify i ON pl.id=i.uid WHERE i.identify_number=#{identifyNumber};")
    List<Patient> queryIdentify(@PathParam("card_number") String identifyNumber);

    @Select("SELECT * FROM diagnose_time_range;")
    List<DiagnoseTimeRange> queryDiagnoseTimeRange();

    @Select("SELECT * FROM patient_region;")
    List<Region> queryRegion();

    @Select("SELECT * FROM patient_relationship;")
    List<Relationship> queryRelationship();
}
