/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ltjava.service;

import com.ltjava.pojo.Council;
import com.ltjava.pojo.Student;
import com.ltjava.pojo.Thesis;
import com.ltjava.pojo.ThesisInstructor;
import com.ltjava.pojo.User;
import java.util.List;
import java.util.Set;

/**
 *
 * @author HIEN
 */
public interface ThesisService {
    List<Thesis> getThesises(String kw);
    List<Thesis> getThesisesByCouncil(Integer councilId);
    Thesis getThesisById(Integer id);
    boolean addThesis(Thesis thesis);
    boolean removeThesis(Thesis thesisId);
    boolean updateThesis(Integer id, String topic, String description, User reviewer, Set<Student> students);
}
