<script src="oUTMr/asset/jqueryvalidation/dist/jquery.validate.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body>
    <div class="row">
        <div class="col-md-offset-2 col-md-8">
            <form id="uploadForm" enctype="multipart/form-data" name="form" method="post" action="oUTMr/venue/savevenue" target="target_upload"> 
                <div class="form-group">
                    <label for="ovenu_name">Venue Name</label>
                    <input type="text" class="form-control" name="venue_name"  placeholder="Venue Name">
                </div>
                <div class="form-group">
                    <label for="venu_description">Venue Description</label>
                    <input type="text" class="form-control" name="venue_description"  placeholder="Venue Description">
                </div>
                <div class="form-group">
                    <label for="venu_size">Venue Size</label>
                    <input type="text" class="form-control" name="venue_size" placeholder="Venue Size">
                </div>
                <div class="form-group">
                    <label for="venu_capacity">Venue Capacity</label>
                    <input type="text" class="form-control" name="venue_capacity" placeholder="Venue Capacity">
                </div>
                <input id="uploadButton" name="uploadButton" type="submit" value="Add" />
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
                $("#uploadForm").validate({
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
                        venue_name: {
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
