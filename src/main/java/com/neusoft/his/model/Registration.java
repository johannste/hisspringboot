package com.neusoft.his.model;

import java.util.Date;

public class Registration {
    private String registerNumber;
    private Integer identifyType;
    private String identifyNumber;
    private Integer departmentId;
    private Integer doctorId;
    private Date regesterDate;
    private String diagnoseTime;
    private Integer expenses;

    public String getRegisterNumber() {
        return registerNumber;
    }

    public void setRegisterNumber(String registerNumber) {
        this.registerNumber = registerNumber;
    }

    public Integer getIdentifyType() {
        return identifyType;
    }

    public void setIdentifyType(Integer identifyType) {
        this.identifyType = identifyType;
    }

    public String getIdentifyNumber() {
        return identifyNumber;
    }

    public void setIdentifyNumber(String identifyNumber) {
        this.identifyNumber = identifyNumber;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public Date getRegesterDate() {
        return regesterDate;
    }

    public void setRegesterDate(Date regesterDate) {
        this.regesterDate = regesterDate;
    }

    public String getDiagnoseTime() {
        return diagnoseTime;
    }

    public void setDiagnoseTime(String diagnoseTime) {
        this.diagnoseTime = diagnoseTime;
    }

    public Integer getExpenses() {
        return expenses;
    }

    public void setExpenses(Integer expenses) {
        this.expenses = expenses;
    }
}
