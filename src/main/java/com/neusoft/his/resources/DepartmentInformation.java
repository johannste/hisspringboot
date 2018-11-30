package com.neusoft.his.resources;

import com.neusoft.his.mapper.DepartmentMapper;
import com.neusoft.his.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@SuppressWarnings("ALL")
@RestController
@RequestMapping("/dept")
public class DepartmentInformation {

    @Autowired
    private DepartmentMapper departmentMapper;

    @GetMapping("/all")
    public List<Department> getAllDepartment() {
        return departmentMapper.findAllDepartment();
    }
}
