package com.lc.demo.bean;

import javax.validation.constraints.Size;


public class Classes {

    @Size(min=4,max = 4,message = "班级号长度必须为4")
    private String classId;
    private String className;

    public Classes() {
    }

    public Classes(String classId, String className) {
        this.classId = classId;
        this.className = className;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Override
    public String toString() {
        return "Classes{" +
                "classId='" + classId + '\'' +
                ", className='" + className + '\'' +
                '}';
    }
}
