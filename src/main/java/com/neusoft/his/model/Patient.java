package com.neusoft.his.model;

import java.util.Date;

public class Patient {
    private String name;
    private Integer gender;
    private Integer age;
    private Integer identifyType;
    private String province;
    private String city;
    private String moreAddress;
    private String phone;
    private String relatedName;
    private String relatedPhoneNumber;
    private Integer relationship;
    private String symptoms;
    private String illHistory;
    private Integer region;
    private Date createDate;
    private String idCard;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getIdentifyType() {
        return identifyType;
    }

    public void setIdentifyType(Integer identifyType) {
        this.identifyType = identifyType;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getMoreAddress() {
        return moreAddress;
    }

    public void setMoreAddress(String moreAddress) {
        this.moreAddress = moreAddress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRelatedName() {
        return relatedName;
    }

    public void setRelatedName(String relatedName) {
        this.relatedName = relatedName;
    }

    public String getRelatedPhoneNumber() {
        return relatedPhoneNumber;
    }

    public void setRelatedPhoneNumber(String relatedPhoneNumber) {
        this.relatedPhoneNumber = relatedPhoneNumber;
    }

    public Integer getRelationship() {
        return relationship;
    }

    public void setRelationship(Integer relationship) {
        this.relationship = relationship;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public String getIllHistory() {
        return illHistory;
    }

    public void setIllHistory(String illHistory) {
        this.illHistory = illHistory;
    }

    public Integer getRegion() {
        return region;
    }

    public void setRegion(Integer region) {
        this.region = region;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }
}
