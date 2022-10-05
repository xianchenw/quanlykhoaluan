/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.controllers;

import com.ltjava.pojo.Major;
import com.ltjava.pojo.Student;
import com.ltjava.pojo.User;
import com.ltjava.service.ClassService;
import com.ltjava.service.MajorService;
import com.ltjava.service.StudentService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author HIEN
 */
@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;
    
    @Autowired
    private ClassService classService;
    
    @Autowired
    private MajorService majorService;
    
    @ModelAttribute
    public void commonAttr(Model model){
        model.addAttribute("listMajor", this.majorService.getMajors(""));
    }
    
    @RequestMapping("/student")
    public String student(Model model, 
            @RequestParam(value = "kw", required = false, defaultValue ="") String kw){
        model.addAttribute("studentInfo", new Student());
        model.addAttribute("listStudent", studentService.getStudents(kw));
        return "student";
    }
    
    @PostMapping(value = "/student")
    public String addStudent(@ModelAttribute(value = "studentInfo")Student studentInfo){
        if(this.studentService.addOrUpdate(studentInfo)){
            return "redirect:/student";
        }
        return "/";
    }
    
    @RequestMapping("/student/class")
    public String studentClass(Model model, 
            @RequestParam(value = "kw", required = false, defaultValue ="") String kw){
        model.addAttribute("classInfo", new com.ltjava.pojo.Class());
        model.addAttribute("listClass", classService.getClasses(kw));
        return "class";
    }
    
    @PostMapping(value = "/student/class")
    public String addClass(@ModelAttribute(value = "classInfo") com.ltjava.pojo.Class classInfo){
        if(this.classService.addClass(classInfo)){
            return "redirect:/student/class";
        }
        return "/";
    }
    
    @RequestMapping("/student/major")
    public String studentMajor(Model model, 
            @RequestParam(value = "kw", required = false, defaultValue ="") String kw){
        model.addAttribute("majorInfo", new Major());
        model.addAttribute("listMajor", majorService.getMajors(kw));
        return "major";
    }
    
    @PostMapping(value = "/student/major")
    public String addMajor(@ModelAttribute(value = "majorInfo") Major majorInfo){ 
        System.out.print(majorInfo.getName());
        if(this.majorService.addMajor(majorInfo)){
            return "redirect:/student/major";
        }
        return "/";
    }
    
    @GetMapping(value = "/student/major/remove/{majorId}")
    public String removeMajor(@PathVariable(value = "majorId") Integer id){
        try{
            majorService.removeMajor(majorService.getMajorById(id));
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
        return "redirect:/student/major";
    }
    
}
