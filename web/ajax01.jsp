<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/2/20
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ajax</title>
    <script src="static/jquery-3.6.0.min.js" type="text/javascript"></script>
    <link href="static/css/bootstrap.min.css"  rel="stylesheet" />
    <script src="static/js/bootstrap.min.js" rel="stylesheet"></script>

</head>
<body>
<br><br>
<div class="container" >

    <div class="row" align="center">
<table class="col-md-6 col-md-offset-3" border="1" align="center" width="10" cellpadding="5" >
    <tr>
        <th><p align="center">id</p></th>
        <th align="center">姓名</th>
        <th align="center">密码</th>
        <th align="center">修改</th>
        <th align="center">删除</th>
    </tr>
    <tbody id="tables">

    </tbody>
</table>
    </div>


<div class="row"  >
    <div class="col-md-3 col-md-offset-2">
        <p id="p1"></p>
    </div>
</div>

    <div class="row">
        <div class="col-md-2 col-md-offset-8 " id="hate1">
            <button class="btn-success" id="add">新增</button>
            <button class="btn-primary">删除</button>
        </div>
    </div>

    <div class="col-md-4 col-md-offset-8">
        <nav aria-label="Page navigation">
            <ul class="pagination" id="ul1" >


            </ul>
        </nav>
     <div>
 <!--员工增加模态框 -->
    </div>

    <div>
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">新增员工</h4>
                    </div>
                    <div class="modal-body">



                        <form class="form-horizontal" >
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" name="username" class="form-control" id="username" placeholder="username">
                                    <span id="span1" class="help-block"></span>
                                </div>


                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="text" name="password" class="form-control" id="password" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> Remember me
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">确定</button>
                                </div>
                            </div>
                        </form>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="button1">保存</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



        <!--员工修改模态框 -->
    </div>

    <div>
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"align="center">修改员工</h4>
                    </div>

                    <!--静态输入框-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">id</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="p2"></p>
                        </div>
                    </div>



                    <div class="modal-body">
                        <form class="form-horizontal" >
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" name="username" class="form-control" id="username01" placeholder="username">
                                    <span id="span2" class="help-block"></span>
                                </div>


                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="text" name="password" class="form-control" id="password02" placeholder="Password02">
                                </div>
                            </div>
                        </form>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="button2">修改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">
        //因为是ajax返送请求创建按钮之前绑定的，所一绑定不上
        //可以在创建按钮的时候绑定。指定点击(时间委派)
        $(document).on("click",".update-button",function () {
            $("#p2").text($(this).attr("id"))
            var k = this.id
            $("#updateModal").modal({
                keyboard: true,
            })

            $("#button2").click(function () {
                $.ajax({
                    url: "<%=request.getContextPath()%>/user/update/" + k,
                    type: "post",
                    data: $("#updateModal form").serialize()+"&_method=put",
                    success: function (result) {
                        alert(result.shit)
                    }
                })
            })
        })

    </script>

<script type="text/javascript">
    $(function(){
        $.ajax({
            url: "<%=request.getContextPath()%>/user/select01/1",
            type:"GET",
            <!-- 由服务器返回，并根据 dataType 参数进行处理后的数据；描述状态的字符串。-->
            success:function (result) {
                k=result.pages;
                f1(result);
            }
        })
    })

    //方法：跳转页面

    function f2(num) {
            $.ajax({
            url: "<%=request.getContextPath()%>/user/select01/"+num,
            type: "GET",
            <!-- 由服务器返回，并根据 dataType 参数进行处理后的数据；描述状态的字符串。-->
            success: function (result) {
                $("#tables").empty();
                $("#p1").empty();
                $("#ul1").empty();
                f1(result)
            }
        })
    }

    function f1(result) {
        var a1 = result.list;

        $.each(a1,function (index,item) {
            var id = $("<td></td>").append(item.id);
            var username = $("<td></td>").append(item.username);
            var password = $("<td></td>").append(item.password);
            //为修改事件添加标识update-button
            var button01 = $("<button></button>").addClass("btn btn-success update-button").append($("<span></span>").addClass("glyphicon glyphicon-wrench ")).append("修改")
            var button02 = $("<td><button></button></td>").addClass("btn-primary").append($("<span></span>")).append("删除")
            $("<tr></tr>").append(id).append(username).append(password).append(button01).append(button02).appendTo("#tables");
            //给修改按钮添加属性 id值
          button01.attr("id",item.id);

        })

        $("#p1").append("共"+result.pages+"页"+",当前第"+result.pageNum+"页,"+"共"+result.total+"条记录");
        if(1 != result.pageNum){
            var v2 = $("<li></li>").append($("<a></a>").addClass("glyphicon glyphicon-step-backward").attr("href","#")).appendTo("#ul1")
            v2.click(function () {
                f2(result.pageNum-1);
            })
        }
        var ul = $("<li></li>").append($("<a></a>").append("首页").attr("href","#")).appendTo("#ul1")
        ul.click(function () {
            f2(1);
        })
        $.each(result.navigatepageNums,function (index,item) {
            var s =$("<li></li>").append($("<a></a>").append(item).attr("href","#")).appendTo("#ul1");
            s.click(function () {
                f2(index+1);
            })


            if(result.pageNum == index+1){
            s.addClass("active");
            }
        })

        var lastPage = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#")).appendTo("#ul1");
        lastPage.click(function () {
            f2(result.pages);
        })
        if(result.pages != result.pageNum) {
           var v1 = $("<li></li>").append($("<a></a>").addClass("glyphicon glyphicon-play").attr("href", "#")).appendTo("#ul1")
            v1.click(function () {
                f2(result.pageNum+1);
            })
        }
    }



    //新增模态框
    $('#add').click(function () {
        //清空表单
        $("#addModal form")[0].reset();
        $("#addModal").modal({
            keyboard: true,
        })
        //去除模态框
        $("#soldier-modal").remove()
    })

    //正则表达式检查用户名是否符合要求
    function check(){
        var username = $("#username").val();
        var usernameRegex = /^([\u4e00-\u9fa5]{2,4})|([A-Za-z0-9_]{4,16})|([a-zA-Z0-9_\u4e00-\u9fa5]{3,16})$/;
        usernameRegex.test(username);
       if(!usernameRegex.test(username)){
           //移除之前添加的样式

           $("#username").parent().addClass("has-error");
           //next() 方法返回被选元素的后一个同级元素。
           $("#username").next("span").text("用户名格式错误");
           return false;
       }else{
           $("#username").parent().addClass("has-success");
           //next() 方法返回被选元素的后一个同级元素。
           $("#username").next("span").text("");
       }
      return true;
    }

    //错误时：添加提示信息。
    function test01(id,judge,information){
        if(judge == "has-error"){
            $(id).parent().addClass("has-error");
            //next() 方法返回被选元素的后一个同级元素。
            $(id).next("span").text(information);
            return false;
        }else{
            $(id).parent().addClass("has-success");
            //next() 方法返回被选元素的后一个同级元素。
            $(id).next("span").text(information);
        }

    }

    //保存功能
    $("#button1").click(function () {

        //保存前，判断检验状态
        if($(this).attr("status") == "error"){
            return false;
        }

      if(check()) {
          $.ajax({
              url: "<%=request.getContextPath()%>/user/select01",
              type: "POST",
              //serialize()获取表单数据f
              data: $("#addModal form").serialize(),
              <!-- 由服务器返回，并根据 dataType 参数进行处理后的数据；描述状态的字符串。-->
              success: function (result) {
                  if(result.status == 100){
                   alert(result.message);
                  }else if (result.status == 200){
                      //员工保存成功，自动关闭模态框
                      $("#addModal").modal('hide');
                      f2(k)
                  }
              }
          })
      }
    })

    //移除表单样式和清空表单方法
    function remove01(aa){
        $(aa)[0].reset();
        $(aa).find("*").removeClass("has-error has-success");
    }

    //检验用户名是否重名
    $("#username").blur(function () {
        var username = $("#username").val();
        $.ajax({
            url: "<%=request.getContextPath()%>/user/check",
            type: "get",
            //serialize()获取表单数据
            data: "username="+username,
            <!-- 由服务器返回，并根据 dataType 参数进行处理后的数据；描述状态的字符串。-->
            success: function (result) {
                if(result.a==100){
                    test01("#username","has-error","用户名重复")
                    //给保存添加属性
                    $("#button1").attr("status","error");
                }else if(result.a==200){
                    test01("#username","has-success","用户名正确")
                    //给保存添加属性
                    $("#button1").attr("status","success");
                }else {
                    test01("#username","has-success",result.a)
                }

            }
        })


    })

</script>

</body>
</html>
