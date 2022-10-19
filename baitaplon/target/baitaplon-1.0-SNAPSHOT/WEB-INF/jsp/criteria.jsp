<%-- 
    Document   : criteria
    Created on : Sep 3, 2022, 5:24:08 AM
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
        <div class="col-xl-12 row container-fluid content ">
            <div class="col-xl-3 border-right">
                <h3 class="text-left">CHẤM ĐIỂM KHÓA LUẬN</h3>
                <div style="padding: 10px">
                    <a href="<c:url value="/council"/>"><p class="text-left text-dark">Danh sách hội đồng</p></a>
                    <a href="<c:url value="/council/criteria"/>"><p class="text-left text-dark">Điểm khóa luận</p></a>
                </div>
            </div>
            <div class="col-xl-9">
                <div class="d-flex">
                    <div class="p-2">
                        <form action="" method="">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" name="councilId" placeholder="Nhập mã hội đồng">
                                <div class="input-group-append">
                                    <button class="btn btn-success" type="submit">Tìm</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="p-2">
                        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#addCriteria">Thêm tiêu chí mới</button>
                    </div>
                    <!--                     Modal thêm tiêu chí -->
                    <div class="modal" id="addCriteria">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h4 class="modal-title">Thêm tiêu chí mới</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <div class="modal-body">
                                    <form:form modelAttribute="criteriaInfo" action="/baitaplon/council/criteria" method="post">
                                        <form:errors path="*" element="div"  cssClass=" alert alert-danger" />
                                        <div class="form-group">
                                            <label for="name">Thêm tiêu chí mới:</label>
                                            <form:input path="name" name="name" type="text" class="form-control" placeholder="Tên tiêu chí mới" id="name"></form:input>
                                            </div>
                                            <input type="submit" class="btn btn-success"  value="Thêm" />

                                    </form:form>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${listThesis.size()>0}">
                    <c:forEach items="${listThesis}" var="thesis">
                        <div style="border: 1px solid gray; border-radius: 10px;padding: 10px;">
                            <div class="d-flex">
                                <div class="p-2 ">
                                    <h5>Mã khóa luận : ${thesis.id}</h5>
                                    <h5>Chủ đề : ${thesis.topic}</h5>
                                </div>
                                    <c:url value="/council/criteria/${thesis.id}" var="thesisScore"></c:url>
                                <div class="p-2">
                                    <a href="${thesisScore}" ><button type="button" class="btn btn-outline-info">Chi tiết</button></a>
                                </div>
                            </div>
                            <div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Tiêu chí</th>
                                            <th>Điểm</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${thesis.thesisScores}" var="s">
                                        <tr>
                                            <td>${s.criteriaId.name}</td>
                                            <c:if test="${s.score!=null}">
                                                <td>${s.score}</td>
                                                <td><button class="btn btn-secondary" data-toggle="modal" data-target="#editScore">Sửa</button></td>
                                                 <!--                     Modal sửa điểm -->
                                                <div class="modal" id="editScore">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <form action="/baitaplon/thesis/addScore${s.id}" method="post">
                                                                    <form:errors path="*" element="div"  cssClass=" alert alert-danger" />
                                                                    <div class="form-group">
                                                                        <label for="name">Điểm:</label>
                                                                        <input name="score" type="text" class="form-control" value="${s.score}" id="scoreEdit${s.id}"/>
                                                                    </div>
                                                                        <input type="submit" class="btn btn-success"  value="Cập nhật" />
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${s.score==null}">
                                                <td></td>
                                                <td><button class="btn btn-success" data-toggle="modal" data-target="#addScore">Thêm điểm</button></td>
                                                <!--                     Modal thêm điểm -->
                                                <div class="modal" id="addScore">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <form action="/baitaplon/thesis/addScore${s.id}" method="post">
                                                                    <form:errors path="*" element="div"  cssClass=" alert alert-danger" />
                                                                    <div class="form-group">
                                                                        <label for="name">Điểm:</label>
                                                                        <input name="score" type="text" class="form-control"  id="score${s.id}"/>
                                                                        </div>
                                                                        <input type="submit" class="btn btn-success"  value="Thêm" />
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <br>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </body>
</html>
