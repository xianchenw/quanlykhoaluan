<%-- 
    Document   : thesis
    Created on : Aug 31, 2022, 2:27:41 AM
    Author     : HIEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <script >
            function addStudent(id){
                console.log(id);
            }
        </script>
        <div class="col-xl-12 row container-fluid content ">
            <div class="col-xl-3 border-right">
                <h3 class="text-left">QUẢN LÝ KHÓA LUẬN</h3>
                <div style="padding: 10px">
                    <a href="<c:url value="/thesis"/>"><p class="text-left text-dark">Danh sách khóa luận</p></a>
                    <a href="<c:url value="/stats"/>"><p class="text-left text-dark">Thống kê</p></a>
                    
                    <a href="<c:url value="/thesis/score/${currentUser.id}"/>"><p class="text-left text-dark">Chấm điểm</p></a>
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
                        <a href="<c:url value="/thesis/addThesis"/>"><button type="button" class="btn btn-outline-info">Thêm khóa luận</button></a>
                    </div>
                </div>
                <div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Chủ đề</th>
                                <th>Nội dung</th>
                                <th>Giảng viên hướng dẫn</th>
                                <th>Sinh viên thực hiện</th>
                                <th>Giảng viên phản biện</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listThesis}" var="l">
                                <tr>
                                    <td>${l.topic}</td>
                                    <td>${l.description}</td>
                                    <td>
                                        <c:forEach items="${l.thesisInstructors}" var="c">
                                            ${c.instructorId.teacherId.firstName} ${c.instructorId.teacherId.lastName}, 
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach items="${l.students}" var="st" >
                                            ${st.firstName} ${st.lastName}
                                        </c:forEach>
                                    </td>
                                    <td>${l.reviewerId.teacherId}</td>
                                    <td><a href="<c:url value="/thesis/${l.id}"/>"><button class="btn btn-info">Chi tiết</button></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
