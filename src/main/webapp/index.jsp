<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页面</title>
<link rel="stylesheet" href="bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="indexstyle.css" type="text/css"/>
</head>
<body>
<div class="top_menu">
        <div class="left_icon">
            <h4>8839 林免冲</h4>
        </div>
        <div class="right_user">
            <a class="btn btn-primary" href="<%=request.getContextPath() %>/ExitServlet">
                退出系统
            </a>
        </div>
    </div>

    <div class="left_menu list-group col-lg-2">
        <a href="#" class="list-group-item">
            Customer管理
            <span style="float: right;">&rtri;</span>
        </a>
        <a href="#" class="list-group-item">
            Film设置
            <span style="float: right;">&rtri;</span>
        </a>
    </div>

    <div class="main col-lg-10">
        <div class="content">
            <h3>客户管理</h3>
            <hr/>
            <p>
            客户列表     
        <button type="button" class="btn btn-success btn-md"
             data-toggle="modal" data-target="#myModal">
                新建
        </button>
            </p>
            <%
            	ResultSet rs = (ResultSet)request.getAttribute("customers");
            int count = 599;
            	if(rs == null){
            %>
            <div><h4>没有任何客户信息！</h4></div>
            <%}else{ %>
            <div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>操作</th>
                            <th>FirstName</th>
                            <th>LastName</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Customerid</th>
                            <th>lastUpdate</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% while(rs.next()){%>
                        <tr>
                            <td>
                            	<a href="" data-toggle="modal" data-target="#updateModal"
                            	data-whatever="<%= rs.getString(1) %>">编辑 </a>
                            	<a href="<%= request.getContextPath() %>/DeleteServlet?id=<%= rs.getInt(1) %>" onclick="return checkDelete()"> 删除</a>
                            </td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getString(6) %></td>
                            <td><%= rs.getTimestamp(7) %></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="page">
            <nav>
                <ul class="pagination pagination-md" id="mypage">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <% 
                    	if(count % 7 != 0){
                    		count++;
                    	}
                        int i = 1;
                    	while(i <= count){ 
                    		if(i==1){
                    %>
                
                    <li><a href="#" class="active" id="ap"><%= i %></a></li>
                    <%
                    		}else{
                    			if(i > 7){
                    				
                    				
                    %>
                    <li><a href="#" id="ap" style="display: none;"><%= i %></a></li>
                    <%}else{ %>
                    <li><a href="#" id="ap"><%= i %></a></li>
                    <%}
                    		}
                    		i++;
                    		
                    }
                    %>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
    </div>
     <%
            } 
            %>
            
<div class="modal fade" id="myModal"  tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">新建Customer</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group form-inline">
                            <label for="firstName">FirstName：</label>
                            <input type="text" class="form-control" id="firstName">
                        </div>
                        <div class="form-group form-inline">
                            <label for="lastName">LastName：</label>
                            <input type="text" class="form-control" id="lastName">
                        </div>
                        <div class="form-group form-inline">
                            <label for="email">Email：</label>
                            <input type="text" class="form-control" id="email">
                        </div>
                        <div class="form-group form-inline">
                            <label for="address">Address：</label>
                            <input type="text" class="form-control" id="address">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                 <button type="button"
                            class="btn btn-primary">
                        新建
                    </button>
                    <button type="button"
                            class="btn btn-default" data-dismiss="modal">
                        取消
                    </button>
                   
                </div>
            </div>
        </div>
    </div>
    
        <div class="modal fade" id="updateModal"  tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">编辑Customer</h4>
                </div>
                <div class="modal-body">
                    <form>
                    	<div class="form-group form-inline">
                            <label for="firstName1">FirstName：</label>
                            <input type="text" class="form-control" id="firstName1">
                        </div>
                        <div class="form-group form-inline">
                            <label for="firstName1">FirstName：</label>
                            <input type="text" class="form-control" id="firstName1">
                        </div>
                        <div class="form-group form-inline">
                            <label for="lastName1">LastName：</label>
                            <input type="text" class="form-control" id="lastName1">
                        </div>
                        <div class="form-group form-inline">
                            <label for="email1">Email：</label>
                            <input type="text" class="form-control" id="email1">
                        </div>
                        <div class="form-group form-inline">
                            <label for="address">Address：</label>
                            <input type="text" class="form-control" id="address1">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button"
                            class="btn btn-default" data-dismiss="modal">
                        取消
                    </button>
                    <button type="button"
                            class="btn btn-primary">
                        保存
                    </button>
                </div>
            </div>
        </div>
    </div>
<script src="jquery-2.1.4.min.js"></script>
<script src="bootstrap.min.js"></script>
<script>
    $("#page a").click(function(e){
        $(this).tab("show");
    });
    function checkDelete(){
    	return confirm("真的要删除该客户信息吗？");
    }
</script>
</body>
</html>