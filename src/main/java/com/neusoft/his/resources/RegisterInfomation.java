package com.neusoft.his.resources;

import com.neusoft.his.mapper.RegistrationMapper;
import com.neusoft.his.model.RegisterGroupByDepartment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@SuppressWarnings("ALL")
@RestController
@RequestMapping("/register")
public class RegisterInfomation {

    @Autowired
    private RegistrationMapper registrationMapper;

    @GetMapping("/getRegisterGroupByDepartment")
    List<Map<String, RegisterGroupByDepartment>> getRegisterGroupByDepartment(){
        return registrationMapper.getRegisterGroupByDepartment();
    }
}
