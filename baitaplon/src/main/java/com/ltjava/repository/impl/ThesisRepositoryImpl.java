/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.repository.impl;

import com.ltjava.pojo.Council;
import com.ltjava.pojo.Student;
import com.ltjava.pojo.Thesis;
import com.ltjava.pojo.ThesisInstructor;
import com.ltjava.pojo.User;
import com.ltjava.repository.ThesisRepository;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
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
public class ThesisRepositoryImpl implements ThesisRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Thesis> getThesises(String kw) {
        Session s = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Thesis> query = builder.createQuery(Thesis.class);
        Root root = query.from(Thesis.class);
        
        query = query.select(root);
        
        if(!kw.isEmpty() && kw!=null){
            Predicate p1 = builder.like(root.get("topic").as(String.class),kw);
            Predicate p2 = builder.like(root.get("description").as(String.class),kw);
            query = query.where(builder.or(p1,p2));
        }
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public boolean addThesis(Thesis thesis) {
        Session s = sessionFactory.getObject().getCurrentSession();
        try{
            s.save(thesis);
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
    public Thesis getThesisById(Integer id) {
        Session s = sessionFactory.getObject().getCurrentSession();
        Thesis t = new Thesis();
        try{
            t = s.get(Thesis.class,id);
        }
        catch(Exception e){
            System.out.println("Loeuifhihfdhf");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return t;
    }

    @Override
    public List<Thesis> getThesisesByCouncil(Integer councilId) {
        Session s = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Thesis> query = builder.createQuery(Thesis.class);
        Root Troot = query.from(Thesis.class);
        query= query.select(Troot);
        
        if(councilId!=null){
            Predicate p1 = builder.equal(Troot.get("councilId").get("id").as(Integer.class), councilId);
            query = query.where(p1);
        }
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public boolean removeThesis(Thesis intgr) {
        Session s = sessionFactory.getObject().getCurrentSession();
        try{
            s.remove(intgr);
            System.out.println("XÓA THÀNH CÔNGGG");
            return true;
        }
        catch(Exception ex){
            System.out.println("LỖI RỒIIIII");
            System.out.println(ex.getMessage());
            System.out.println(ex.getStackTrace());
        }
        return false;
    }

//    @Override
//    public List<Thesis> getThesisesByUser(String u) {
//        List<Thesis> list  = new ArrayList<>();
//        Session s = sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = s.getCriteriaBuilder();
//        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
//        Root thesisRoot = query.from(Thesis.class);
//        Root councilRoot = query.from(Council.class);
//        
//        Predicate p1 = builder.equal(councilRoot.get("presidentId").get("id"),u);
//        Predicate p2 = builder.equal(councilRoot.get("secretaryId").get("id"),u);
//        Predicate p3 = builder.equal(councilRoot.get("reviewerId").get("id"),u);
//        Predicate p4 = builder.equal(councilRoot.get("member1Id").get("id"),u);
//        Predicate p5 = builder.equal(councilRoot.get("member2Id").get("id"),u);
//        
//        Predicate p6 = builder.equal(thesisRoot.get("councilId"),councilRoot.get("id"));
//        Predicate p7 = builder.equal(councilRoot.get("active"),true);
//        
//        query  = query.where(builder.and(builder.or(p1,p2,p3,p4,p5),p6,p7));
//        query.multiselect(thesisRoot.get("id"), councilRoot.get("id"));
//        
//        Query q = s.createQuery(query);
//        
//        List<Object[]> listO = q.getResultList();
//        
//        for (Object[] objects : listO) {
//            list.add(getThesisById((Integer) objects[0]));
//        }
//        return list;
//    }

    @Override
    public boolean updateThesis(Integer id, String topic, String description, User reviewer, Set<Student> students) {
        Session s = sessionFactory.getObject().getCurrentSession();
        Thesis thesis = getThesisById(id);
        try{
            if(thesis.getStudents().size()>0){
                for(Student student:thesis.getStudents()){
                    student.setThesisId(null);
                    s.update(student);
                }
            }
            thesis.setTopic(topic);
            thesis.setDescription(description);
            thesis.setReviewerId(reviewer);
            for(Student st : students){
                st.setThesisId(thesis);
                s.update(st);
            }
            s.update(thesis);
            System.out.println("CẬP NHẬT THÀNH CÔNGGG");
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
