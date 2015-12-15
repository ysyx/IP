<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="ReservationSystem/asset/jqueryvalidation/dist/jquery.validate.js"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Error Page</title>
    </head>
    <body>
 
        <div class="panel panel-info row" >
            <div class="col-md-8 col-md-offset-2">
            <div class="panel-heading">
                <div class="panel-title"> <b>Sign In</b></div>
                <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
            </div>     

            <div style="padding-top:30px" class="panel-body" >
                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                <form id="myForm" class="form-horizontal" role="form" method="post" action="/ReservationSystem/account/verifylogin">

                <div style="margin-bottom: 25px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="login-email" type="text" class="form-control" name="email" value="" placeholder="Enter Email" required>                                        
                </div>

                <div style="margin-bottom: 25px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="login-password" type="password" class="form-control" name="password" placeholder="Enter Your Password" required>
                </div>
                <div style="margin-top:10px" class="form-group">
                    <div class="col-sm-12 controls" style=" left:0px;">
                        <button id="btn-login" class="btn btn-success" >Login  </button>
                        <button type="button" class="btn btn-default" data-dismiss="modal"> Sign Up</button>
                     </div>
                </div><p>User Information Enter Incorrect</p>  
                </form> 
            </div> 
            </div>
           
        </div> 
            
    </body>

</html>
<script type="text/javascript">
   
    (function($,W,D){
        var JQUERY4U = {};
        JQUERY4U.UTIL = {
            setupFormValidation: function(){
                //form validation rules
                $("#myForm").validate({
                    rules: {
                        email : {
                            required:true,
                            email:true

                        },
                        password: {
                            required: true,
                            minlength: 5
                        }
                    },
                    messages: {
                        email: {
                            required:"Please enter your last name",
                            email:"Please provided correct format email"
                        },
                        password: {
                            required: "Please provide a password",
                            minlength: "Your password must be at least 5 characters long"
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