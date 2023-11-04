<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="metaClient.jsp"/>
    <title>Search House</title>
</head>

<body>
<%@include file="_header.jsp" %>
<%--<%@include file="detailSort.jsp" %>--%>
<%@include file="content.jsp" %>
<%@include file="_footer.jsp" %>
<!-- Bootstrap Bundle với Popper -->
<a href="${pageContext.request.contextPath}/admin">Day la trang admin</a>

</body>
</html>