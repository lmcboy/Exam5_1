<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link rel="stylesheet" href="bootstrap.min.css"/>
<link rel="stylesheet" href="loginstyle.css"/>
</head>
<body>
<div class="body_title">
    <h2>8839 林免冲</h2>
</div>
<div class="container">
    <div class="form-content">
        <form class="form form-horizontal" action="<%= request.getContextPath()%>/LoginServlet" method="post" name="loginForm">
            <div class="content">
                <div class="form_title">
                    <p><h4>电影租赁管理系统</h4></p>
                    <hr/>
                </div>
               
                <div class="input-group" style="margin-bottom: 10px; width: 400px;">
               
                    <label for="userName" class=" col-sm-4 control-label">用户名：</label>
                    <div class="col-sm-8">
                        <input type="text" id="userName" class="form-control" placeholder="请输入用户名" name="username"/>
                    </div>
                </div>
                <div class="input-group" style="margin-bottom: 10px; width: 400px;">
                    <label for="password" class="col-sm-4 control-label">密码：</label>
                    <div class="col-sm-8">
                        <input type="password" id="password" class="form-control" placeholder="请输入密码" name="password"/>
                    </div>
                </div>

                <div class="input-group" style="margin-bottom: 10px; width: 400px;">
                    <div class="col-sm-offset-4 col-sm-8">
                        <button type="submit" class="btn btn-primary">登录</button>
                    </div>
                </div>
                
                <% if(request.getAttribute("msg")!=null || !request.getAttribute("msg").toString().trim().equals("")){ %>
    			<div class="input-group" style="margin-bottom: 10px; width: 400px;">
                    <label for="msg1" class="col-sm-4 control-label sr-only">密码：</label>
                    <div class="col-sm-8">
                        <input type="text" id="msg" class="form-control" readonly="readonly" value="* <%= request.getAttribute("msg") %>" style="color: red;"/>
                    </div>
                </div>
    			<%} %>
            </div>
        </form>
    </div>
    
</div>
<script type="text/javascript">
	function check(form){
		if(document.forms.loginForm.password.value==""){
			alert("请输入密码！");
			document.forms.loginForm.password.focus();
			return false;
		}
	}
</script>
</body>
</html>