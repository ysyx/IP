<script src="oUTMr/asset/jqueryvalidation/dist/jquery.validate.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Management</title>
    </head>
    <body>
        <div class='row>'
        <div class="row"><div class="col-md-offset-4 col-sm-offset-4"><h1>Image Management</h1></div></div>
        <div class="row">
            <div class="col-md-offset-5 col-sm-offset-5">
                <form id="fileForm" enctype="multipart/form-data" name="form" method="post"
	      action="oUTMr/venue/addimage" >
                    <input type="hidden" value="<% out.println(request.getParameter("venue_id")); %>" name="venue_id">
                    <input id="file" name="file" type="file" class="required" accept="image/*" /><br>
                    <input id="uploadButton" name="uploadButton" type="submit" value="Upload" />
                </form>
            </div>
        </div>
        <div class="row display: -webkit-box;display: -webkit-flex;display: -ms-flexbox;display: flex;">
            <hr>
            <div class="col-md-offset-3 col-md-4 col-sm-offset-3 col-sm-md4">Image</div>
            <div class="col-md-2 col-sm-2 ">Delete</div>
        </div>
        <hr>   
        <c:forEach var="book" items="${imageUrlList}">
            <div class="row" style="display: -webkit-box;display: -webkit-flex;display: -ms-flexbox;display: flex;">
                <div class="col-md-offset-2 col-md-4 col-sm-offset-1 col-sm-md4">
                    <img style='max-width: 500px;width:100%;max-height: 100px; height:100%;' src="oUTMr/asset/images/<% out.println(request.getParameter("venue_id")); %>/${book}" />
                </div>
                <div  class=" col-md-offset-1 col-md-2 col-sm-2">
                    <form  action="oUTMr/venue/deleteimage" method="get" style="top:45%;position: absolute;">
                        <input type="hidden" value="${book}" name="image_id">
                        <input type="hidden" value="<% out.println(request.getParameter("venue_id")); %>" name="venue_id">
                        <button  type="submit" class="btn">
                            <span class="glyphicon glyphicon-trash"></span>
                        </button>
                    </form>
                </div>
            </div>		
            <hr>		
        </c:forEach>
        </div>
    </body>
</html>
<script>
	$(document).ready(function() {
            $("#fileForm").validate();
	});
</script>