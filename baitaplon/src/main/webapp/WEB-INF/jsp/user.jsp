<%-- 
    Document   : user
    Created on : Aug 30, 2022, 11:45:11 PM
    Author     : HIEN
--%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <script src="<c:url value="/js/user.js"/>"></script>
        <script>
            window.onload = function load(){
                fillId();
            }
            function fillId(){
                let a = document.getElementById('list-userrole');
                let b = document.getElementById('id');
                console.log(a.value)
                let area = document.getElementById('areaListStudent');
                
                if(a.value==4){
                    b.value = "SV";
                    area.innerHTML = `<label for="list-userrole">Danh sách sinh viên chưa có tài khoản: </label>
                                        <select onchange="selectStudent(this.value)" class="form-control" id="listStudent" name="listStudent">
                                        </select>`;
                    loadListStudent();
                }
                else{
                    area.innerHTML = ``;
                    if(a.value==3){
                        b.value = "GV";
                    }
                    if(a.value==1||a.value==2){
                        b.value = ""
                    }
                }
                
            }
        </script>
        <div class="container-fluid col-xl-12 row content" >
            <!-- LEFT -->
            <div class="col-xl-3 border-right left" style="padding-left: 30px">
                <h3 class="text-left">QUẢN LÝ NGƯỜI DÙNG</h3>
                <div style="padding: 10px">
                    <a href="<c:url value="/user/"/>?kw=TEACHER"><p class="text-left text-dark">Giảng viên</p></a>
                    <a href="<c:url value="/user/"/>?kw=STUDENT"><p class="text-left text-dark">Sinh viên</p></a>
                    <a href="<c:url value="/user/"/>?kw=MANAGER"><p class="text-left text-dark">Giáo vụ khoa</p></a>
                    <a href="<c:url value="/user/"/>?kw=ADMIN"><p class="text-left text-dark">Quản trị</p></a>
                </div>
            </div>
            
            <!-- RIGHT -->
            <div class="col-xl-9 right">
                <div class="d-flex flex-row-reverse">
                    <div class="p-2 ">
                        <form action="" method="">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" name="kw" placeholder="Search">
                                <div class="input-group-append">
                                  <button class="btn btn-success" type="submit">Tìm</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="p-2">
                        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#addUserModal">Thêm tài khoản</button>
                    </div>
<!--                     Modal thêm tài khoản -->
                    <div class="modal" id="addUserModal">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">

                            <div class="modal-header">
                              <h4 class="modal-title">Thêm tài khoản người dùng</h4>
                              <button type="button" class="close" data-dismiss="modal"></button>
                            </div>

                            <div class="modal-body">
                                <form:form modelAttribute="userInfo" action="/baitaplon/user" method="post">
                                    <form:errors path="*" element="div"  cssClass=" alert alert-danger" />
                                    <div class = "form-group">
                                        <label for="list-userrole">Phân quyền: </label>
                                        <form:select onchange="fillId()" path="userRole" cssClass="form-control" id="list-userrole" name="list-userrole">
                                            <c:forEach var="u" items="${listUserRole}" >
                                                <option id="${u.name}" value="${u.id}">${u.name}</option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                    <div id="areaListStudent" class="form-group">
                                    </div>
                                    <div class="form-group">
                                        <label for="id">Mã người dùng:</label>
                                        <form:input onblur="loadStudent(this.value)" path="id" type="text" cssClass="form-control" placeholder="Example: 1951052052" id="id"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Tên người dùng:</label>
                                        <div class="row" id="name">
                                            <div class="col">
                                                <form:input path="firstName" type="text" class="form-control" id="first-name" placeholder="Trần Thị Thu" name="first-name"></form:input>
                                            </div>
                                            <div class="col">
                                                <form:input path="lastName" type="text" class="form-control" id="last-name"  placeholder="Hiền" name="last-name"></form:input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <form:input path="email" type="email" class="form-control" placeholder="thuhien.tran060801@gmail.com" id="email"></form:input>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col">
                                            <label for="phone-number">Số điện thoại: <label/>
                                            <form:input path="phoneNumber" type="text" class="form-control" placeholder="0964345626" id="phone-number"></form:input>
                                        </div>
                                        <div class="col">
                                            <label for="birthday">Ngày sinh: <label/>
                                            <form:input path="birthday" type="date" class="form-control" id="birthday" name="birthday"></form:input>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="account">Tài khoản:</label>
                                        <div class="row" id="account">
                                            <div class="col">
                                                <form:input path="username" type="text" class="form-control" id="username" placeholder="Username" name="username"></form:input>
                                            </div>
                                            <div class="col">
                                                <form:input path="password" type="password" class="form-control" id="password"  placeholder="Password" name="password"></form:input>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" class="btn btn-success"  value="Thêm" />
                                </form:form>
                            </div>

                            <div class="modal-footer">
                              <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
                            </div>

                          </div>
                        </div>
                    </div>
                </div>
                <div>
                    <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>Mã người dùng</th>
                            <th>Tên người dùng</th>
                            <th>Email</th>
                            <th>Chức vụ</th>
                            <th></th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="u" items="${user}">
                            <tr>
                                <td>${u.id}</td>
                                <td>${u.firstName} ${u.lastName}</td>
                                <td>${u.email}</td>
                                <td>${u.userRole}</td>
                                <td>
                                    <a href="<c:url value="/user/account/edit/${u.id}"/>">
                                        <button class="btn btn-secondary btn-sm">Chỉnh sửa</button>
                                    </a>
                                </td>
                                <td>
                                    <a href="<c:url value="/user/account/remove/${u.id}"/>">
                                        <button onclick="" class="btn btn-danger btn-sm">Xóa</button>
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
    </body>
</html>
