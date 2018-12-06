package com.neusoft.his.resources;

import com.neusoft.his.mapper.PatientMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SuppressWarnings("ALL")
@RestController
@RequestMapping("/patient")
public class PatienInformation {

    @Autowired
    private PatientMapper patientMapper;

    @GetMapping("/queryIndentify")
    public String queryIdentify(@RequestParam String identifyNumber){
        return patientMapper.queryIdentify(identifyNumber);
    }

}
