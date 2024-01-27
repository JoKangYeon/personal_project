<%@ page import="com.study.member.vo.MemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>NextMarket</title>
    <link href="<%=request.getContextPath() %>/resources/css/boardCSS/boardList.css" rel="stylesheet">
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Next Market</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">거래목록</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">방문기록 </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">가장최근</a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li><a class="dropdown-item" href="#!">2번째</a></li>
                        <li><a class="dropdown-item" href="#!">3번쨰</a></li>
                        <li><a class="dropdown-item" href="#!">4번쨰</a></li>
                        <li><a class="dropdown-item" href="#!">5번쨰</a></li>
                    </ul>
                </li>
            </ul>
            <div class="d-flex">
                <% MemberVO curMem = (MemberVO) session.getAttribute("USER"); %>
                <c:if test="<%=curMem == null%>">
                    <button class="btn btn-outline-dark" id="loginBtn" onclick="location.href='/login/login.wow'"
                            style="border: none" type="button">
                        <i class="bi-cart-fill me-1"></i>
                        Login
                            <%--                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>--%>
                    </button>
                    <a href="/login/signup.wow">
                        <button class="btn btn-outline-dark" style="border: none" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            SingUp
                                <%-- <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>--%>
                        </button>
                    </a>
                </c:if>
                <c:if test="<%=curMem != null%>">
                    <a href="#" style="text-decoration-line: none; color: black"><span
                            style="font-size: large; font-weight: bold"><%=curMem.getMmName()%>님</span></a>
                </c:if>
            </div>
        </div>
    </div>
</nav>


<div class="search-box" style="display: flex; flex-direction: column;">
    <div style="width: 100%; height: 70%; display: flex; justify-content: center; margin-top: 20px">
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <form id="searchForm" class="d-flex" role="search" style="height: 50px; width: 500px">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <input type="hidden" name="curPage" value="${paging.curPage}">
                    <input type="hidden" name="rowSizePerPage" value="${paging.rowSizePerPage}">
                    <button class="btn btn-outline-success" id="searchBtn" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
    <div style="width: 100%; height: 15%; display: flex; justify-content: center">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="DESC"
                   checked="checked">
            <label class="form-check-label" for="inlineRadio1">최신순</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="ASC">
            <label class="form-check-label" for="inlineRadio2">오래된순</label>
        </div>
    </div>
</div>
<div style="width: 100%; height: 0%; display: flex; justify-content: center">
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="inlineRadioOptions2" id="inlineRadio3" value="MBC01"
               checked="checked">
        <label class="form-check-label" for="inlineRadio3">All</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="inlineRadioOptions2" id="inlineRadio4" value="MBC02">
        <label class="form-check-label" for="inlineRadio4">도서</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="inlineRadioOptions2" id="inlineRadio5" value="MBC03">
        <label class="form-check-label" for="inlineRadio5">의류</label>
    </div>
</div>
</div>
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5">
        <div class="col-sm-3 form-inline">
            총 ${paging.totalRowCount} 게시글
            <select id="id_rowSizePerPage" class="form-select input-sm">
                <c:forEach var="i" begin="8" end="32" step="8">
                    <option value="${i}"  ${paging.rowSizePerPage eq i ? "selected='selected'" : ""}>${i}개씩 보기</option>
                </c:forEach>
            </select>
        </div>
        <div class="d-flex" style="justify-content: flex-end">
            <button type="button" class="btn btn-warning btn-lg"
                    style="margin-bottom: 12px;" onclick="location.href='/market_board/boardForm.wow'">판매글 작성하기
            </button>
        </div>
        <div id="list_box" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

        </div>
    </div>

    <%--  페이지네이션  --%>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <%-- 첫 페이지 --%>
            <li class="page-item">
                <a style="color: black" class="page-link" href="/market_board/boardList.wow?curPage=1" data-page="1" class="page-link">GoFirst</a>
            </li>
            <%-- 페이지 넘버링 --%>
            <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
                <c:if test="${paging.curPage eq i}"><li class="page-item active"><a class="page-link" href="#">${i}</a></li></c:if>
                <c:if test="${paging.curPage ne i}"><li class="page-item"><a class="page-link" href="/market_board/boardList.wow?curPage=${i}" data-page="${i}">${i}</a></li></c:if>
            </c:forEach>

            <%-- 마지막 페이지 --%>
            <li class="page-item">
                <a style="color: black" class="page-link" href="/market_board/boardList.wow?curPage=${paging.totalPageCount}" data-page="${paging.totalPageCount}"><span aria-hidden="true">GoLast</span></a>
            </li>
        </ul>
    </nav>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Next Market 2024</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="<%=request.getContextPath() %>/resources/js/boardList.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    // 카테고리 / 날짜 변수선언
    let radioValDate = $('input[name="inlineRadioOptions"]:checked').val();
    let radioValCate = $('input[name="inlineRadioOptions2"]:checked').val();
    let selectBox = $("#id_rowSizePerPage");
    let selectVal = 8;
    console.log(radioValDate, radioValCate);

    // 페이지관련 변수 선언
    $form = $("#searchForm")
    $curPage = $form.find("input[name='curPage']");


    /* 정렬 이벤트 */

    $(document).ready(() => {
        $('input:radio[name="inlineRadioOptions"]:radio[value="DESC"]').prop('checked', true);
        $('input:radio[name="inlineRadioOptions2"]:radio[value="MBC01"]').prop('checked', true);
        boardListLoad();

    })

    let clickedSortRadio = $('input[name="inlineRadioOptions"]')
    let clickedCateRadio = $('input[name="inlineRadioOptions2"]')


    clickedSortRadio.map((i, v) => {
        v.addEventListener("click", (e) => {
            radioValDate = $('input[name="inlineRadioOptions"]:checked').val();
            boardListLoad();
        })
    })
    clickedCateRadio.map((i, v) => {
        v.addEventListener("click", () => {
            radioValCate = $('input[name="inlineRadioOptions2"]:checked').val();
            boardListLoad();
        })
    })

    selectBox.on("change", function (e) {
        $form.find("input[name='rowSizePerPage']").val($(this).val());

        selectVal = $form.find("input[name='rowSizePerPage']").val();

        boardListLoad()


    })




    // 검색버튼 누를 때 1페이지로
    $("#searchBtn").on("click", (e) => {
        e.preventDefault();
        $curPage.val(1);
        $form.submit();
    })

    /* 페이지 이벤트 추가 */

    //페이지 링크 클릭
    $('ul.pagingnation li a[data-page]').click((e) => {
        e.preventDefault()  // a태그이벤트 방지
        $curPage.val($(this).data('page'));
        $form.submit();
    })



    // 리스트 가져오는 로더
    function boardListLoad() {
        let listParam = {"sort": radioValDate, "cate": radioValCate, "viewCnt": selectVal};
        let $listDiv = $("#list_box")
        $listDiv.load("/orderBy.wow", listParam);
    }


</script>

</body>
</html>
