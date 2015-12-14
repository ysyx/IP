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
                
                while(rs.next()){
                    %>
                    <ul>
                        <li><%out.println(rs.getString(2));%></li>
                    </ul>
        <%
                }
            }catch(Exception ex){
                out.println(ex.getMessage());
            }
         %>
    </body>
</html>
