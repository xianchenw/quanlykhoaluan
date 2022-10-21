/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ltjava.service;

import com.ltjava.pojo.Major;
import com.ltjava.pojo.Student;
import com.ltjava.pojo.Thesis;
import java.util.List;
import java.util.Map;

/**
 *
 * @author HIEN
 */
public interface StudentService {
    List<Student> getStudents(String kw);
    Student getStudentById(String id);
    boolean addOrUpdateStudent(Student s);
    boolean addThesis(Student studentId, Thesis thesisId);
    Object[] getStudentAccount(String id);
    List<Student> getListStudentAccount();
    boolean updateStudent(Map<String, String> params);
    String loadNewStudentId();
}
