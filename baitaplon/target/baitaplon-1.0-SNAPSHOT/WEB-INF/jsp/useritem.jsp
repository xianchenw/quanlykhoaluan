<%-- 
    Document   : useritem
    Created on : Aug 31, 2022, 12:43:29 PM
    Author     : HIEN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <script>
            window.onload = function load(){
                document.getElementById("${userEdit.userRole.name}").selected = true;
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
                <div class="border-right">
                    <c:if test="${userEdit != null}">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Tài khoản</h4>
                        </div>
                        <form  action="/baitaplon/user/account/edit/${userEdit.id}" method="post">
                        <div class="row mt-3">
                            <div class="col-md-3">
                                <label class="labels">Mã người dùng</label>
                                <input  disabled="true" type="text" class="form-control" value="${userEdit.id}"></input>
                            </div>
                            <div class="col-md-4 form-group">
                                <label class="labels">Phân quyền</label>
                                <select  class="form-control">
                                    <c:forEach var="u" items="${listUserRole}">
                                        <option id="${u.name}" value="${u.id}">${u.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label class="labels">Họ và tên lót</label>
                                <input type="text" class="form-control"></input>
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Tên</label>
                                <input type="text" class="form-control"></input>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label class="labels">Số điện thoại</label>
                                <input type="text" class="form-control"></input>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Email</label>
                                <input type="text" class="form-control" value=""></input>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label class="labels">Tên đăng nhập</label>
                                <input type="text" class="form-control" value="${userEdit.username}"></input>
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Mật khẩu</label>
                                <input type="text" class="form-control" value="${userEdit.password}"></input>
                            </div>
                        </div>
                        <div class="mt-5 text-center">
                        <c:if test="${userEdit.active == true}">
                            <a href="/baitaplon/user/lock/${userEdit.id}">
                                <button class="btn btn-secondary profile-button" type="button">Khóa tài khoản</button>
                            </a>
                        </c:if>
                        <c:if test="${userEdit.active == false}">
                            <a href="/baitaplon/user/unlock/${userEdit.id}">
                                <button class="btn btn-succes profile-button" type="button">Mở khóa tài khoản</button>
                            </a>
                        </c:if>    
                            <a href="#" style="margin-left: 20px; margin-right: 20px">
                                <button class="btn btn-primary profile-button" type="submit">Lưu thay đổi</button>
                            </a>
                            <a href="#">
                                <button class="btn btn-danger profile-button" type="button">Thoát</button>
                            </a>
                        </div>
                        </form>
                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
