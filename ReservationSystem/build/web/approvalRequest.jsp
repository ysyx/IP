<%-- 
    Document   : approvalRequest
    Created on : Dec 12, 2015, 10:06:40 PM
    Author     : Yansheng
--%>

<jsp:include page="header.jsp"/>
<%@page import="common.ResultList"%>
<%@ page import ="java.sql.*, common.DB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approval Request - <%=session.getAttribute("User").toString()%></title>
    </head>
    <body>
        
        <%
            ResultList rs = DB.query("SELECT * FROM venue_reservation as m, user as n, venue as o WHERE m.username=n.username AND o.venueID=m.venueID AND m.approval_status='pending'");
        %>
        
        <div class="container">
            
            <div class="col-md-12 vcenter">
            <table class="table">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Username</th>
                        <th>Name</th>
                        <th>User Type</th>
                        <th></th>
                        <th>Venue Name</th>                        
                        <th>Date (MM/DD/YYYY)</th>
                        <th>Time</th>
                        <th></th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        int i=1;
                        while(rs.next()){ 
                    %>
                    <tr>
                        <td><%=i %></td>
                        <td><%=rs.getString("username") %></td>
                        <td><%=rs.getString("name") %></td>
                        <td><%=rs.getString("type") %></td>
                        <td></td>
                        <td><%=rs.getString("description") %></td>
                        <td><%=rs.getString("date") %></td>
                        <td><%=rs.getString("time") %></td>
                        
                        <td><a href="<%=request.getContextPath()%>/ApprovalServlet?venueID=<%=rs.getString("venueID")%>&date=<%=rs.getString("date") %>&time=<%=rs.getString("time") %>"><button class="btn btn-success btn-sm"><span class="glyphicon glyphicon-ok"></span> Approve</button></a>
                        <a href="<%=request.getContextPath()%>/RejectServlet?venueID=<%=rs.getString("venueID")%>&date=<%=rs.getString("date") %>&time=<%=rs.getString("time") %>"><button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-remove"></span> Reject</button></a>
                        </td>
                    </tr>
        <% i++; } %>
                </tbody>
            </table>
            </div>
            
                   
    </div> <!-- /.container -->
    </body>
</html>
