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
    </head>
    <body>
        <script src="<c:url value="/js/council.js" />"></script>
        <div class="col-xl-12 row container-fluid content ">
            <div class="col-xl-2 border-right">
                <h3 class="text-center">QUẢN LÝ HỘI ĐỒNG</h3>
                <div style="padding: 10px">
                    <a href="<c:url value="/council"/>"<p class="text-left text-dark">Danh sách hội đồng</p></a>
                    <a href="<c:url value="/council/criteria"/>"><p class="text-left text-dark">Điểm khóa luận</p></a>
                </div>
            </div>
        </div>
    </body>
</html>
