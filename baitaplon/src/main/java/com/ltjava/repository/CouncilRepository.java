/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ltjava.repository;

import com.ltjava.pojo.Council;
import java.util.List;

/**
 *
 * @author HIEN
 */
public interface CouncilRepository {
    List<Council> getCouncils(String kw);
    Council getCouncilById(Integer id);
    boolean addCouncil(Council c);
    boolean lockCouncil(Council c);
    boolean removeCouncil(Council c);
    boolean removeCouncilMember(Council c);
    
}
