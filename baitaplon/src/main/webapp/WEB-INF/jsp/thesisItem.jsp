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
        <script>
            window.onload = function load(){
                document.getElementById('reviewerId').value = "${thesisPage.reviewerId.id}";
            }
        </script>
        <script src="<c:url value="/js/thesis.js"/>"></script>
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
                <div class="container border round-xlarge">
                    <div class="">
                        <br>
                        <div class="header">
                            <h4 class="title">Khóa luận : ${thesisPage.topic}</h4>
                        </div>
                        <br>
                        <div class="body">
                            <form action="" method="">
                                <form:errors path="*" element="div"  cssClass=" alert alert-danger" />
                                <div class="form-group">
                                    <label for="topic">Chủ đề</label>
                                    <input type="text" class="form-control" placeholder="Chủ đề" id="topic" value="${thesisPage.topic}"></input>
                                </div>
                                <div class="form-group">
                                    <label for="description">Mô tả:</label>
                                    <textarea class="form-control" placeholder="Nội dung" id="description" >${thesisPage.description}</textarea>
                                </div>
                                <br>
                                <div class="input-group">
                                    <c:if test="${thesisPage.reviewerId.id!=null}">
                                        <div style="margin-right: 30px">
                                            <label for="reviewerId">Giảng viên phản biện: <strong><span id="reviewerIdLabel">${thesisPage.reviewerId.id}</span> - <span id="reviewerNameLabel">${thesisPage.reviewerId.firstName} ${thesisPage.reviewerId.lastName}</span></strong></label>
                                        </div>
                                        <select onchange="changeReviewer(this.value)" class="form-control" id="reviewerId">
                                            <c:forEach items="${listTeacher}" var="t">
                                                <option value="${t.id}">${t.id} - ${t.firstName} ${t.lastName}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${thesisPage.reviewerId.id==null}">
                                        <div style="margin-right: 30px">
                                            <label for="reviewerId">Giảng viên phản biện: <strong id="reviewerLabel"><span class="badge badge-danger">Chưa có giảng viên phản biện</span></strong></label>
                                        </div>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                                Thêm giảng viên phản biện
                                            </button>
                                            <div class="dropdown-menu">
                                                <c:forEach items="${listTeacher}" var="te">
                                                    <a onclick="addReviewer(this.innerText)" class="dropdown-item" href="javascript:;">${te.id}</a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                                <br>
                                <div class="form-group">
                                    <strong>Danh sách sinh viên thực hiện: </strong>
                                    <br>
                                    <div>
                                        <table id="tableStudent" class="table">
                                            <thead>
                                                <tr>
                                                    <th>Mã sinh viên</th>
                                                    <th>Tên sinh viên</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${thesisPage.students}" var="st">
                                                    <tr>
                                                        <td id="cellStudentId${st.id}">${st.id}</td>
                                                        <td id="cellStudentName${st.id}">${st.firstName} ${st.lastName}</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                                                                   Chọn sinh viên
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <c:forEach items="${listStudent}" var="s">
                                                                        <a onclick="changeStudent(this.innerText, document.getElementById('cellStudentId${st.id}'), 
                                                                                    document.getElementById('cellStudentName${st.id}'))" class="dropdown-item" 
                                                                                    href="javascript:;">${s.id}</a>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${thesisPage.students.size()<=1}">
                                                    <tr>
                                                        <td id="cellStudentId"></td>
                                                        <td id="cellStudentName"></td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                                                   Thêm sinh viên
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <c:forEach items="${listStudent}" var="st">
                                                                        <a onclick="addStudent(this.innerText, document.getElementById('cellStudentId'), 
                                                                            document.getElementById('cellStudentName'))" class="dropdown-item" href="javascript:;">${st.id}</a>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                    <br>
                                </div>
                                <div class="form-group">
                                    <strong>Danh sách giảng viên hướng dẫn: </strong>
                                    <br>
                                    <div>
                                        <table id="tableInstructor" class="table">
                                            <thead>
                                                <tr>
                                                    <th>Mã giảng viên</th>
                                                    <th>Tên giảng viên</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${thesisPage.thesisInstructors}" var="ins">
                                                    <tr>
                                                        <td id="cellInstructorId${ins.instructorId.id}">${ins.instructorId.id}</td>
                                                        <td id="cellInstructorName${ins.instructorId.id}">${ins.instructorId.firstName} ${ins.instructorId.lastName}</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                                                                   Chọn giảng viên
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <c:forEach items="${listTeacher}" var="te">
                                                                        <a onclick="changeInstructor(this.innerText, document.getElementById('cellInstructorId${ins.instructorId.id}'), 
                                                                                    document.getElementById('cellInstructorName${ins.instructorId.id}'))" class="dropdown-item" 
                                                                                    href="javascript:;">${te.id}</a>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${thesisPage.thesisInstructors.size()<=1}">
                                                    <tr>
                                                        <td id="cellInstructorId"></td>
                                                        <td id="cellInstructorName"></td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                                                   Thêm giảng viên
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <c:forEach items="${listTeacher}" var="te">
                                                                        <a onclick="addInstructor(this.innerText, document.getElementById('cellInstructorId'), 
                                                                                    document.getElementById('cellInstructorName'))" class="dropdown-item" 
                                                                                    href="javascript:;">${te.id}</a>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                    <br>
                                </div>
                                
                                <button class="btn btn-danger" >Xóa khóa luận</button>
                                <input onclick="editThesis(${thesisPage.id}, document.getElementById('topic').value, document.getElementById('description').value,
                                    document.getElementById('reviewerIdLabel').innerText, document.getElementById('tableStudent'), document.getElementById('tableInstructor'))" type="button" class="btn btn-success"  value="Lưu thay đỗi" />

                            </form>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
