package com.neusoft.his.model;

public class Department {
    private Integer id;
    private String deptName;
    private String deptEngName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptEngName() {
        return deptEngName;
    }

    public void setDeptEngName(String deptEngName) {
        this.deptEngName = deptEngName;
    }
}
