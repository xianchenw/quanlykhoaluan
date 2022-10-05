<%-- 
    Document   : council
    Created on : Aug 31, 2022, 2:19:15 AM
    Author     : HIEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="col-xl-12 row container-fluid content ">
            <div class="col-xl-3 border-right">
                <h3 class="text-left">QUẢN LÝ HỘI ĐỒNG</h3>
                <div style="padding: 10px">
                    <a href="<c:url value="/council"/>"<p class="text-left text-dark">Danh sách hội đồng</p></a>
                    <a href="<c:url value="/council/criteria"/>"><p class="text-left text-dark">Điểm khóa luận</p></a>
                </div>
            </div>
            <div class="col-xl-9">
                <div class="d-flex flex-row-reverse">
                    <div class="p-2 ">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Search">
                            <div class="input-group-append">
                              <button class="btn btn-success" type="submit">Tìm</button>
                            </div>
                          </div>
                    </div>
                    <div class="p-2">
                        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#addCouncil">Thêm hội đồng</button>
                    </div>
<!--                     Modal thêm hội đồng -->
                    <div class="modal" id="addCouncil">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">

                            <div class="modal-header">
                              <h4 class="modal-title">Thêm hội đồng</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
<!--                                <form:form modelAttribute="councilInfo" action="/baitaplon/council" method="post">
                                    <form:errors path="*" element="div"  cssClass=" alert alert-danger" />
                                    <div class="form-group">
                                        <label for="id">Mã hội đồng:</label>
                                        <form:input path="id" type="text" class="form-control" placeholder="Mã hội đồng" id="id"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label for="president">Chủ tịch:</label>
                                        <form:input path="presidentId" type="text" class="form-control" placeholder="Mã tài khoản" id="president"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label for="secrectary">Thư ký:</label>
                                        <form:input path="secretaryId" type="text" class="form-control" placeholder="Mã tài khoản" id="secretary"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label for="reviewer">Phản biện:</label>
                                        <form:input path="reviewerId" type="text" class="form-control" placeholder="Mã tài khoản" id="reviewer"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label for="member1">Thành viên 1:</label>
                                        <form:input path="member1Id" type="text" class="form-control" placeholder="Mã tài khoản" id="member1"></form:input>
                                    </div>
                                    <div class="form-group">
                                        <label for="member2">Thành viên 2:</label>
                                        <form:input path="member2Id" type="text" class="form-control" placeholder="Mã tài khoản" id="member2"></form:input>
                                    </div>
                                    <input type="submit" class="btn btn-success"  value="Thêm" />
                                </form:form>-->
                            </div>

                            <div class="modal-footer">
                              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                          </div>
                        </div>
                    </div>
                </div>
                <div>
                    <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>Mã hội đồng</th>
                            <th>Chủ tịch</th>
                            <th>Thư ký</th>
                            <th>Phản biện</th>
                            <th>Thành viên</th>
                            <th>Thành viên</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                            <c:if test="${listCouncil !=null}" >
                                <c:forEach items="${listCouncil}" var="cM">
                                    <tr>
                                        <td>${cM[0].id}</td>
                                        <c:if test="${cM[1][0] !=null}">
                                            <td>${cM[1][0].userId}</td>
                                        </c:if>
                                        <c:if test="${cM[1][0] ==null}">
                                            <td></td>
                                        </c:if>
                                        <c:if test="${cM[1][1] !=null}">
                                            <td>${cM[1][1].userId}</td>
                                        </c:if>
                                        <c:if test="${cM[1][1] ==null}">
                                            <td></td>
                                        </c:if>
                                        <c:if test="${cM[1][2] !=null}">
                                            <td>${cM[1][2].userId}</td>
                                        </c:if>
                                        <c:if test="${cM[1][2] ==null}">
                                            <td></td>
                                        </c:if>
                                        <c:if test="${cM[1][3] !=null}">
                                            <td>${cM[1][3].userId}</td>
                                        </c:if>
                                        <c:if test="${cM[1][3] ==null}">
                                            <td></td>
                                        </c:if>
                                        <c:if test="${cM[1][4] !=null}">
                                            <td>${cM[1][4].userId}</td>
                                        </c:if>
                                        <c:if test="${cM[1][4] ==null}">
                                            <td></td>
                                        </c:if>
                                        <c:if test="${cM[0].active == true}">
                                            <td><a href="<c:url value="/council/lock/${cM[0].id}"/>"><button class="btn btn-danger">Khóa hội đồng</button></a></td>
                                        </c:if>
                                        <c:if test="${cM[0].active == false}">
                                            <td>Đã khóa</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            
                            </c:if>
                          
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
    </body>
</html>
