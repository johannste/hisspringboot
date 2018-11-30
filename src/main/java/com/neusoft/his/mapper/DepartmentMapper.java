package com.neusoft.his.mapper;

import com.neusoft.his.model.Department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DepartmentMapper {

    @Select("SELECT * FROM department")
    List<Department> findAllDepartment();

}
