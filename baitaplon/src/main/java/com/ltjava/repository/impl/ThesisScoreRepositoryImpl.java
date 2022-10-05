/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.repository.impl;

import com.ltjava.pojo.Council;
import com.ltjava.pojo.Thesis;
import com.ltjava.pojo.ThesisScore;
import com.ltjava.repository.ThesisScoreRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class ThesisScoreRepositoryImpl implements ThesisScoreRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> getThesisScores(Integer councilId) {
        Session s = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root scoreRoot = query.from(ThesisScore.class);
        Root thesisRoot = query.from(Thesis.class);
        Root councilRoot = query.from(Council.class);
        
        query = query.where(builder.equal(thesisRoot.get("councilId"),
                councilRoot.get("id")), 
                builder.equal(scoreRoot.get("thesisId"), thesisRoot.get("id")));
        
        if(councilId!=null){
            Predicate p1 = builder.equal(thesisRoot.get("councilId"), councilId);
            query = query.where(p1);
        }
        
        query.multiselect(thesisRoot.get("id"), 
                thesisRoot.get("topic"), 
                scoreRoot.get("criteriaId"), 
                scoreRoot.get("score"),
                scoreRoot.get("userId"), 
                scoreRoot.get("createdDate"));
//        
//        query.groupBy(thesisRoot.get("id"));
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public ThesisScore getThesisScoreById(Integer id) {
        Session s = sessionFactory.getObject().getCurrentSession();
        ThesisScore u = s.get(ThesisScore.class,id);
        return u;
    }

    @Override
    public boolean addOrUpdate(ThesisScore c) {
        Session s = sessionFactory.getObject().getCurrentSession();
        try{
            s.saveOrUpdate(c);
            System.out.println("THÀNH CÔNGGG");
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
