<script src="ReservationSystem/asset/jqueryvalidation/dist/jquery.validate.js"></script>
<%@page import="Model.VenueBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="venue_bean" class="Model.VenueBean" scope="request"/>  
<!DOCTYPE html>
<body>
    <div class="row">
        <div class="col-md-offset-2 col-md-8">
            <form action="ReservationSystem/venue/savededit" method="post" id="myForm">
                <input type="hidden" name="venue_id" value="<jsp:getProperty name="venue_bean" property="pk_id"/>">
                <div class="form-group">
                    <label for="venu_name">Venue Name</label>
                    <input type="text" class="form-control" name="venue_name" value="<jsp:getProperty name="venue_bean" property="venue_name"/>">
                </div>
                <div class="form-group">
                    <label for="venu_description">Venue Description</label>
                    <input type="text" class="form-control" name="venue_description" value="<jsp:getProperty name="venue_bean" property="venue_description"/>">
                </div>
                <div class="form-group">
                    <label for="venu_size">Venue Size</label>
                    <input type="text" class="form-control" name="venue_size" value="<jsp:getProperty name="venue_bean" property="venue_size"/>" placeholder="Venue Size">
                </div>
                <div class="form-group">
                    <label for="venu_capacity">Venue Capacity</label>
                    <input type="text" class="form-control" name="venue_capacity" value="<jsp:getProperty name="venue_bean" property="venue_capacity"/>" placeholder="Venue Capacity">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
        </div>
    </body>
<script type="text/javascript">
   
    (function($,W,D){
        var JQUERY4U = {};
        JQUERY4U.UTIL = {
            setupFormValidation: function(){
                //form validation rules
                $("#myForm").validate({
                    rules: {
                        venue_name : {
                            required:true
                        },
                        venue_description: {
                            required: true,
                            minlength: 20
                        },
                        venue_size :{
                            required: true,
                            number: true
                        },
                        venue_capacity :{
                            required: true,
                            number: true
                        }
                    },
                    messages: {
                        venue_name :{
                            required:"Please enter venue name"
                        },
                        venue_description: {
                            required: "Please enter vanue desciption",
                            minlength: "Your descriotion cannot less than 20 character"
                        },
                        venue_size: {
                            required: "Please enter venue size",
                            number: "Only number allow"
                        },
                        venue_capacity: {
                            required: "Please enter vanue capacity",
                            number: "Only number allow"
                        }
                    },
                    submitHandler: function(form) {
                        form.submit();
                    }
                });
            }
        }

        //when the dom has loaded setup form validation rules
        $(D).ready(function($) {
            JQUERY4U.UTIL.setupFormValidation();
        });

    })(jQuery, window, document);
    
</script>