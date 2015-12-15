<%@page import="common.ResultList"%>
<%@page import="common.ViewPermission"%>
<%@page import="common.DB"%>
<%@page import="java.util.ArrayList, common.Page" %>
<%
    String currentPageNameWithSlash = request.getServletPath();
    String currentPageLoaded = currentPageNameWithSlash.substring(currentPageNameWithSlash.lastIndexOf("/")+1); 
    
    boolean isLoggedIn = false;
 
    
    ArrayList<Page> pages = new ArrayList();
    
    pages.add(new Page("all", request.getContextPath() + "/index.jsp", "Home"));
    
    pages.add(new Page("utmUser", request.getContextPath() + "/viewVenue.jsp", "Reserve Venues"));
    pages.add(new Page("utmUser", request.getContextPath() + "/checkReservation.jsp", "Check Reservation Status"));
    
    pages.add(new Page("guest", request.getContextPath() + "/viewVenue.jsp", "Reserve Venues"));
    pages.add(new Page("guest", request.getContextPath() + "/checkReservation.jsp", "Check Reservation Status"));
    
    pages.add(new Page("admin", request.getContextPath() + "/viewVenue.jsp", "Reserve Venues"));
    pages.add(new Page("admin", request.getContextPath() + "/checkReservation.jsp", "Check Reservation Status"));
    pages.add(new Page("admin", request.getContextPath() + "/updateVenue.jsp", "Update Venue"));
    
    pages.add(new Page("hema", request.getContextPath() + "/viewVenue.jsp", "Reserve Venues"));
    pages.add(new Page("hema", request.getContextPath() + "/approvalRequest.jsp", "Approval Request"));

%>

<!DOCTYPE html>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css">
<link rel="icon" 
      type="image/ico" 
      href="<%=request.getContextPath()%>/img/favicon.ico">

<style>
    .website-title {
        text-transform: uppercase;
        font-size: 19px;
        line-height: 19px;
        font-family: Arial;
        font-weight: bold;
        position: relative;
        margin-top: 0px;
        padding-bottom: 6px;
        top: 0px !important;
        border-bottom: 0px;
        color: rgb(51, 51, 51);
    }
</style>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/auto-complete.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-table.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select2.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select2-bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer-style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery.URI.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/bootstrap-table.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/select2.min.js"></script>



<!---// load the mcDropdown CSS stylesheet //--->


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div class="page-header">
    <div class="container-fluid" style="margin-bottom: 20px;">
        <div class="col-xs-1 media-left">
            <img class="img-responsive media-object" src="<%=request.getContextPath()%>/img/LambangMalaysia.png" alt="Malaysian Coat of Arms">						
        </div>

        <div class="col-xs-2 media-left" >
            <a href="http://www.utm.my">
                <img class="img-responsive media-object" src="<%=request.getContextPath()%>/img/LogoUTM.png" alt="UTM Logo"/>
            </a>
        </div>

        <div class="col-xs-offset-1 col-xs-6">
            <div style="margin-top: -25px;">
                <h1>Venue Reservation System<br>
                    <small class="website-title">Faculty Of Computing</small>
                </h1>

            </div>
        </div>

        <div class="col-xs-2">
            <span style="margin:0px;float:right;margin-top:auto;">
                <img width=20 src="http://www.utm.my/dev/2014/social-media-icon/mobile-icon(small).jpg" alt="Mobile" onClick="alert('This website can be viewed in mobile device')">
                <a target="_blank" href="http://www.facebook.com/univteknologimalaysia"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-facebook-2-icon.svg" alt="Facebook"></a>
                <a target="_blank" href="https://twitter.com/utm_my"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-twitter-2-icon.svg" alt="Twitter"></a>
                <a target="_blank" href="http://www.youtube.com/utmskudaimalaysia"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-youtube-2-icon.svg" alt="YouTube"></a>
                <a target="_blank" href="http://instagram.com/utmofficial"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-instagram-2-icon.svg" alt="Instagram"></a>
                <a target="_blank" href="http://www.pinterest.com/utmmy/"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-pinterest-2-icon.svg" alt="Pinterest"></a>
            </span>
        </div>
    </div>
</div>

<div class="container">

    <nav class="navbar navbar-default">
        <div class="container-fluid">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#utm-cfms-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div> <!-- /.navbar-header -->

            <div class="collapse navbar-collapse" id="utm-cfms-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    
                    <%
                        for (int i = 0; i < pages.size(); ++i) {
                            Page p = pages.get(i);
                            
                            // Determine if user is logged in
                            if (p.getAllowedUser().equals(session.getAttribute("userType"))) {
                                isLoggedIn = true;
                            }
                            
                            if (p.getAllowedUser().equals(session.getAttribute("userType")) || p.getAllowedUser().equals("all")) {
                                if (p.getFileName().contains(currentPageLoaded)) {
                    %>
                                    <li class="active"><a href="<%=p.getFileName()%>"><%=p.getPageTitle()%> <span class="sr-only">(current)</span></a></li>
                    <%  
                                } else { 
                    %>
                                    <li><a href="<%=p.getFileName()%>"><%=p.getPageTitle()%></a></li>
                    <%
                                } 
                            }
                        }
                    %>

                </ul>
                
                <% if (isLoggedIn) { %>
                    <ul class="nav navbar-nav navbar-right">
                        
                        <% if (session.getAttribute("userType") != null) { %>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-user" aria-hidden="true" style="padding-right: 5px"></span>
                                <%=session.getAttribute("name").toString()%>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="<%=request.getContextPath()%>/LogoutServlet">
                                        <span class="glyphicon glyphicon-off" style="padding-right: 10px;"></span>Log Out
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <% } %>
                    </ul>
                <% } %>

            </div>
        </div>
    </nav>

</div>
