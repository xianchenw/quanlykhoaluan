/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author HIEN
 */
@Entity
@Table(name = "thesis")
public class Thesis implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String topic;
    private String description;
    @ManyToOne
    @JoinColumn(name = "reviewer_id", referencedColumnName = "id")
    private User reviewerId;
    @ManyToOne
    @JoinColumn(name = "council_id", referencedColumnName = "id")
    private Council councilId;
    @OneToMany(mappedBy = "thesisId", fetch = FetchType.EAGER)
    private Set<Student> students;
    @OneToMany(mappedBy = "thesisId", fetch = FetchType.EAGER)
    private Set<ThesisScore> thesisScores;
    @OneToMany(mappedBy = "thesisId", fetch = FetchType.EAGER)
    private Set<ThesisInstructor> thesisInstructors;

    /**
     * @return the id
     */
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
     * @return the topic
     */
    public String getTopic() {
        return topic;
    }

    /**
     * @param topic the topic to set
     */
    public void setTopic(String topic) {
        this.topic = topic;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the reviewerId
     */
    public User getReviewerId() {
        return reviewerId;
    }

    /**
     * @param reviewerId the reviewerId to set
     */
    public void setReviewerId(User reviewerId) {
        this.reviewerId = reviewerId;
    }

    /**
     * @return the councilId
     */
    public Council getCouncilId() {
        return councilId;
    }

    /**
     * @param councilId the councilId to set
     */
    public void setCouncilId(Council councilId) {
        this.councilId = councilId;
    }

    /**
     * @return the students
     */
    public Set<Student> getStudents() {
        return students;
    }

    /**
     * @param students the students to set
     */
    public void setStudents(Set<Student> students) {
        this.students = students;
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

    /**
     * @return the thesisInstructors
     */
    public Set<ThesisInstructor> getThesisInstructors() {
        return thesisInstructors;
    }

    /**
     * @param thesisInstructors the thesisInstructors to set
     */
    public void setThesisInstructors(Set<ThesisInstructor> thesisInstructors) {
        this.thesisInstructors = thesisInstructors;
    }
    
}
