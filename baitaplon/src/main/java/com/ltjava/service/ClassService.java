/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ltjava.service;

import java.util.List;

/**
 *
 * @author HIEN
 */
public interface ClassService {
    List<com.ltjava.pojo.Class> getClasses(String kw);
    com.ltjava.pojo.Class getClassByName(String name);
    boolean addClass(com.ltjava.pojo.Class c);
}
