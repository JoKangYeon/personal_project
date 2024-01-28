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
    <title>글 등록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Add custom styles here */
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px; /* Adjust container width as per your requirement */
            margin: 50px auto;
            padding: 20px;
            background-color: #f8f9fa; /* Light gray background */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .page-header h3 {
            margin-top: 0;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ced4da; /* Light border color */
            border-radius: 4px;
            box-sizing: border-box;
        }

        .btn-default {
            background-color: #f8f9fa; /* Light gray button */
            color: #333; /* Dark gray text */
            border-color: #ccc; /* Light gray border */
        }

        .btn-default:hover {
            background-color: #e9ecef; /* Lighter gray on hover */
        }

        .btn-primary {
            background-color: #007bff; /* Bootstrap primary color */
            color: #fff; /* White text */
            border-color: #007bff; /* Bootstrap primary color */
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #0056b3; /* Darker blue border on hover */
        }

        .file_area {

            align-items: center; /* Align items vertically in center */
        }

        .file_area input[type="file"] {
            flex: 1; /* Take remaining space */
            margin-right: 10px; /* Add some space between file input and button */
        }


        .table th, .table td {
            vertical-align: middle; /* Align content vertically in center */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h3>거래게시판 - <small>글 등록</small></h3>
    </div>
    <form action="/boardRegist.wow" method="post" enctype="multipart/form-data">
        <table class="table table-striped table-bordered">
            <tr>
                <th>제목</th>
                <td><input type="text" name="mbTitle" value="" class="form-control input-sm" required="required"></td>
            </tr>
            <tr>
                <th>판매상품</th>
                <td><input type="text" name="mbProduct" value="" class="form-control input-sm" required="required"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" name="mbWriter" value="${USER.mmName}" class="form-control input-sm" readonly>
                </td>
            </tr>
            <tr>
                <th>판매가</th>
                <td><input type="text" oninput="this.value = this.value.replace(/[^0-9]/g, '');" name="mbPrice" value=""
                           class="form-control input-sm" required="required"></td>
            </tr>
            <tr>
                <th>분류</th>
                <td>
                    <select name="mbCategory" class="form-control input-sm"  style="height: 40px" required>
                        <option value="MBC02">도서</option>
                        <option value="MBC03">의류</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea rows="10" name="mbContent" class="form-control"></textarea></td>
            </tr>
            <tr>
                <th>첨부파일
                    <button type="button" id="id_btn_new_file" class="btn-primary">+</button>
                </th>
                <td class="file_area">
                    <div class="form-inline">
                        <input type="file" name="mbFiles" class="form-control" required="required">
                        <button type="button" class="btn btn-sm bg-danger btn_delete">삭제</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="form-group" style="display: flex;">
                        <div style="margin-right: auto;"> <!-- 시작 -->
                            <a href="/market_board/boardList.wow" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                                목록
                            </a>
                        </div>
                        <div style="margin-left: auto;"> <!-- 끝 -->
                            <button type="submit" class="btn btn-sm bg-warning">
                                <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                글 등록하기
                            </button>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div><!-- container -->


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $('#id_btn_new_file').click(function () {
        $('.file_area').append('<div class="form-inline">'
            + '<input type="file" name="mbFiles" class="form-control" required="required">'
            + ' <button type="button" class="btn_delete btn btn-sm bg-danger"">삭제</button>' + '</div>');
    });

    $('.file_area').on('click', '.btn_delete', function () {
        $(this).closest('div').remove();
    });
</script>
</body>
</html>