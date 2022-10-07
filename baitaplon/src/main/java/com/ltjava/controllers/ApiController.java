/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.controllers;

import com.ltjava.pojo.Major;
import com.ltjava.pojo.Student;
import com.ltjava.pojo.Thesis;
import com.ltjava.pojo.User;
import com.ltjava.service.MajorService;
import com.ltjava.service.StudentService;
import com.ltjava.service.ThesisService;
import com.ltjava.service.UserService;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author HIEN
 */
@RestController
public class ApiController {
    @Autowired
    ThesisService thesisService;
    
    @Autowired
    UserService userService;
    
    @Autowired
    MajorService majorService;
    
    @Autowired
    StudentService studentService;
    
    @GetMapping("/api/thesises")
    public ResponseEntity<List<Thesis>> listThesises(){
        List<Thesis> thesises = this.thesisService.getThesises("");
        
        return new ResponseEntity<>(thesises, HttpStatus.OK);
    }
    
    @PostMapping(path = "/api/student", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Set<com.ltjava.pojo.Class>> listClasses(@RequestBody Map<String,String> params){
        try{
            Major major = majorService.getMajorById(Integer.parseInt(params.get("majorId")));
            Set<com.ltjava.pojo.Class> listClass = major.getClasses();
            return new ResponseEntity<>(listClass, HttpStatus.OK);
        }
        catch(Exception e){
            System.out.print(e.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "/api/user/addStudent", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Object[]> loadStudent(@RequestBody Map<String, String> params){
        try{
            Object[] result = studentService.getStudentAccount(params.get("studentId"));
            return new ResponseEntity<>(result, HttpStatus.OK);
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @GetMapping(path = "/api/user/loadStudentAccount", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Student>> loadStudentAccount(){
        try{
            List<Student> kq = this.studentService.getListStudentAccount();
            return new ResponseEntity<>(kq, HttpStatus.OK);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "/api/user/selectStudent", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Student> selectStudent(@RequestBody Map<String, String> params){
        try{
            Student kq = this.studentService.getStudentById(params.get("studentId"));
            return new ResponseEntity<>(kq, HttpStatus.OK);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "/api/student/edit", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Student> editStudent(@RequestBody Map<String, String> params){
        try{
            System.out.print(params.get("birthday"));
            this.studentService.updateStudent(params);
            Student student = studentService.getStudentById(params.get("studentId"));
            return new ResponseEntity<>( student,HttpStatus.OK);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
