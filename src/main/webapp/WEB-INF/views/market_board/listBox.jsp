<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 24. 1. 25.
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.study.member.vo.MemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="<%=request.getContextPath() %>/resources/css/boardCSS/boardList.css" rel="stylesheet">
</head>
<body>
<c:forEach items="${marketBoardList}" var="mbList">
    <div class="col mb-5">
        <div class="card h-100">
            <!-- Sale badge-->
                <%--조회수가 10회이상이면 hot--%>
                <%--                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">--%>
                <%--                        </div>--%>
                <%--                        mbList.attaches eq [] ? "https://dummyimage.com/450x300/dee2e6/6c757d.jpg" :--%>
            <!-- Product image-->
                <%--                        <% String address= request.getContextPath(); request.setAttribute("address", address);%>--%>
            <c:if test="${mbList.attaches.size() eq 0 }">
                <img class="card-img-top" alt="image" style="height: 250px; width: 268px"
                     src="https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg">
            </c:if>
            <c:if test="${mbList.attaches.size() > 0 }">
            <img class="card-img-top" alt="image" style="height: 250px; width: 268px"
                 src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${mbList.attaches[0].atchFileName}&filePath=${mbList.attaches[0].atchPath}">
            </c:if>
            <div>

            </div>
            <!-- Product details-->
            <div class="card-body p-4">
                <div class="text-center">
                    <!-- Product name-->
                    <h5 class="fw-bolder">${mbList.mbProduct}</h5>
                    <!-- Product reviews-->
                    <div class="d-flex justify-content-center small text-warning mb-2">
                        <div class="bi-star-fill">작성일: ${mbList.mbRegDate}</div>
                        <div class="bi-star-fill"></div>
                        <div class="bi-star-fill"></div>
                        <div class="bi-star-fill"></div>
                        <div class="bi-star-fill"></div>
                    </div>
                    <!-- Product price-->
                        <%--<span class="text-muted text-decoration-line-through"></span>--%>
                        ${mbList.mbPrice}원
                </div>
            </div>
            <!-- Product actions-->
            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center"><a class="btn btn-outline-dark mt-auto"
                                            href="/market_board/boardView.wow?mbNo=${mbList.mbNo}">DetailView</a></div>
            </div>
        </div>
    </div>
</c:forEach>
</body>
</html>
