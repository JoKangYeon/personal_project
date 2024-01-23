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
        <a href="/market_board/boardList.wow"><img src="/resources/images/logo.png" alt="로고" height="30px"></a>
    </h2>
    <h3>회원가입</h3>
    <form action="/registMember.wow" method="post">
        <label for="mmId">아이디</label>
        <input type="text" id="mmId" name="mmId" placeholder="아이디" spellcheck="false" required>
        <div id="logId" style="display: none;color: red; margin-bottom: 10px;"></div>

        <div style="margin-bottom: 5px">
            <button id="dupBtn" type="button">중복확인</button>
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
        <input type="text" id="mmAdd" name="mmAdd" placeholder="주소검색만 가능" required>

        <label for="mmDetailAdd">상세주소</label>
        <input type="text" id="mmDetailAdd" name="mmDetailAdd" placeholder="상세주소" required>

        <button id="adsBtn" type="button" onclick="searchAds">주소검색</button>
        <button id="lastBtn" type="submit">가입하기</button>
    </form>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

    let isIdCheckDone = false;

    $(document).ready(() => {
        $("#dupBtn").on("click", (e) => {
            e.preventDefault();
            let curMemId = $("#mmId").val();
            if (curMemId.length === 0) {
                alert("ID를 입력해주세요.");
            } else {
                $.ajax({
                    url: "/idCheck.wow",
                    data: {"mmId": curMemId},

                    success: function (check) {
                        console.log(check)
                        let logId = $("#logId");
                        if (check) {
                            isIdCheckDone = true;
                            logId.css("display", "block").css("color", "blue").text("사용 가능한 ID입니다.");
                            $("input[name='checkDup']").val("checked")
                        } else {
                            logId.css("display", "block").css("color", "red").text("중복된 ID입니다.");
                        }
                    },
                    error: (err) => {
                        // 에러 처리 코드 추가
                    }
                });
            }
        });
    });


    $("#lastBtn").on("click", (e) => {
        e.preventDefault();
        const regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$]).{8,16}$/
        if (regex.test($("#mmPassword").val()) !== true) {
            let logPw = $("#logPw");
            logPw.css("display", "block").css("color", "red").text("알파벳, 숫자, 특수문자(!@#$)를 조합해주세요");
            $("#mmPassword").focus()
            return;
        }

        if (!isIdCheckDone) {
            alert("ID 중복체크를 진행해주세요.")
            return;
        }

        $(e.target).closest("form").submit();

        alert("가입을 축하합니다.")
    });


</script>

</html>
