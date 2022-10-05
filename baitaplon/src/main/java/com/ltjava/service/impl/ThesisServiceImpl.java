/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.service.impl;

import com.ltjava.pojo.Council;
import com.ltjava.pojo.Thesis;
import com.ltjava.pojo.User;
import com.ltjava.repository.ThesisRepository;
import com.ltjava.service.ThesisService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author HIEN
 */
@Service
public class ThesisServiceImpl implements ThesisService{
    @Autowired
    private ThesisRepository thesisRepository;
    
    @Override
    public List<Thesis> getThesises(String kw) {
        return this.thesisRepository.getThesises(kw);
    }

    @Override
    public boolean addThesis(Thesis thesis) {
        return this.thesisRepository.addThesis(thesis);
    }

    @Override
    public Thesis getThesisById(Integer intgr) {
        return this.thesisRepository.getThesisById(intgr);
    }

    @Override
    public List<Thesis> getThesisesByCouncil(Integer councilId) {
        return this.thesisRepository.getThesisesByCouncil(councilId);
    }

    @Override
    public boolean removeThesis(Thesis thesis) {
        return this.thesisRepository.removeThesis(thesis);
    }

    @Override
    public List<Thesis> getThesisesByUser(String user) {
        return this.thesisRepository.getThesisesByUser(user);
    }
    
}
