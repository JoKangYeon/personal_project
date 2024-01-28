<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 24. 1. 28.
  Time: 오후 6:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.study.member.vo.MemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>pageBox</title>
    <link href="<%=request.getContextPath() %>/resources/css/boardCSS/boardList.css" rel="stylesheet">
</head>
<body>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <%-- 첫 페이지 --%>
            <li class="page-item page-link" value="${1}" onclick="pageLoad(${1}); boardListLoad();" style="color: black; cursor: pointer">
                GoStart
            </li>
        <!-- 이전 페이지 -->
        <c:if test="${paging.firstPage ne 1}">
            <li class="page-item page-link" value="${paging.lastPage - 1}" onclick="pageLoad(${paging.firstPage - 1}); boardListLoad();" style="color: black; cursor: pointer">
                <span aria-hidden="true">이전</span>
            </li>
        </c:if>

        <%-- 페이지 넘버링 --%>
        <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
            <c:if test="${paging.curPage eq i}">
                <li style="cursor: pointer" class="page-item page-link active" value="${i}" onclick="pageLoad(${i}); boardListLoad();">${i}</li>
            </c:if>
            <c:if test="${paging.curPage ne i}">
                <li style="cursor: pointer" class="page-item page-link" value="${i}" onclick="pageLoad(${i}); boardListLoad();">${i}</li>
            </c:if>
        </c:forEach>

        <!-- 다음  페이지  -->
        <c:if test="${paging.lastPage ne paging.totalPageCount}">
            <li class="page-item page-link" value="${paging.lastPage + 1}" onclick="pageLoad(${paging.lastPage + 1}); boardListLoad();" style="color: black; cursor: pointer">
                <span aria-hidden="true">다음</span>
            </li>
        </c:if>

        <%-- 마지막 페이지 --%>

        <li class="page-item page-link" value="${paging.totalPageCount}" onclick="pageLoad(${paging.totalPageCount}); boardListLoad();" style="color: black; cursor: pointer">
            GoLast
        </li>
    </ul>
</nav>

</body>
</html>
