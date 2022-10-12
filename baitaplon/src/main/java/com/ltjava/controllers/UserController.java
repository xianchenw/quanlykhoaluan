/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.controllers;

import com.ltjava.pojo.User;
import com.ltjava.pojo.UserRole;
import com.ltjava.pojo.Word;
import com.ltjava.service.UserRoleService;
import com.ltjava.service.UserService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author HIEN
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserRoleService userRoleService;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    @ModelAttribute
    public void commonAttr(Model model){
        model.addAttribute("listUserRole", this.userRoleService.getUserRoles());
    }
    
    
    @GetMapping("/login")
    public String login(){
        return "login";
    }
    
    @RequestMapping("/user")
    public String user(Model model, @ModelAttribute("userInfo") User userInfo, 
            @RequestParam(value = "kw", required = false, defaultValue ="") String kw){
        model.addAttribute("user",userService.getUsers(kw));
        System.out.println(kw);
        return "user";
    }
    
    @PostMapping(value = "/user")
    public String addUser(@ModelAttribute(value = "userInfo") @Valid User userInfo, 
            BindingResult result){
        if(!result.hasErrors()){
            this.userService.addOrUpdate(userInfo);
            return "redirect:/user";
        }
        return "user";
    }
    
    @RequestMapping("/user/{userId}/password")
    public String password(Model model, 
            @PathVariable(value = "userId") String userId){
        return "password";
    }
    
    @PostMapping("/user/{userId}/password")
    public String changePassword(Model model,@PathVariable(value = "userId") String userId, 
            @RequestParam(value = "oldPassword", required = false, defaultValue = "") String oldPassword, 
            @RequestParam(value="newPassword", required = false, defaultValue = "") String newPassword){
        String msg = "";
        if(passwordEncoder.matches(oldPassword, userService.getUserById(userId).getPassword())){
            userService.changePassword(userService.getUserById(userId), newPassword);
            msg = "ĐỔI MẬT KHẨU THÀNH CÔNG";
        }
        else
            msg = "MẬT KHẨU CŨ KHÔNG KHỚP";
        System.out.println(msg);
        model.addAttribute("msg", msg);
        return "password";
    }
    
    @RequestMapping("/user/account/{userId}")
    public String account(Model model, @PathVariable(value = "userId") String userId){
        model.addAttribute("userPage", userService.getUserById(userId));
        return "account";
    }
    
    @GetMapping("/user/account/edit/{userId}")
    public String userEdit(Model model, @PathVariable(value = "userId") String id, @ModelAttribute(value = "userInfo") User u){
        model.addAttribute("userEdit", userService.getUserById(id));
        return "useritem";
    }
    
    @PostMapping("/user/account/edit/{userId}")
    public String edit(Model model, @PathVariable(value = "userId") String id, @ModelAttribute(value = "userInfo") User u){
        try{
            System.out.println(u.getId());
            System.out.println(u.getUserRole());
            userService.updateUser(userService.getUserById(id), u);
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
        return "redirect:/user";
    }
    
    @GetMapping("/user/account/remove/{userId}")
    public String edit(Model model, @PathVariable(value = "userId") String id){
        try{
            userService.removeUser(userService.getUserById(id));
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
        return "redirect:/user";
    }
}
