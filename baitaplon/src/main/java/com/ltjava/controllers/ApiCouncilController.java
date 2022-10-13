/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltjava.controllers;

import com.ltjava.pojo.Council;
import com.ltjava.pojo.CouncilMember;
import com.ltjava.pojo.User;
import com.ltjava.service.CouncilMemberService;
import com.ltjava.service.CouncilService;
import com.ltjava.service.MemberRoleService;
import com.ltjava.service.UserService;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author HIEN
 */
@RestController
public class ApiCouncilController {
    @Autowired
    private CouncilService councilService;
    
    @Autowired 
    private UserService userService;
    
    @Autowired
    private CouncilMemberService councilMemberService;
    
    @Autowired
    private MemberRoleService memberRoleService;
    
    @PostMapping(path = "/api/council/add", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Council> addCouncil(@RequestBody Map<String,String> params){
        try{
            Council council = new Council(params.get("name"));
            User president = userService.getUserById(params.get("presidentId"));
            User secretary = userService.getUserById(params.get("secretaryId"));
            User reviewer = userService.getUserById(params.get("reviewerId"));
            if(councilService.addCouncil(council)){
                this.councilMemberService.addCouncilMember(new CouncilMember(council, president, memberRoleService.getMemberRoleById(1)));
                this.councilMemberService.addCouncilMember(new CouncilMember(council, secretary, memberRoleService.getMemberRoleById(2)));
                this.councilMemberService.addCouncilMember(new CouncilMember(council, reviewer, memberRoleService.getMemberRoleById(3)));
                if(userService.getUserById(params.get("member1"))!=null){
                    this.councilMemberService.addCouncilMember(new CouncilMember(council,userService.getUserById(params.get("member1")) , memberRoleService.getMemberRoleById(4)));
                }
                if(userService.getUserById(params.get("member2"))!=null){
                    this.councilMemberService.addCouncilMember(new CouncilMember(council,userService.getUserById(params.get("member2")) , memberRoleService.getMemberRoleById(5)));
                }
                System.out.println("THÊM DANH SÁCH THÀNH VIÊN THÀNH CÔNG");
            }
            else{
                System.out.println("THÊM HỘI ĐỒNG THẤT BẠI");
            }
            return new ResponseEntity<>(council, HttpStatus.OK);
        }
        catch(Exception e){
            System.out.print(e.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
