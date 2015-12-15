<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Database.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body>
<%
    int count = 0;
    DB db= new DB();
    if(db.connect()){
        db.query("select * from venue");
    }
%>
<div class="table-responsive col-md-offset-1 col-md-10" >
    <table class="table">
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <form  action="oUTMr/venue/addvenue" method="get">
                    <button  type="submit" class="btn btn-warning">
                        <span class="glyphicon glyphicon-plus"></span> 
                    </button>
                </form> 
            </td>
        </tr>
        <tr>
            <td>ID</td>
            <td>Venue Name</td>
            <td>Venue Size</td>
            <td>Venue Capacity</td>
            <td>Edit</td>
            <td>Image</td>
            <td>Delete</td>
        </tr>
        <% 
        while(count<db.getNumberOfRows()){%>
            <tr>
                <td><%out.println(db.getDataAt(count, "pk_id"));%></td>
                <td><%out.println(db.getDataAt(count, "venue_name"));%></td>
                <td><%out.println(db.getDataAt(count, "venue_size"));%></td>
                <td><%out.println(db.getDataAt(count, "venue_capacity"));%></td>
                <td>            
                    <form action="oUTMr/venue/editvenue" method="get">
                        <input type="hidden" value="<% out.println(db.getDataAt(count, "pk_id"));%>" name="venue_id">
                        <button  type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-pencil"></span> 
                        </button>
                    </form> 
                </td>
                <td>            
                    <form action="oUTMr/venue/editimage" method="get">
                        <input type="hidden" value="<% out.println(db.getDataAt(count, "pk_id"));%>" name="venue_id">
                        <button  type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-hdd"></span> 
                        </button>
                    </form> 
                </td>
                <td>
                    <form action="oUTMr/venue/deletevenue" method="get">
                        <input type="hidden" value="<% out.println(db.getDataAt(count, "pk_id"));%>" name="venue_id">
                        <button  type="submit" class="btn btn-warning">
                            <span class="glyphicon glyphicon-trash"></span> 
                        </button>
                    </form>
                </td>
            </tr>
        <%  count++;
        }%>   
    </table>
</div>
</body>
