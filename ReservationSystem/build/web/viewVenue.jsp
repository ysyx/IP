<%-- 
    Document   : viewVenue
    Created on : Dec 12, 2015, 3:16:15 PM
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
        <title>View Venue - <%=session.getAttribute("User").toString()%></title>
    </head>
    <body>
        
        <%
            ResultList rs = DB.query("SELECT * FROM venue");
        %>
        
        <div class="container">
            <div class="col-md-1 vcenter"></div>
            
            <div class="col-md-10 vcenter">
            <table class="table">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Venue Name</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%while(rs.next()){ %>
                    <tr>
                        <td><%=rs.getString("venueID") %></td>
                        <td><%=rs.getString("description") %></td>
                        <td><a href="reserveVenue.jsp?venueID=<%=rs.getString("venueID")%>&username=<%=session.getAttribute("User").toString()%>&description=<%=rs.getString("description")%>"><button class="btn btn-primary btn-md"><span class="glyphicon glyphicon-check"></span> Reserve</button></a>
                    </tr>
        <% } %>
                </tbody>
            </table>
            </div>
            
            <div class="col-md-1 vcenter"></div>
            
                   
    </div> <!-- /.container -->
</body>
</html>
