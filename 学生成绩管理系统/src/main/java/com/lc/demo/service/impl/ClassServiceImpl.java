package com.lc.demo.service.impl;

import com.lc.demo.bean.Classes;
import com.lc.demo.mapper.ClassMapper;
import com.lc.demo.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ClassServiceImpl implements ClassService {


    @Autowired
    private ClassMapper classMapper;

    @Override
    public List<Classes> getAllClass() {
        return classMapper.selectAllClass();
    }

    @Override
    public Classes selectById(String classId) {
        return classMapper.selectClassById(classId);
    }

    @Override
    public int deleteById(String classId) {
        return classMapper.delectClassById(classId);
    }

    @Override
    public int addClass(Classes classes) {
        return classMapper.insertClass(classes);
    }

    @Override
    public Classes selectByName(String className) {
        return classMapper.selectClassByName(className);
    }
}
