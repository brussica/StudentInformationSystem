package com.example.student;

import java.io.Serializable;

public class StudentBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private String name, reg, dept, year, email;

    public StudentBean() {}

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getReg() { return reg; }
    public void setReg(String reg) { this.reg = reg; }
    public String getDept() { return dept; }
    public void setDept(String dept) { this.dept = dept; }
    public String getYear() { return year; }
    public void setYear(String year) { this.year = year; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
