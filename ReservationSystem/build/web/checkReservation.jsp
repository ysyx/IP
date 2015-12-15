<%-- 
    Document   : checkReservation
    Created on : Dec 12, 2015, 3:24:03 PM
    Author     : Yansheng
--%>

<%@page import="common.DB"%>
<jsp:include page="header.jsp"/>
<%@page import="common.ResultList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username =session.getAttribute("User").toString();
    
    ResultList rs = DB.query("SELECT * FROM venue_reservation as u, venue as m WHERE u.username= '"+username+"' AND u.venueID=m.venueID");
    
    rs.next();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Status - <%=session.getAttribute("User").toString()%></title>
    </head>
    <body>
        
        <div class="container">
        
        <%
            String pending_status = "Pending Successful";
            if (session.getAttribute(pending_status) != null) { // If there is an error during login
        %>
                <div class="alert alert-success" role="alert">
                    <span class="glyphicon glyphicon-ok" aria-hidden="true" style="padding-right: 10px"></span>
                    <strong><%=session.getAttribute(pending_status) %></strong>
                </div>
        <%
            session.removeAttribute(pending_status);
            }
        %>
        
        
        
            <div class="col-md-12 vcenter">
            <table class="table">
                <thead>
                    <tr>
                        <th data-sortable="true" data-field="courseName">No.</th>
                        <th data-sortable="true" data-field="courseName">Venue</th>
                        <th data-sortable="true" data-field="courseCode">Date</th>
                        <th data-sortable="true" data-field="courseName">Time</th>
                        <th data-sortable="true" data-field="courseCode">Status</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        int i=1;
                        while(rs.next()){ 
                    %>
                    <tr>
                        <td><%=i %></td>
                        <td><%=rs.getString("description") %></td>
                        <td><%=rs.getString("date") %></td>
                        <td><%=rs.getString("time") %></td>
                        
                        <td>
                            <% 
                                if(rs.getString("approval_status").equals("pending")){
                            %>
                            <button class="btn btn-warning" type="button"><i class = "glyphicon glyphicon-refresh">Pending</i></button> 
                            <%
                                }else if(rs.getString("approval_status").equals("approved")){
                            %>
                            <button class="btn btn-success" type="button"><i class = "glyphicon glyphicon-thumbs-up"> Success</i></button> 
                            <%
                                }else if(rs.getString("approval_status").equals("rejected")){
                            %>
                            <button class="btn btn-danger" type="button"><i class = "glyphicon glyphicon-remove"> Rejected</i></button> 
                            <%
                                }
                            %>
                        </td>
                        
                    </tr>
                    <% i++; } %>
                </tbody>
            </table>
            </div>
        
        </div>
    </body>
</html>
