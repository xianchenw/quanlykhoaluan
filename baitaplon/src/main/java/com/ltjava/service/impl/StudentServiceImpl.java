/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.service.impl;

import com.ltjava.pojo.Student;
import com.ltjava.pojo.Thesis;
import com.ltjava.repository.StudentRepository;
import com.ltjava.service.StudentService;
import com.ltjava.service.UserRoleService;
import java.util.Iterator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author HIEN
 */
@Service
public class StudentServiceImpl implements StudentService{
    @Autowired
    private StudentRepository studentRepository;

    @Override
    public List<Student> getStudents(String kw) {
        return this.studentRepository.getStudents(kw);
    }

    @Override
    public Student getStudentById(String id) {
        return this.studentRepository.getStudentById(id);
    }

    @Override
    public boolean addOrUpdate(Student s) {
        return this.studentRepository.addOrUpdate(s);
    }

    @Override
    public boolean addThesis(Student stdnt, Thesis thesis) {
        return this.studentRepository.addThesis(stdnt, thesis);
    }
}
