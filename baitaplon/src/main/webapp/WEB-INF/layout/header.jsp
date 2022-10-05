<%-- 
    Document   : header
    Created on : Aug 29, 2022, 2:07:25 AM
    Author     : HIEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="d-flex bg-secondary text-dark">
            <div class="p-2 "><a class="nav-link text-light" href="/baitaplon/thesis">Quản lý khóa luận</a></div>
            <div class="p-2 "><a class="nav-link text-light" href="/baitaplon/council">Hội đồng</a></div>
            <div class="p-2 "><a class="nav-link text-light" href="/baitaplon/student">Sinh viên</a></div>
            <div class="p-2 "><a class="nav-link text-light" href="/baitaplon/user">Người dùng</a></div>
            
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <div class="p-2 ml-auto"><a class="nav-link text-light" href="/baitaplon/login">Đăng nhập</a></div>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <div class="dropdown p-2 ml-auto">
                    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">${currentUser.firstName} ${currentUser.lastName}</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="<c:url value="/user/account"/>">Tài khoản</a>
                        <a class="dropdown-item" href="<c:url value="/user/${currentUser.id}/password"/>">Đổi mật khẩu</a>
                      <a class="dropdown-item" href="<c:url value="/logout" />">Đăng xuất</a>
                    </div>
                </div>
            </c:if>
        </div>
        
    </body>
</html>
