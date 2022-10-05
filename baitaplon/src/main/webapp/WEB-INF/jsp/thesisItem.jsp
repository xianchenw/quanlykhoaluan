<%-- 
    Document   : thesisItem
    Created on : Sep 5, 2022, 12:25:52 PM
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
        <c:if test="${thesisPage!=null}">
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-9 border-right border-left center">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Khóa luận</h4>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label  class="labels">Mã khóa luận</label><input disabled="true" type="text" class="form-control" value="${thesisPage.id}"></div>
                            <div class="col-md-6"><label class="labels">Chủ đề</label><input disabled="true" type="text" class="form-control" value="${thesisPage.topic}"></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12"><label class="labels">Mô tả</label><textarea disabled="true" type="text" class="form-control">${thesisPage.description}</textarea></div>
                            <br>
                            <div class="col-md-12">
                                <label class="labels">Giáo viên hướng dẫn</label>
                                <div>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Mã giảng viên</th>
                                                <th>Tên giảng viên</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${thesisPage.thesisInstructors}" var="t">
                                            <tr>
                                                <td>${t.instructorId.id}</td>
                                                <td>${t.instructorId.firstName} ${t.instructorId.lastName}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <br>
                            <div class="col-md-12">
                                <label class="labels">Sinh viên thực hiện</label>
                                <div>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Mã sinh viên</th>
                                                <th>Tên sinh viên</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${thesisPage.students}" var="c">
                                            <tr>
                                                <td>${c.id}</td>
                                                <td>${c.firstName} ${c.lastName}  </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6"><label class="labels">Giảng viên phản biện</label><input disabled="true" type="text" class="form-control"value="${thesisPage.reviewerId.firstName} ${thesisPage.reviewerId.lastName}"></div>
                        </div>
                        <div class="mt-5 text-center"><a href="#"><button class="btn btn-primary profile-button" type="button">Lưu</button></a></div>
                    </div>
                </div>
            </div>
        </div>
        </c:if>
    </body>
</html>
