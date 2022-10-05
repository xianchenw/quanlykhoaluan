/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ltjava.service;

import com.ltjava.pojo.Council;
import com.ltjava.pojo.Thesis;
import com.ltjava.pojo.User;
import java.util.List;

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
    List<Thesis> getThesisesByUser(String u);
}
