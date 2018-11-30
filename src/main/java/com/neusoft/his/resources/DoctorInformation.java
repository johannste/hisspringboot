package com.neusoft.his.resources;

import com.neusoft.his.mapper.DoctorMapper;
import com.neusoft.his.model.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@SuppressWarnings("ALL")
@RestController
@RequestMapping("/doctor")
public class DoctorInformation {

    @Autowired
    private DoctorMapper doctorMapper;

    @GetMapping("/findBy")
    public List<Doctor> findByDepartmentId(@RequestParam int id) {
        return doctorMapper.findByDepartmentId(id);
    }
}
