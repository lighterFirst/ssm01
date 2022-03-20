<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/2/21
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="static/jquery-3.6.0.min.js" type="text/javascript"></script>
    <link href="static/css/bootstrap.min.css"  rel="stylesheet" />
    <script src="static/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div style="padding: 20px 0">
        <a href="" class="btn btn-primary"  data-toggle='modal' id="addBtn" >添加</a>  //a标签需要设置弹出对话框时，需要提前添加 data-toggle='modal'
        <a href="" class="btn btn-danger" data-toggle='modal'>删除</a>
    </div>

    <div >
        <table class="table table-bordered">
            <thead >
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th>班级</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody class="table table-striped">
            <tr >
                <td>aaa</td>
                <td>aaa</td>
                <td>aaa</td>
                <td>aaa</td>
                <td>aaa</td>
                <td class="text-center">
                    <a href="" class="glyphicon glyphicon-remove"  ></a>
                    <a href="" class="fa fa-eraser"></a>
                </td>
            </tr>
            <tr>
                <td>aaa</td>
                <td>aaa</td>
                <td>aaa</td>
                <td>aaa</td>
                <td>aaa</td>
                <td class="text-center">
                    <a href="" class="glyphicon glyphicon-remove"></a>
                    <a href="" class="fa fa-eraser"></a>
                </td>
            </tr>

            {% for row in stu_list %}
            <tr >
                <td>{{ row.id }}</td>
                <td>{{ row.username }}</td>
                <td>{{ row.age }}</td>
                <td>
                    {#                        {{ row.gender }}#}
                    {% if row.gender == 1 %}
                    <div>男</div>
                    {% elif row.gender == 0 %}
                    <div>女</div>
                    {% endif %}
                </td>
                <td>
                    {{ row.cs.titile }}
                </td>
                <td class="text-center" >
                    <a href="" class="glyphicon glyphicon-remove"  ></a>
                    <a href="" class="glyphicon glyphicon-pencil"></a>
                </td>
            </tr>
            {% endfor %}


            </tbody>
        </table>
    </div>

</div>



<!-- Modal -->
<div>
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script>


    $('#addBtn').click(function () {
        $('#addModal').modal('show')
    })



</script>

</body>
</html>
