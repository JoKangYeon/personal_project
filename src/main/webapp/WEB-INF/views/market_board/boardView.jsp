<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.study.member.vo.MemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
    <link href="<%=request.getContextPath() %>/resources/css/boardCSS/boardView.css" rel="stylesheet">
    <style>
        /* 스타일링을 위한 CSS 코드 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        #comment-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        #comment-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            resize: vertical;
        }

        #comment-form input[type="submit"] {
            background-color: lightslategray;
            color: black;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 3px;
            float: right; /* 오른쪽으로 이동 */
        }

        #comment-form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        #reply_list_area {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

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
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Detail View</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">바로가기</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/">All Products</a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li><a class="dropdown-item" href="#!">인기글보기</a></li>
                        <li><a class="dropdown-item" href="#!">신규글보기</a></li>
                    </ul>
                </li>
            </ul>
            <%--            <form class="d-flex" action="#">--%>
            <div>
                <button class="btn btn-outline-dark" type="button" id="inquiryBtn">
                    <i class="bi-cart-fill me-1"></i>
                    1:1문의하기
                    <%--                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>--%>
                </button>
            </div>
            <%--            </form>--%>
        </div>
    </div>
</nav>
<!-- Product section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6" style="position: relative;">
                <c:if test="${mbBoard.attaches.size() eq 0 }">
                    <img class="card-img-top mb-5 mb-md-0"
                         src="https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg"
                         style="width: 500px; height: 500px"
                         alt="..."/>
                </c:if>
                <c:if test="${mbBoard.attaches.size() > 0 }">

                    <img class="card-img-top mb-5 mb-md-0" style="width: 500px; height: 500px" id="boardImage"
                         src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${mbBoard.attaches[0].atchFileName}&filePath=${mbBoard.attaches[0].atchPath}"
                         alt="image"/>
                    <a href="#" id="imageNextBtn"
                       style="position: absolute; top: 50%; right: 70px; text-decoration-line: none; font-size: 50px; transform: translateY(-50%);">></a>
                </c:if>

            </div>
            <div class="col-md-6">
                <div class="small mb-1">000${mbBoard.mbNo}</div>
                <h2>상품명 : ${mbBoard.mbProduct}</h2>
                <div class="fs-5 mb-5">
                    <%--                    <span class="text-decoration-line-through">$45.00</span>--%>
                    <span>판매자: ${mbBoard.mbWriter}</span><br>
                    <span>판매가격: ${mbBoard.mbPrice}원</span><br>
                    <span>등록일: ${mbBoard.mbRegDate}</span><br>
                    <span>조회수: ${mbBoard.mbHit}</span>
                </div>
                <p class="lead">${mbBoard.mbContent}</p>
                <div class="d-flex">
                    <%--                    <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />--%>
                    <button class="btn btn-outline-dark flex-shrink-0" type="button">
                        <i class="bi-cart-fill me-1"></i>
                        게시글 찜하기
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
    <div class="container px-4 px-lg-5 mt-5">
        <div id="comment-form">
            <h2>댓글 남기기</h2>
            <form method="post" name="commentForm" id="commentForm">
                <label for="comment"></label><textarea name="reContent"
                                                       id="comment" ${sessionScope.USER.mmId eq null ? "readonly" : ""}
                                                       cols="30" rows="5" placeholder="댓글을 입력해주세요..."></textarea><br>
                <input id="registReplyBtn" type="submit" value="댓글 등록">
                <input type="hidden" name="reCategory" value="market_board">
                <input type="hidden" name="reParentNo" value="${mbBoard.mbNo}">
                <input type="hidden" name="reMemId" value="${sessionScope.USER.mmId}">

            </form>
        </div>
        <div id="reply_list_area" data-page="1" >

        </div>
    </div>


</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Next Market 2024</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    let param = {
        "curPage": 1
        , "reParentNo": ${mbBoard.mbNo}
        , "reCategory": "market_board"
        , "reMemId": '${sessionScope.USER.mmId}'
    }


    $("#inquiryBtn").on("click", () => {
        alert(`준비중인 서비스입니다.`)
    })

    $(document).ready(() => {
        replyLoad();
    })





    //등록버튼
    $("#registReplyBtn").on("click", function (e) {
        // form태그안에 input hidden으로 필요한거 넣기
        //가장가까운 form찾은 후 ajax 호출(data는 form.serialize(), )


        e.preventDefault();
        if ('${sessionScope.USER.mmId}' == '') {
            alert("댓글은 로그인 후 사용해주세요.");
        } else {
            let formTag = $("form[name='commentForm']");
            let parentReplyTag = $("#reply_list_area")
            $.ajax({

                    url : "/reply/replyRegist",
                    data : formTag.serialize(),
                    //성공 시 댓글비우기 / 다시 로드 / 1페이지로
                    success : function (data) {
                        alert("댓글등록o")
                        formTag.find("textarea").val("");
                        param.curPage = 1;
                        replyLoad();
                    }
                })

        }

    });


    // 댓글 가져오는 로더
    function replyLoad() {
        let $replyDiv = $("#reply_list_area")
        $replyDiv.load("/reply/replyList", param);

    }


</script>
</body>
</html>
