<%-- 
    Document   : index
    Created on : Dec 11, 2015, 10:05:39 PM
    Author     : Yansheng
--%>

<jsp:include page="header.jsp"/>

<%
    String userType = "Guest";
    boolean isLoggedIn = false;
    if (session.getAttribute("userType") != null) {
        userType = (String) session.getAttribute("userType");
        isLoggedIn = true;
    } 
    
    boolean invalidPassword = false;
    boolean sameUsername = false;
    
    if (session.getAttribute("Error") != null) {
        if (session.getAttribute("Error").equals("Invalid password.")) {
            invalidPassword = true;
        }
        else if (session.getAttribute("Error").equals("Username Exist.")){
            sameUsername = true;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>UTM Venue Reservation System</title>
    </head>
    
    <body>
        
        <div class="container">
            
        <%
            String access_error = "Access Error";
            if (session.getAttribute(access_error) != null) { // If there is an error during login
        %>
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true" style="padding-right: 10px"></span>
                    <strong><%=session.getAttribute(access_error) %></strong>
                </div>
        <%
            session.removeAttribute(access_error);
            }
            
            if (!isLoggedIn) {
        %>
        
            <div class="col-md-1 vcenter"></div>
            
            <div class="col-md-5 vcenter">
                
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Register</strong></h3>
                    </div>
                    
                    <div class="panel-body">

                        <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/RegisterServlet">
                            
                            <div class="form-group">
                                <label for="name" class="control-label col-xs-4">Name</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="name" placeholder="Name" required>
                                </div>
                            </div>
                            
                            <div class="form-group <% if (sameUsername) out.println("has-error"); %>">
                                    <label for="username" class="control-label col-xs-4">Username</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="password" class="control-label col-xs-4">Password</label>
                                <div class="col-xs-8">
                                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                                </div>
                            </div>
                                    
                            <div class="form-group">
                                <label for="matric_no" class="control-label col-xs-4">UTM ID</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="matric_no" placeholder="Matric Number / Staff ID">
                                    *For UTM students/staffs
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="email" class="control-label col-xs-4">Email</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="email" placeholder="Email">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="tel_no" class="control-label col-xs-4">Contact Number</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="tel_no" placeholder="Contact Number">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-offset-8 col-xs-4">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </div>
                            
                        </form>
                        
                    </div> <!-- /.panel-body -->
                </div> <!-- /.panel .panel-default -->
                
            </div>
                        
            <div class="col-md-2 vcenter"></div>
            

            
            <div class="col-md-4 vcenter">
                
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Login</strong></h3>
                    </div>
                    
                    <div class="panel-body">

                        <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/LoginServlet">
                            
                            <div class="form-group">
                                <label for="username" class="control-label col-xs-4">Username</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="inputUsername" placeholder="Username" required>
                                </div>
                            </div>
                            
                            <div class="form-group <% if (invalidPassword) out.println("has-error"); %>">
                                <label for="inputPassword" class="control-label col-xs-4">Password</label>
                                <div class="col-xs-8">
                                    <input type="password" class="form-control" name="inputPassword" placeholder="Password" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-offset-8 col-xs-4">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                            </div>
                            
                        </form>
                        
                    </div> <!-- /.panel-body -->
                </div> <!-- /.panel .panel-default -->
                
                <%
                    String login_error = "Login Error";
                    if (session.getAttribute(login_error) != null) { // If there is an error during login
                %>
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true" style="padding-right: 10px"></span>
                            <strong><%=session.getAttribute(login_error) %></strong>
                        </div>
                <%
                    session.removeAttribute(login_error);
                    }
                %>
                
                <%
                    String register_status = "Register Successful";
                    if (session.getAttribute(register_status) != null) { // If there is an error during login
                %>
                        <div class="alert alert-success" role="alert">
                            <span class="glyphicon glyphicon-ok" aria-hidden="true" style="padding-right: 10px"></span>
                            <strong><%=session.getAttribute(register_status) %></strong>
                        </div>
                <%
                    session.removeAttribute(register_status);
                    }
                %>
                
            </div>
        <%
            }
            
            if (isLoggedIn) {
        %>    
        
        
        <div class= "<% if (!isLoggedIn) out.println("col-xs-8"); %>">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Venue Reservation System</strong></h3>
                </div>
                    <div class="panel-body">
                        <div class="row">
                            
                            <div class="col-md-4">  
                                <h4><strong>Dewan Sultan Iskandar</strong></h4><br>
                                <img class="img-responsive media-object" src="<%=request.getContextPath()%>/img/DSI.jpg" alt="Dewan Sultan Iskandar">
                            </div>
                                
                            <div class="col-md-4">
                                <h4><strong>N24</strong></h4><br>
                                <img class="img-responsive media-object" src="<%=request.getContextPath()%>/img/N24.png" alt="Blok N24">
                            </div>
                                
                            <div class="col-md-4">
                                <h4><strong>L50</strong></h4><br>
                                <img class="img-responsive media-object" src="<%=request.getContextPath()%>/img/L50.jpg" alt="Blok L50">
                            </div>
                        </div>
                        
                            <br>
                            <a href="<%=request.getContextPath()%>/viewVenue.jsp" class="btn btn-info pull-right" role="button" >More >></a>
                </div>
            </div>
        </div>
        
        <%
            }
        %>

                
        </div>
            
        
    </body>
</html>
