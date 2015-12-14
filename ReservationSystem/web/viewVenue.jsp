<%-- 
    Document   : viewVenue
    Created on : Dec 14, 2015, 9:51:26 PM
    Author     : Wai Pai Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost/reservation";
                
                Connection conn = DriverManager.getConnection(url, "root","");
                
                String queryRead = "SELECT * FROM VENUE";
                
                PreparedStatement stmt = conn.prepareStatement(queryRead);
                ResultSet rs = stmt.executeQuery();
                %>
                <div class="col-md-offset-3 col-md-6">
                    <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Venue Name</th>
                                    <th>Reservation Status</th>
                                </tr>
                            </thead>

                    <%
                    while(rs.next()){
                    %>
                            <tbody>
                                <tr>
                                    <td><% out.println(rs.getString(1)); %></td>
                                    <td><% out.println(rs.getString(2)); %></td>
                                    <td>
                                        <% 
                                            if(rs.getString(3).equals("0")){
                                                out.println("Available");
                                            }else{
                                                out.println("Not Available");
                                            }
                                        %>
                                    </td>
                                </tr>
                            </tbody>

            <%
                    }
                }catch(Exception ex){
                    out.println(ex.getMessage());
                }
             %>
             </table>
         </div>
    </body>
</html>
