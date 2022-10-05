/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.repository.impl;

import com.ltjava.pojo.Student;
import com.ltjava.pojo.Thesis;
import com.ltjava.repository.StudentRepository;
import com.ltjava.service.ThesisService;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author HIEN
 */
@Repository
@Transactional
public class StudentRepositoryImpl implements StudentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Autowired
    private ThesisService thesisService;
    
    @Override
    public List<Student> getStudents(String kw) {
        Session s = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Student> query = builder.createQuery(Student.class);
        Root root = query.from(Student.class);
        
        query = query.select(root);
        
        if(!kw.isEmpty() && kw!=null){
            Predicate p1 = builder.like(root.get("firstName").as(String.class),kw);
            Predicate p2 = builder.like(root.get("lastName").as(String.class),kw);
            query = query.where(builder.or(p1,p2));
        }
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public Student getStudentById(String id) {
        Session s = sessionFactory.getObject().getCurrentSession();
        Student u = s.get(Student.class,id);
        return u;
    }

    @Override
    public boolean addOrUpdate(Student student) {
        Session s = sessionFactory.getObject().getCurrentSession();
        try{
            s.save(student);
            System.out.println("THÊM THÀNH CÔNGGG");
            return true;
        }
        catch(Exception ex){
            System.out.println("LỖI RỒIIIII");
            System.out.println(ex.getMessage());
            System.out.println(ex.getStackTrace());
        }
        return false;
    }

    @Override
    public boolean addThesis(Student stdnt, Thesis thesis) {
        Session s = sessionFactory.getObject().getCurrentSession();
        try{
            stdnt.setThesisId(thesis);
            s.update(stdnt);
            return true;
        }
        catch(Exception ex){
            System.out.println("LỖI RỒIIIII");
            System.out.println(ex.getMessage());
            System.out.println(ex.getStackTrace());
        }
        return false;
    }
    
}
