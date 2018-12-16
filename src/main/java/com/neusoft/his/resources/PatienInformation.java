package com.neusoft.his.resources;

import com.neusoft.his.mapper.PatientMapper;
import com.neusoft.his.model.*;
import com.neusoft.his.util.SerialNumberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.xml.rpc.ServiceException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("ALL")
@RestController
@RequestMapping("/patient")
public class PatienInformation {

    @Autowired
    private PatientMapper patientMapper;

    @Resource
    private SerialNumberService serialNumberService;

    @PostMapping("/registration")
    public Boolean registration(@RequestBody Registration registration) {
        Map registrationMap = new HashMap();
        registrationMap.put("register_number", registration.getRegisterNumber().toString());
        registrationMap.put("identify_type", registration.getIdentifyType().toString());
        registrationMap.put("identify_number", registration.getIdentifyNumber().toString());
        registrationMap.put("department_id", registration.getDepartmentId().toString());
        registrationMap.put("doctor_id", registration.getDoctorId().toString());
        registrationMap.put("register_date", registration.getRegisterDate().toString());
        registrationMap.put("diagnose_time", registration.getDiagnoseTime().toString());
        registrationMap.put("expense", registration.getExpense().toString());
        return patientMapper.registration(registrationMap);
    }

    @PostMapping("/registerPatient")
    public Boolean registerPatient(@RequestBody Patient patient) {
        Map patientMap = new HashMap();
        patientMap.put("name", patient.getName().toString());
        patientMap.put("gender", patient.getGender().toString());
        patientMap.put("age", patient.getAge().toString());
        patientMap.put("province", patient.getProvince().toString());
        patientMap.put("city", patient.getCity().toString());
        patientMap.put("identify_number", patient.getIdCard().toString());
        patientMap.put("more_address", patient.getMoreAddress().toString());
        patientMap.put("phone", patient.getPhone().toString());
        patientMap.put("related_name", patient.getRelatedName().toString());
        patientMap.put("related_phone_number", patient.getRelatedPhoneNumber().toString());
        patientMap.put("relationship", null == patient.getRelationship() ? null : patient.getRelationship().toString());
        patientMap.put("symptoms", patient.getSymptoms().toString());
        patientMap.put("ill_history", patient.getIllHistory().toString());
        patientMap.put("region", patient.getRegion().toString());
        return patientMapper.registerPatient(patientMap);
    }

    @GetMapping("/cancelRegisterStatus")
    public Boolean cancelRegisterStatus(@RequestParam Integer id) {
        return patientMapper.cancelRegisterStatus(id);
    }

    @GetMapping("/updateRegisterPayment")
    public Boolean updateRegisterPayment(@RequestParam Integer id) {
        return patientMapper.updateRegisterPayment(id);
    }

    @GetMapping("/queryRegisterList")
    public List<Map<String, RegisterList>> queryRegisterList() {
        return patientMapper.queryRegisterList();
    }

    @GetMapping("/queryAllPatient")
    public List<Map<String, PatientList>> queryAllPatient() {
        return patientMapper.queryAllPatient();
    }

    @GetMapping("/queryIdentifyType")
    public List<IdentifyType> queryIdentifyType() {
        return patientMapper.queryIdentifyType();
    }

    @PostMapping("/getLastSerialNumber")
    public List<String> getLastSerialNumber(@RequestBody BizCode bizCode) {
        List<String> arrayList = new ArrayList<>();
        try {
            arrayList.add(serialNumberService.generate(bizCode.getBizCode()));
            return arrayList;
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("/queryIdentify")
    public List<Patient> queryIdentify(@RequestParam String identifyNumber) {
        return patientMapper.queryIdentify(identifyNumber);
    }

    @GetMapping("/queryDiagnoseTimeRange")
    public List<DiagnoseTimeRange> queryDiagnoseTimeRange() {
        return patientMapper.queryDiagnoseTimeRange();
    }

    @GetMapping("/queryRegion")
    public List<Region> queryRegion() {
        return patientMapper.queryRegion();
    }

    @GetMapping("/queryRelationship")
    public List<Relationship> queryRelationship() {
        return patientMapper.queryRelationship();
    }
}
