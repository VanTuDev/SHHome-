<%--
  Created by IntelliJ IDEA.
  User: duong
  Date: 10/30/2023
  Time: 3:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Transactions</title>
</head>
<body>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Tài khoản Spend Account vừa tăng</th>
        <th>Thời gian</th>
        <th>Số dư hiện tại</th>
        <th>Mô tả</th>
    </tr>
    <c:forEach items="${mails}" var="mail">
        <tr>
            <td>${mail.subject}</td>
            <td>${mail.monney}</td>
            <td>${mail.time}</td>
            <td>${mail.currentCash}</td>
            <td>${mail.description}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
