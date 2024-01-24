<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 24. 1. 23.
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 등록하기</title>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h3>거래게시판 - <small>글 등록</small></h3>
    </div>
    <form action="/boardRegist.wow" method="post" enctype="multipart/form-data">
        <table class="table table-striped table-bordered">
            <colgroup>
                <col width="20%" />
                <col/>
            </colgroup>
            <tr>
                <th>제목</th>
                <td><input type="text"  name="mbTitle" value="" class="form-control input-sm"  required="required" ></td>
            </tr>
            <tr>
                <th>판매상품</th>
                <td><input type="text" name="mbProduct" value=""  class="form-control input-sm" required="required" ></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" name="mbWriter" value="${USER.mmName}"  class="form-control input-sm"  readonly ></td>
            </tr>
            <tr>
                <th>판매가</th>
                <td><input type="number" name="mbPrice" value=""  class="form-control input-sm" required="required"></td>
            </tr>
            <tr>
                <th>분류</th>
                <td>
<%--                    <select name="boCategory" class="form-control input-sm" required="required">--%>
<%--                        <option value="">-- 선택하세요--</option>--%>
<%--&lt;%&ndash;                        <c:forEach items="${cateList}" var="category">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option value="${category.commCd}">${category.commNm}</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </c:forEach>&ndash;%&gt;--%>
<%--                    </select>--%>
                 <input type="text" name="mbCategory" value=""  class="form-control input-sm" required="required" >
                </td>
            </tr>

            <tr>
                <th>내용</th>
                <td><textarea rows="10" name="mbContent" class="form-control"></textarea>
                </td>

            </tr>
            <tr>
                <th>첨부파일
                    <button type="button" id="id_btn_new_file">추가</button>
                </th>
                <td class="file_area">
                    <div class="form-inline">
                        <input type="file" name="mbFiles" class="form-control" required="required">
                        <button type="button" class="btn_delete btn btn-sm">삭제</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="pull-left">
                        <a href="/market_board/boardList.wow" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                            &nbsp;&nbsp;목록
                        </a>
                    </div>
                    <div class="pull-right">
                        <button type="submit" class="btn btn-sm btn-primary" >
                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                            &nbsp;&nbsp;저장
                        </button>
                    </div>
                </td>
            </tr>
        </table>
    </form>

</div><!-- container -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $('#id_btn_new_file').click(function(){
        $('.file_area').append('<div class="form-inline">'
            + '<input type="file" name="mbFiles" class="form-control" required="required">'
            + ' <button type="button" class="btn_delete btn btn-sm">삭제</button>' + '</div>');
    });

    $('.file_area').on('click','.btn_delete', function(){
        $(this).closest('div').remove();
    });
</script>
</body>
</html>
