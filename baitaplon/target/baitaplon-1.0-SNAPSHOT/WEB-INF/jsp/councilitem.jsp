<%-- 
    Document   : councilitem
    Created on : Oct 14, 2022, 12:15:39 AM
    Author     : HIEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/css/councilItemStyle.css"/>" rel="stylesheet" />
    </head>
    <body>
        
        <script src="<c:url value="/js/council.js" />"></script>
        <script>
            window.onload = function load(){
                checkQuantityMember(document.getElementById('tableMember'), '${councilPage.maxMemberQuantity}', document.getElementById('addMemberArea'));
            }
            var memberId, memberName
            function addMember(id,name){
                console.log(memberId,memberName);
                memberId = id;
                memberName = name;
                document.getElementById('myInput').value = name;
                showFilter();
                console.log(memberId,memberName);
            }
            function addRowMember(){
                console.log(memberId, memberName)
                let isMember = checkMember(memberId,memberName);
                if(isMember){
                    alert("Thành viên đã có trong hội đồng!!!");
                }
                else{
                    var tbBody = document.getElementById('tableMemberBody');
                    tbBody.innerHTML = tbBody.innerHTML + `<tr id="rowRemove`+memberId+`" name="MEMBER">
                                                        <td id="memberIdCell`+memberId+`">`+memberId+`</td>
                                                        <td id="memberNameCell`+memberId+`">`+memberName+`</td>
                                                        <td id="memberRoleCell`+memberId+`" >Thành viên</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">
                                                                    Thay đổi
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <c:forEach items="${listTeacher}" var="s">
                                                                        <a onclick="changeMember('${s.id}', '${s}', document.getElementById('memberNameCell`+memberId+`'), document.getElementById('memberIdCell`+memberId+`'))" class="dropdown-item" href="javascript:;">${s.id} - ${s}</a>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <button class="btn btn-danger" onclick="removeMember(document.getElementById('rowRemove`+memberId+`'),'${councilPage.maxMemberQuantity}')">Xóa</button>
                                                        </td>
                                                    </tr>`;
                    checkQuantityMember(document.getElementById('tableMember'), '${councilPage.maxMemberQuantity}', document.getElementById('addMemberArea'));
                }
            }
        </script>
        <div class="col-xl-12 row container-fluid content ">
            <div class="col-xl-2 border-right">
                <h3 class="text-center">QUẢN LÝ HỘI ĐỒNG</h3>
                <div style="padding: 10px">
                    <a href="<c:url value="/council"/>"<p class="text-left text-dark">Danh sách hội đồng</p></a>
                    <a href="<c:url value="/council/criteria"/>"><p class="text-left text-dark">Điểm khóa luận</p></a>
                </div>
            </div>
            <div class="col-xl-10 ">
                <div id="message"></div>
                <div style="width: 100%; padding: 10px" class="border round-xxlarge">
                    <div class="">
                        <br>
                        <div class="header">
                            <span>
                                <h4 class="title">Hội đồng : ${councilPage.name} </h4>
                                <c:if test="${councilPage.active==false}">
                                    <small class="badge badge-pill badge-danger">Locked</small>
                                </c:if>
                                <c:if test="${councilPage.active==true}">
                                    <small class="badge badge-pill badge-success">Active</small>
                                </c:if>
                            </span>
                        </div>
                        <br>
                        <div class="body">
                            <div style="margin: 40px; margin-top: 20px"  class="form-group">
                                <strong>Danh sách thành viên: </strong>
                                <br>
                                <br>
                                <div>
                                    <table id="tableMember" class="table table-sm">
                                        <thead>
                                            <tr>
                                                <th>Mã thành viên</th>
                                                <th>Thành viên</th>
                                                <th>Chức vụ</th>
                                                <th>Chỉnh sửa</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableMemberBody">
                                            <c:forEach items="${councilPage.members}" var="member">
                                                <c:if test="${member.memberRole.id!=4}">
                                                    <tr id="${member.memberRole.role}" >
                                                        <td id="memberIdCell${member.userId.id}">${member.userId.id}</td>
                                                        <td id="memberNameCell${member.userId.id}">${member.userId.teacherId}</td>
                                                        <td id="memberRoleCell${member.userId.id}">${member.memberRole.rolev}</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">
                                                                    Thay đổi
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <c:forEach items="${listTeacher}" var="s">
                                                                        <a onclick="changeMember('${s.id}', '${s}', document.getElementById('memberNameCell${member.userId.id}'), document.getElementById('memberIdCell${member.userId.id}'))" class="dropdown-item" href="javascript:;">${s.id} - ${s}</a>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${member.memberRole.id==4}">
                                                    <tr id="rowRemove${member.userId.id}" name="${member.memberRole.role}">
                                                        <td id="memberIdCell${member.userId.id}">${member.userId.id}</td>
                                                        <td id="memberNameCell${member.userId.id}">${member.userId.teacherId}</td>
                                                        <td id="memberRoleCell${member.userId.id}" >${member.memberRole.rolev}</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">
                                                                    Thay đổi
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <c:forEach items="${listTeacher}" var="s">
                                                                        <a onclick="changeMember('${s.id}', '${s}', document.getElementById('memberNameCell${member.userId.id}'), document.getElementById('memberIdCell${member.userId.id}'))" class="dropdown-item" href="javascript:;">${s.id} - ${s}</a>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <button class="btn btn-danger" onclick="removeMember(document.getElementById('rowRemove${member.userId.id}'),'${councilPage.maxMemberQuantity}')">Xóa</button>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div id="addMemberArea" >
                                        <div class="filter">
                                            <input id="myInput" onclick="showFilter()" onkeyup="findTeacher()" type="text" placeholder="Tìm giảng viên" />
                                            <div id="myFilter" class="filter-content">
                                                <c:forEach items="${listTeacher}" var="teacher">
                                                    <a onclick="addMember('${teacher.id}', '${teacher}')" href="javascript:;">${teacher}</a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <button onclick="addRowMember()" class="btn btn-success">Thêm</button>
                                    </div>
                                </div>
                                <br>
                            </div>
                        </div>
                        <br>
                        <c:if test="${councilPage.active==false}">
                            <a href="<c:url value="/council/unlock/${councilPage.id}" />"><button class="btn btn-info" >Mở khóa hội đồng</button></a>
                        </c:if>
                        <button onclick="editCouncil('${councilPage.id}', document.getElementById('PRESIDENT'), document.getElementById('SECRETARY'), document.getElementById('REVIEWER'), document.getElementsByName('MEMBER'))" class="btn btn-success" >Cập nhật</button>
                    </div>
                </div>
                <br>
                <div style="width: 100%; padding: 10px" class="border round-xxlarge">
                    <div class="header">
                        <span>
                            <h5 class="title">Danh sách khóa luận</h5>
                        </span>
                    </div>
                    <div name="thesisesArea" >
                        <c:forEach items="${councilPage.thesises}" var="thes">
                            <div style="border: 1px solid gray; border-radius: 10px;padding: 10px;" name="thesisItem" >
                                <h7 style="margin:10px">Khóa luận: ${thes.topic}</h7>
                                <br>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Tiêu chí</th>
                                            <th>Điểm</th>
                                            <th>Người chấm</th>
                                            <th>Thòi gian chấm</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${thes.thesisScores}" var="theScore" >
                                            <tr>
                                                <td>${theScore.criteriaId}</td>
                                                <td>${theScore.score}</td>
                                                <td>${theScore.userId.teacherId.firstName} ${theScore.userId.teacherId.lastName}</td>
                                                <td>${theScore.createdDate}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
