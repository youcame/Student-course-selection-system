<%--
  Created by IntelliJ IDEA.
  User: HUANG
  Date: 2023/5/8
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <link rel="stylesheet" href="css/approval.css">
  <script type="application/javascript" src="js/my.js"></script>
  <title>申请查询结果</title>
</head>
<body>
<div class="header">
  <h1>申请查询结果</h1>
</div>
<div class="table-container">
  <table align="center" border="1">
    <tr>
      <th>申请id</th>
      <th>课程名称</th>
      <th>学生id</th>
      <th>老师id</th>
      <th>一审结果</th>
      <th>二审结果</th>
      <th>申请原因</th>
      <th>审批原因</th>
    </tr>
    <c:forEach items="${approvalList}" var="approval" varStatus="status">
      <c:if test="${approval.state eq 'end' and approval.secondResult ne 'null'}">
        <tr>
          <td>${approval.id}</td>
          <td>${approval.courseName}</td>
          <td>${approval.studentId}</td>
          <td>${approval.teacherId}</td>
          <td>${approval.result}</td>
          <td>${approval.secondResult}</td>
          <td>${approval.chooseReason}</td>
          <td>
            <c:choose>
              <c:when test="${approval.result eq 'true'}">
                审核通过
              </c:when>
              <c:otherwise>
                ${approval.rejectReason}
              </c:otherwise>
            </c:choose>
          </td
        </tr>
      </c:if>
    </c:forEach>
  </table>
</div>
<div class="button-container">
  <div><input type="button" onclick="history.back()" value="返回"/></div>
</div>
</body>
</html>