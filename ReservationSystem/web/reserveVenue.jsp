<%-- 
    Document   : reserveVenue
    Created on : Dec 12, 2015, 3:23:39 PM
    Author     : Yansheng
--%>
<%@page import="common.DB"%>
<jsp:include page="header.jsp"/>
<%@page import="common.ResultList"%>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>

<style type="text/css">
/**
 * Override feedback icon position
 * See http://formvalidation.io/examples/adjusting-feedback-icon-position/
 */
#eventForm .form-control-feedback {
    top: 0;
    right: -15px;
}
</style>



<%
    String venueID = request.getParameter("venueID");
    String description = request.getParameter("description");
    String username =session.getAttribute("User").toString();
    
    ResultList rs = DB.query("SELECT * FROM user WHERE username= '"+username+"'");
    
    rs.next();
%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Reserve Venue - <%=session.getAttribute("User").toString()%></title>
    </head>
    <body>
        <div class="container">
            
            <%
            String reserve_status = "Reserve Error";
            if (session.getAttribute(reserve_status) != null) { // If there is an error during login
        %>
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="padding-right: 10px"></span>
                    <strong><%=session.getAttribute(reserve_status) %></strong>
                </div>
        <%
            session.removeAttribute(reserve_status);
            }
        %>
            
            <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Reserve Venue</strong></h3>
                    </div>
                    
                    <div class="panel-body">

                        <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/ReserveServlet">
                            
                            <div class="form-group">
                                <label for="text" class="control-label col-xs-4">Name</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="name" value="<%=rs.getString("name") %>" disabled="">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="text" class="control-label col-xs-4">Username</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="username" value="<%=username %>" disabled="">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="text" class="control-label col-xs-4">Venue ID</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="venueID" value="<%=venueID %>">
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <label for="text" class="control-label col-xs-4">Venue</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="description" value="<%=description %>">
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <label class="col-xs-4 control-label">Date</label>
                                <div class="col-xs-3 date">
                                    <div class="input-group input-append date" id="datePicker">
                                        <input type="text" class="form-control" name="date" />
                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                </div>
                            </div>
                                
<script type="text/javascript">

$(document).ready(function() {
    $('#datePicker')
        .datepicker({
            format: 'mm/dd/yyyy'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#eventForm').formValidation('revalidateField', 'date');
        });

    $('#eventForm').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {
                        message: 'The name is required'
                    }
                }
            },
            date: {
                validators: {
                    notEmpty: {
                        message: 'The date is required'
                    },
                    date: {
                        format: 'MM/DD/YYYY',
                        message: 'The date is not a valid'
                    }
                }
            }
        }
    });
});
</script>

                                    
                            <div class="form-group">
                                <label for="time" class="control-label col-xs-4">Time Slot</label>
                                <div class="col-xs-8">

                                    <div class="radio">
                                        <label class="radio-inline"><input type="radio" name="time" value="8-10am">8-10am</label>
                                        <label class="radio-inline"><input type="radio" name="time" value="10-12pm">10-12pm</label>
                                        <label class="radio-inline"><input type="radio" name="time" value="12-2pm">12-2pm</label>
                                        <label class="radio-inline"><input type="radio" name="time" value="2-4pm">2-4pm</label>
                                        <label class="radio-inline"><input type="radio" name="time" value="4-6pm">4-6pm</label>
                                        <label class="radio-inline"><input type="radio" name="time" value="6-8pm">6-8pm</label>
                                        <label class="radio-inline"><input type="radio" name="time" value="8-10pm">8-10pm</label>
                                        <label class="radio-inline"><input type="radio" name="time" value="10-12pm">10-12pm</label>                                      
                                    </div>
                                </div>
                                
                            </div>

                            <div class="form-group">
                                <div class="col-xs-offset-8 col-xs-4">
                                    <button type="submit" class="btn btn-primary">Reserve</button>
                                </div>
                            </div>
                            
                        </form>
                        
                    </div> <!-- /.panel-body -->
            </div> <!-- /.panel .panel-default -->
        </div>
    </body>


</html>
