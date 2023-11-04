<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/vietqr" method="post">
    <input type="hidden" name="createPaying" value="createPaying">
    <button>Thanh toan</button>
</form>
</body>
</html>


