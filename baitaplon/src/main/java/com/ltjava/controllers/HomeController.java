/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.controllers;

import com.ltjava.pojo.Council;
import com.ltjava.pojo.CouncilMember;
import com.ltjava.pojo.Student;
import com.ltjava.pojo.User;
import com.ltjava.service.CouncilMemberService;
import com.ltjava.service.CouncilService;
import com.ltjava.service.CriteriaService;
import com.ltjava.service.StatsService;
import com.ltjava.service.StudentService;
import com.ltjava.service.ThesisScoreService;
import com.ltjava.service.UserService;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author HIEN
 */
@Controller
@ControllerAdvice
public class HomeController {
    @Autowired
    private StatsService statsService;
    
    @Autowired
    private ThesisScoreService thesisScoreService;
    
    @Autowired
    private CriteriaService criteriaService;
    
    @Autowired
    private UserService userService;
    
    public User user;
    
    @ModelAttribute
    public void commonAttr(Model model, HttpSession Session){
        if(Session.getAttribute("currentUser")!=null){
            user = (User) Session.getAttribute("currentUser");
            model.addAttribute("currentUser", this.userService.getUserById(user.getId()));
        }
    }
    
    @RequestMapping("/")
    public String index(HttpSession Session){
        return "thesis";
    }
}
