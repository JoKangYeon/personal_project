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
<div style="margin-bottom: 20px">댓글 수 (${paging.totalRowCount})</div>
<c:forEach items="${replyList}" var="reply">
<div class="row" style="margin-bottom: 5px" data-re-no="${reply.reNo}" name="renoDiv">
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
    <hr>
</div >
</c:forEach>
<c:if test="${paging.curPage > 1}">
    <div class="text-center" id="id_reply_list_previous">
        <a id="btn_reply_list_previous"
           class="btn btn-sm btn-default col-sm-10 col-sm-offset-1" style="background-color: #badce3"> <span
                class="row" aria-hidden="true"></span>
            이전댓글
        </a>
    </div>
</c:if>
<c:if test="${paging.curPage < paging.lastPage && paging.totalRowCount > 8}">
<div class="text-center" id="id_reply_list_more">
    <a id="btn_reply_list_more"
       class="btn btn-sm btn-default col-sm-10 col-sm-offset-1" style="background-color: orange"> <span
            class="row" aria-hidden="true"></span>
        다음댓글
    </a>
</div>
</c:if>

<%-- 댓글 수정 모달 --%>
<div class="modal fade" id="id_reply_edit_modal" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <!-- 모달 내용 -->
        <div class="modal-content" style="border-radius: 10px;">
            <form name="frm_reply_edit" method="post">
                <div class="modal-header" style="border-bottom: none;">

                    <h4 class="modal-title" style="color: #333;">댓글수정</h4>
                </div>
                <div class="modal-body" style="padding: 20px;">
                    <input type="hidden" name="reNo" value="">
                    <textarea rows="3" name="reContent" class="form-control" style="border: 1px solid #ccc; border-radius: 5px;"></textarea>
                    <input type="hidden" name="reMemId" value="${sessionScope.USER.mmId }">
                </div>
                <div class="modal-footer" style="border-top: none;">
                    <button  id="btn_reply_modify" type="button" class="btn btn-sm btn-primary" style="border-radius: 5px;">저장</button>
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="border-radius: 5px; background-color: #badce3">닫기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // 이전댓글 버튼
    $("#id_reply_list_previous").on("click", function (e) {
            param.curPage  -=  1;
            replyLoad();
    });

    //다음댓글 버튼
    $("#id_reply_list_more").on("click", function (e) {
            param.curPage  +=  1;
            replyLoad();
    });

    //수정버튼 : 댓글 영역안에 있는 수정버튼
    $("#reply_list_area").on("click", 'button[name="btn_reply_edit"]'
        , function (e) {
            e.preventDefault();

            //현재 버튼의 상위 div(한개 댓글) 찾기
            // console.log("this.parent : ", $(this).parent().parent())

            // 현재 row
            let thisRow = $(this).closest(".row");


            //div에서 현재 댓글 내용을 modal에 있는 textarea에 복사
            let thisContent = $(this).closest(".row").find("pre").text();
            $("#id_reply_edit_modal").find(".modal-body").find("textarea").val(thisContent);

            //div태그의 data-re-no 값을 modal에 있는 input name="reNo" 태그의 value값에 복사
            let thisReNo = thisRow.data('reNo');
            $("#id_reply_edit_modal").find(".modal-body").find("input[name='reNo']").val(thisReNo);

            //복사 후   .modal('show')
            $("#id_reply_edit_modal").modal('show');

        });

    //모달창 저장 버튼
    $("#btn_reply_modify").on("click", function (e) {
        //가장 가까운form 찾기 , ajax 호출(  data:form.serialzie()
        console.log(this.closest("form[name='frm_reply_edit']"));
        let thisForm = this.closest("form[name='frm_reply_edit']")
        console.log($(thisForm).serialize())
        $.ajax({
            url : "/reply/replyModify",
            data : $(thisForm).serialize(),
            // 성공 :  modal찾은 후 modal('hide')
            success : function (reply) {
                $("#id_reply_edit_modal").modal('hide');

                // 현재 모달에 있는 reNo, reContent 찾기
                // let thisRow = $(this).closest(".modal-body").find("input[name='reNo']");
                let thisRow = $(".modal-body input[name='reNo']")
                // let thisContent = $(this).closest(".modal-body").find("textarea[name='reContent']");
                let thisContent = $(".modal-body textarea[name='reContent']")
                console.log(thisRow.val(), thisContent.val())

                // 댓글영역에서 re_no에 해당하는 댓글 찾은 후 안의 내용 re_content로 변경
                $(".row").find("input[name='reNo']").val(thisContent)

                let parentReplyTag = $("#reply_list_area")
                param.curPage = 1;
                replyLoad();
            }
        })
    });

    //삭제버튼
    $("#reply_list_area").on("click", 'button[name="btn_reply_delete"]'
        , function (e) {
            //가장 가까운 div 찾기,
            $(this.closest("div"));
            console.log($(this.closest("div")));

            //reNo,  reMemId(현재 로그인 한 사람의 id) 구하기

            let thisRow = $(this).closest(".row");
            console.log(thisRow)


            let thisContent = $(this).closest(".row").find("pre").text();
            $("#id_reply_edit_modal").find(".modal-body").find("textarea").val(thisContent);


            let thisReNo = thisRow.data('re-no');
            $("#id_reply_edit_modal").find(".modal-body").find("input[name='reNo']").val(thisReNo);



            $.ajax({
                url : "/reply/replyDelete",
                data: {"reNo" : thisReNo, "reMemId" : '${sessionScope.USER.mmId}'},
                success: function () {
                    $(thisRow).remove()
                }
            })

            // ajax 호출(reNo, reMemeId보내기) reMemId는 본인이 쓴 글인지 확인하는데 쓰임 (BizAccessFailException)
            //성공  후 해당 div.remove
        }); //삭제버튼


</script>

</body>
</html>
