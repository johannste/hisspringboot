package com.neusoft.his.mapper;

import com.neusoft.his.model.Doctor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import javax.websocket.server.PathParam;
import java.util.List;

@Mapper
public interface DoctorMapper {

    @Select("SELECT doc.`id`,doc.`name`,doc.`is_expert`,e.`expense` FROM doctor doc LEFT JOIN department dept ON doc.department_id=dept.id LEFT JOIN expert e ON doc.is_expert=e.id WHERE doc.department_id=#{id}")
    List<Doctor> findByDepartmentId(@PathParam("name") final Integer id);
}
