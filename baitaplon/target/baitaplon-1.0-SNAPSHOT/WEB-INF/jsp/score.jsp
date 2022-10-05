<%-- 
    Document   : score
    Created on : Sep 5, 2022, 3:25:43 PM
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
        <div class="col-xl-12 row container-fluid content ">
            <div class="col-xl-3 border-right">
                <h3 class="text-left">CHẤM ĐIỂM</h3>
                <div style="padding: 10px">
                    <a href="<c:url value="/thesis"/>"><p class="text-left text-dark">Danh sách khóa luận</p></a>
                    <a href="<c:url value="/stats"/>"><p class="text-left text-dark">Thống kê</p></a>

                    <a href="<c:url value="/thesis/score/${currentUser.id}"/>"><p class="text-left text-dark">Chấm điểm</p></a>
                </div>
            </div>
            <div class="col-xl-9"
                 <c:if test="${thesisess!=null}">
                    <c:forEach items="${thesisess}" var="j">
                    <div style="border: 1px solid gray; border-radius: 10px;padding: 10px;" >
                        <div>
                            <h5>Khóa luận : ${j.topic}</h5>
                        </div>
                        <div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Tiêu chí</th>
                                        <th>Điểm</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${j.thesisScores}" var="s">
                                        <tr>
                                            <td>
                                                ${s.criteriaId.name}
                                            </td>
                                            <td>
                                                <c:if test="${s.score!=null}">${s.score}</c:if>
                                                <c:if test="${s.score==null}">
                                                    <input type="text" />
                                                    <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#addScore">Chấm</button>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </body>
</html>
