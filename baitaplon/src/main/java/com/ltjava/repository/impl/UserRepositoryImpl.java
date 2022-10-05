/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.repository.impl;

import com.ltjava.pojo.User;
import com.ltjava.repository.UserRepository;
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
public class UserRepositoryImpl implements UserRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<User> getUsers(String kw) {
        Session s = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        
        query = query.select(root);
        
        if(!kw.isEmpty() && kw!=null){
            Predicate p1 = builder.like(root.get("userRole").get("name").as(String.class),kw);
            Predicate p2 = builder.like(root.get("username").as(String.class),kw);
            query = query.where(builder.or(p1,p2));
        }
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public User getUserById(String id) {
        Session s = sessionFactory.getObject().getCurrentSession();
        User u = s.get(User.class,id);
        return u;
    }

    @Override
    public boolean addOrUpdate(User user) {
        Session s = sessionFactory.getObject().getCurrentSession();
        try{
            s.save(user);
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
    public boolean changePassword(User user, String pass) {
        Session s = sessionFactory.getObject().getCurrentSession();
        user.setPassword(pass);
        try{
            s.update(user);
            System.out.println("ĐỔI MẬT KHẨU THÀNH CÔNGGG");
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
    public User getUserByUsername(String string) {
        Session s = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        
        query = query.select(root);
        
        query = query.where(builder.equal(root.get("username"), string));
        
        Query q = s.createQuery(query);
        
        return (User)q.getSingleResult();
    }

    @Override
    public boolean updateUser(User oldUser, User newUser) {
        Session s = sessionFactory.getObject().getCurrentSession();
        try{
            oldUser.setFirstName(newUser.getFirstName());
            oldUser.setLastName(newUser.getLastName());
            oldUser.setUserRole(newUser.getUserRole());
            oldUser.setPhoneNumber(newUser.getPhoneNumber());
            oldUser.setUsername(newUser.getUsername());
            oldUser.setPassword(newUser.getPassword());
            s.update(oldUser);
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

    @Override
    public boolean removeUser(User u) {
        Session s = sessionFactory.getObject().getCurrentSession();
        try{
            s.remove(u);
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
    
}
