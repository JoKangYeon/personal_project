<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.study.member.vo.MemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="<%=request.getContextPath() %>/resources/css/boardCSS/boardView.css" rel="stylesheet">
    <style>
        .row {
            display: flex;
            align-items: center;
        }
        .col-sm-2 {
            flex: 1;
            text-align: center;
        }
        .col-sm-6 {
            flex: 4;
            padding: 5px;
        }
        pre {
            margin: 0;
            white-space: pre-wrap;
            word-wrap: break-word;
        }
        .col-sm-2:last-child {
            text-align: right;
        }
        .btn-reply {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<c:forEach items="${replyList}" var="reply">
<div class="row"style="margin-bottom: 5px">
    <div class="col-sm-2">${reply.reMemId}</div>
    <div class="col-sm-6">
        <pre>${reply.reContent}</pre>
    </div>
    <div class="col-sm-2">${reply.reRegDate}</div>
    <div class="col-sm-2">
        <c:if test="${reply.reMemId == sessionScope.USER.mmId}">
        <button name="btn_reply_edit" type="button"
                class="btn btn-sm btn-info btn-reply" onclick="">수정
        </button>
        <button name="btn_reply_delete" type="button"
                class="btn btn-sm btn-danger btn-reply">삭제
        </button>
        </c:if>
    </div>
</div >
    <hr>
</c:forEach>
</body>
</html>
