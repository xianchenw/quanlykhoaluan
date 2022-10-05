/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.validation.constraints.NotNull;

/**
 *
 * @author HIEN
 */
@Entity
@Table(name = "user")
public class User implements Serializable{
    private static String ADMIN = "ADMIN";
    private static String TEACHER = "TEACHER";
    private static String MANAGER = "MANAGER";
    private static String STUDENT = "STUDENT";
    
    @Id
    private String id;
    private String username;
    private String password;
    @Column(name = "first_name")
    @NotNull(message = "user.firstName.nullMsg")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    private String email;
    @Column(name = "phone_number")
    private String phoneNumber;
    private String birthday;
    @ManyToOne(optional = false)
    @JoinColumn(name= "user_role", referencedColumnName = "id")
    private UserRole userRole;
    private Boolean active;
    @OneToMany(mappedBy = "reviewerId")
    private Set<Thesis> thesises;
    @OneToMany(mappedBy = "instructorId")
    private Set<ThesisInstructor> thesisInstructors;
    @OneToMany(mappedBy = "userId")
    private Set<CouncilMember> members;

    public User(){
        
    }
    
    public User(String id, String username, String password,String firstName, String lastName, String email, String phoneNumber, UserRole userRole){
        this.id = id;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.userRole = userRole;
    }
    
    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the birthday
     */
    public String getBirthday() {
        return birthday;
    }

    /**
     * @param birthday the birthday to set
     */
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    /**
     * @return the userRole
     */
    public UserRole getUserRole() {
        return userRole;
    }

    /**
     * @param userRole the userRole to set
     */
    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }

    /**
     * @return the thesises
     */
    public Set<Thesis> getThesises() {
        return thesises;
    }

    /**
     * @param thesises the thesises to set
     */
    public void setThesises(Set<Thesis> thesises) {
        this.thesises = thesises;
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


    @Override
    public String toString() {
        return String.format("%s %s", this.firstName, this.lastName);
    }

    /**
     * @return the ADMIN
     */
    public static String getADMIN() {
        return ADMIN;
    }

    /**
     * @param aADMIN the ADMIN to set
     */
    public static void setADMIN(String aADMIN) {
        ADMIN = aADMIN;
    }

    /**
     * @return the TEACHER
     */
    public static String getTEACHER() {
        return TEACHER;
    }

    /**
     * @param aTEACHER the TEACHER to set
     */
    public static void setTEACHER(String aTEACHER) {
        TEACHER = aTEACHER;
    }

    /**
     * @return the MANAGER
     */
    public static String getMANAGER() {
        return MANAGER;
    }

    /**
     * @param aMANAGER the MANAGER to set
     */
    public static void setMANAGER(String aMANAGER) {
        MANAGER = aMANAGER;
    }

    /**
     * @return the STUDENT
     */
    public static String getSTUDENT() {
        return STUDENT;
    }

    /**
     * @param aSTUDENT the STUDENT to set
     */
    public static void setSTUDENT(String aSTUDENT) {
        STUDENT = aSTUDENT;
    }

    /**
     * @return the members
     */
    public Set<CouncilMember> getMembers() {
        return members;
    }

    /**
     * @param members the members to set
     */
    public void setMembers(Set<CouncilMember> members) {
        this.members = members;
    }

    /**
     * @return the active
     */
    public Boolean getActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(Boolean active) {
        this.active = active;
    }


    
    
}
