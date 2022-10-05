/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ltjava.repository;

import com.ltjava.pojo.User;
import java.util.List;

/**
 *
 * @author HIEN
 */
public interface UserRepository {
    List<User> getUsers(String kw);
    User getUserById(String id);
    User getUserByUsername(String name);
    boolean addOrUpdate(User user);
    boolean changePassword(User user, String pass);
    boolean updateUser(User oldUser, User newUser);
    boolean removeUser(User u);
}
