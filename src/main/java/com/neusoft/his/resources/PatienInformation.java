package com.neusoft.his.resources;

import com.neusoft.his.mapper.PatientMapper;
import com.neusoft.his.model.IdentifyType;
import com.neusoft.his.model.Patient;
import com.neusoft.his.model.Region;
import com.neusoft.his.model.Relationship;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("ALL")
@RestController
@RequestMapping("/patient")
public class PatienInformation {

    @Autowired
    private PatientMapper patientMapper;

    @PostMapping("/registerPatient")
    public Boolean registerPatient(@RequestBody Patient patient){
        Map patientMap = new HashMap();
        patientMap.put("name", patient.getName().toString());
        patientMap.put("gender", patient.getGender().toString());
        patientMap.put("age", patient.getAge().toString());
        patientMap.put("province", patient.getProvince().toString());
        patientMap.put("city", patient.getCity().toString());
        patientMap.put("more_address", patient.getMoreAddress().toString());
        patientMap.put("phone", patient.getPhone().toString());
        patientMap.put("related_name", patient.getRelatedName().toString());
        patientMap.put("related_phone_number", patient.getRelatedPhoneNumber().toString());
        patientMap.put("relationship", patient.getRelationship().toString());
        patientMap.put("symptoms", patient.getSymptoms().toString());
        patientMap.put("ill_history", patient.getIllHistory().toString());
        patientMap.put("region", patient.getRegion().toString());
        return patientMapper.registerPatient(patientMap);
    }

    @GetMapping("/queryIdentifyType")
    public List<IdentifyType> queryIdentifyType() {
        return patientMapper.queryIdentifyType();
    }

    @GetMapping("/queryIdentify")
    public String queryIdentify(@RequestParam String identifyNumber) {
        return patientMapper.queryIdentify(identifyNumber);
    }

    @GetMapping("/queryRegion")
    public List<Region> queryRegion(){
        return patientMapper.queryRegion();
    }

    @GetMapping("/queryRelationship")
    public List<Relationship> queryRelationship(){
        return patientMapper.queryRelationship();
    }
}
