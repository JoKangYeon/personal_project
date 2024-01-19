<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>

<html>
<head>
    <title>회원가입</title>
    <link href="<%=request.getContextPath() %>/resources/css/loginCSS/signup.css" rel="stylesheet">
    <meta charset="utf-8">
    <%--    <script src="<%=request.getContextPath() %>/resources/js/boardList.js"></script>--%>
</head>
<body>
<div class="signup">
    <h2>
        <a href="/market_board/boardList.com"><img src="/resources/images/logo.png" alt="로고" height="30px"></a>
    </h2>
    <h3>회원가입</h3>
    <form action="registMember.com" method="post">
        <label for="mmId">아이디</label>
        <input type="text" id="mmId" name="mmId" placeholder="아이디" spellcheck="false" required>
        <div id="logId" style="display: none;color: red; margin-bottom: 10px;"></div>

        <div style="margin-bottom: 5px">

            <button id="dupBtn" type="button">중복확인</button>

            <input style="display: none" name="checkDup" value="${idCheck}">
        </div>

        <label for="mmPassword">비밀번호</label>
        <input type="password" id="mmPassword" name="mmPassword" placeholder="비밀번호(8~16자리)" required>
        <div id="logPw" style="display: none;color: red; margin-bottom: 10px"></div>

        <label for="mmEmail">이메일</label>
        <input type="email" id="mmEmail" name="mmEmail" placeholder="이메일" spellcheck="false" required>

        <label for="mmName">이름</label>
        <input type="text" id="mmName" name="mmName" placeholder="이름" spellcheck="false" required>

        <label for="mmPhone">휴대폰번호</label>
        <input type="text" id="mmPhone" name="mmPhone" placeholder="휴대폰번호" spellcheck="false" required>

        <label for="mmAdd">주소</label>
        <input type="text" id="mmAdd" name="mmAdd" placeholder="주소검색만 가능" readonly required>

        <label for="mmDetailAdd">상세주소</label>
        <input type="text" id="mmDetailAdd" name="mmDetailAdd" placeholder="상세주소" required>

        <button id="adsBtn" type="button" onclick="searchAds">주소검색</button>
        <button id="lastBtn" type="submit">가입하기</button>
    </form>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $(document).ready(() => {
        $("#dupBtn").on("click", (e) => {
            e.preventDefault();
            let curMemId = $("#mmId").val();
            // if (curMemId.length === 0) {
            //     alert("ID를 입력해주세요.");
            // } else {
                $.ajax({
                    url: "/idCheck.com",
                    data: {"mmId": curMemId},
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (check) {
                        console.log(check)
                        let logId = $("#logId");
                        // if (check ) {
                        //     logId.css("display", "block").css("color", "blue").text("사용 가능한 ID입니다.");
                        // } else {
                        //     logId.css("display", "block").text("중복된 ID입니다.");
                        // }
                    },
                    error: (err) => {
                        // 에러 처리 코드 추가
                    }
                });
            // }
        });
    });


</script>

</html>
