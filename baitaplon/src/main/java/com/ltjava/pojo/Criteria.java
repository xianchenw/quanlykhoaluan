/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author HIEN
 */
@Entity
@Table(name = "criteria")
public class Criteria implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    @OneToMany(mappedBy = "criteriaId")
    private Set<ThesisScore> thesisScores;

    /**
     * @return the id
     */
    
    public Criteria(){
    }
    
    public Criteria(String name){
        this.name = name;
    }
    
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the thesisScores
     */
    public Set<ThesisScore> getThesisScores() {
        return thesisScores;
    }

    /**
     * @param thesisScores the thesisScores to set
     */
    public void setThesisScores(Set<ThesisScore> thesisScores) {
        this.thesisScores = thesisScores;
    }
    
    
}
