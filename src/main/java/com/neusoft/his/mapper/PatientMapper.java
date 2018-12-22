package com.neusoft.his.mapper;

import com.neusoft.his.model.*;
import org.apache.ibatis.annotations.*;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface PatientMapper {

    @Insert("INSERT INTO register_manager VALUES (NULL, #{register_number}, #{identify_type}, #{identify_number}, #{department_id}, #{doctor_id}, #{register_date}, #{diagnose_time}, #{expense}, 0, 2);")
    Boolean registration(Map registrationMap);

    @Insert("INSERT INTO patient_list VALUES (NULL, #{name}, #{gender}, #{age}, #{province}, #{city}, 0, #{more_address}, #{phone}, #{related_name}, #{related_phone_number}, #{relationship}, #{symptoms}, #{ill_history}, #{region}, sysdate());" +
            "INSERT INTO identify VALUES (NULL, (SELECT id FROM patient_list ORDER BY id DESC LIMIT 1), 0, #{identify_number});")
    Boolean registerPatient(Map patientMap);

    @Update("UPDATE register_manager SET status=0 WHERE id=#{id};")
    Boolean cancelRegisterStatus(@PathParam("id") Integer id);

    @Update("UPDATE register_manager SET is_paid=1, status=1 WHERE id=#{id};")
    Boolean updateRegisterPayment(@PathParam("id") Integer id);

    @Select("SELECT * FROM v_register_list;")
    List<Map<String, RegisterList>> queryRegisterList();

    @Select("SELECT * FROM v_register_list LIMIT #{begin}, #{end};")
    List<Map<String, RegisterList>> queryRegisterListByPage(@Param("begin") Integer begin, @Param("end") Integer end);

    @Select("queryRegisterList;")
    List<Map<String, PatientList>> queryAllPatient();

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
