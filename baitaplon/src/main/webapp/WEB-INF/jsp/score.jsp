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
        <script>
            window.onload = function load(){
                var tables = document.getElementsByName('scoreTable');
                for(let i=0; i<tables.length;i++){
                    console.log(tables[i].rows.length);
                    for(let j =0; j<tables[i].rows.length-1; j++){
                        let criteriaId = tables[i].rows[j+1].id;
                        console.log(criteriaId);
                        if(tables[i].rows[j+1].cells.item(1).innerText==""){
                            tables[i].rows[j+1].cells.item(2).innerHTML = 
                                `<button class="btn btn-success" data-toggle="modal" data-target="#addScore`+criteriaId+`">Thêm</button>
                                    <div class="modal" id="addScore`+criteriaId+`">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <form action="/baitaplon/thesis/score/${currentUser.id}/addScore/`+criteriaId+`" method="post">
                                                        <form:errors path="*" element="div"  cssClass=" alert alert-danger" />
                                                        <div class="form-group">
                                                            <label for="name">Điểm:</label>
                                                            <input name="score" type="text" class="form-control"  id="score"/>
                                                            </div>
                                                            <input type="submit" class="btn btn-success"  value="Thêm" />
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>`;
                        }
                        else{
                            tables[i].rows[j+1].cells.item(2).innerHTML = 
                                    `<button class="btn btn-secondary" data-toggle="modal" data-target="#editScore`+criteriaId+`">Chỉnh sửa</button>
            <!--                     Modal thêm điểm -->
                                    <div class="modal" id="editScore`+criteriaId+`">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <form action="/baitaplon/thesis/score/${currentUser.id}/editScore/`+criteriaId+`" method="post">
                                                        <form:errors path="*" element="div"  cssClass=" alert alert-danger" />
                                                        <div class="form-group">
                                                            <label for="name">Điểm:</label>
                                                            <input name="score" type="text" value="`+tables[i].rows[j+1].cells.item(1).innerText+`" class="form-control"  id="score"/>
                                                            </div>
                                                            <input type="submit" class="btn btn-success"  value="Thêm" />
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>`;
                        }
                    }
                }
                
            }
        </script>
        <div class="col-xl-12 row container-fluid content ">
            <div class="col-xl-3 border-right">
                <h3 class="text-left">CHẤM ĐIỂM</h3>
                <div style="padding: 10px">
                    <a href="<c:url value="/thesis"/>"><p class="text-left text-dark">Danh sách khóa luận</p></a>
                    <a href="<c:url value="/stats"/>"><p class="text-left text-dark">Thống kê</p></a>

                    <a href="<c:url value="/thesis/score/${currentUser.id}"/>"><p class="text-left text-dark">Chấm điểm</p></a>
                </div>
            </div>
            <div class="col-xl-9">
                 <c:if test="${currentUser!=null}">
                    <c:forEach items="${currentUser.members}" var="member">
                        <c:forEach items="${member.councilId.thesises}" var="j" >
                            <div style="border: 1px solid gray; border-radius: 10px;padding: 10px;" >
                                <div>
                                    <h5>Khóa luận : ${j.topic}</h5>
                                </div>
                                <div>
                                    <table name="scoreTable" class="table">
                                        <thead>
                                            <tr>
                                                <th>Tiêu chí</th>
                                                <th>Điểm</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${j.thesisCriterias}" var="thesisCriteria">
                                                <tr id="${thesisCriteria.id}">
                                                    <td>
                                                        ${thesisCriteria.criteriaId}
                                                    </td>
                                                    <td id="scoreArea${thesisCriteria.id}" >
                                                        <c:forEach items="${thesisCriteria.thesisScores}" var="thesisScore">
                                                            <c:if test="${thesisScore.userId == currentUser}" >
                                                                ${thesisScore.score}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td name="buttonArea${thesisCriteria.id}"></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <br>
                        </c:forEach>
                        
                    </c:forEach>
                </c:if>
                <c:if test="${currentUser.id==null}">
                    <h1>Vui lòng đăng nhập để thực hiện chức năng này!!!</h1>
                </c:if>
            </div>
        </div>
    </body>
</html>
