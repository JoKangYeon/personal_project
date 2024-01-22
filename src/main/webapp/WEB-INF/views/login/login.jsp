<%@ page import="com.study.common.util.CookieUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 24. 1. 17.
  Time: 오후 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<%=request.getContextPath() %>/resources/css/loginCSS/login.css" rel="stylesheet">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="parentMid">
    <div id="divLogo">
        <a class="logo" href="/market_board/boardList.wow">
            <img src="/resources/images/logo.png" alt="로고" height="30px">
        </a>
    </div>
    <div id="mid">
        <h2>로그인</h2>
        <form action="/login/login.wow" method="post">
            <div>
                <label for="userId"></label>
                <input type="text" id="userId" name="userId" placeholder="ID" spellcheck="false" value="${remId}" required>
            </div>
            <div>
                <label for="userPw"></label>
                <input style="margin-bottom: 15px" type="password" id="userPw" name="userPw" placeholder="Password" required>
            </div>
            <c:if test='<%=request.getParameter("msg") != null%>'>
                <div id="loginMessage" style="color: red"><%=request.getParameter("msg")%></div>
            </c:if>
            <div style="margin-bottom: 7px"><label><input type="checkbox" name="rememberMe" value="Y"/>ID 7일동안 기억하기</label></div>
            <button id="loginBtn" type="submit">Login</button>
        </form>
        <p style="margin-bottom: 0"><a href="/login/signup.wow" style="text-decoration: none; font-size: 13px">SignUp</a></p>
        <p style="margin-top: 3px"><a href="#" id="openPopup" style="text-decoration: none; font-size: 13px">Forgot your password?</a></p>
    </div>
</div>
</body>
<script>
</script>
</html>
