/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.controllers;

import com.ltjava.pojo.Major;
import com.ltjava.pojo.Student;
import com.ltjava.pojo.User;
import com.ltjava.service.StudentService;
import com.ltjava.service.UserService;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author HIEN
 */
@RestController
public class ApiThesisController {
    @Autowired
    UserService userService;
    
    @Autowired
    StudentService studentService;
    
    @PutMapping(path = "/api/thesis/user", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<User> getUser(@RequestBody Map<String,String> params){
        try{
            User user = userService.getUserById(params.get("userId"));
            return new ResponseEntity<>(user, HttpStatus.OK);
        }
        catch(Exception e){
            System.out.print(e.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PutMapping(path = "/api/thesis/student", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Student> getStudent(@RequestBody Map<String,String> params){
        try{
            Student student = studentService.getStudentById(params.get("studentId"));
            return new ResponseEntity<>(student, HttpStatus.OK);
        }
        catch(Exception e){
            System.out.print(e.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
