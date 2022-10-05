/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ltjava.repository;

import com.ltjava.pojo.Student;
import com.ltjava.pojo.Thesis;
import java.util.List;

/**
 *
 * @author HIEN
 */
public interface StudentRepository {
    List<Student> getStudents(String kw);
    Student getStudentById(String id);
    boolean addOrUpdate(Student s);
    boolean addThesis(Student s, Thesis t);
}
