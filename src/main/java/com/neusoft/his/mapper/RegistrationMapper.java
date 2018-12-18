package com.neusoft.his.mapper;

import com.neusoft.his.model.RegisterGroupByDepartment;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface RegistrationMapper {

    @Select("SELECT count(*) AS `value`,dept_name AS `name` FROM register_manager rm LEFT JOIN department d ON rm.department_id=d.id WHERE YEARWEEK(DATE_FORMAT(register_date,'%Y-%m-%d'))=YEARWEEK(NOW()) GROUP BY dept_name;")
    List<Map<String, RegisterGroupByDepartment>> getRegisterGroupByDepartment();
}
