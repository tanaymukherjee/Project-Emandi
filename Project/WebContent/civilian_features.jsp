<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*" session="false"%>
<%
//response.addHeader("cache-control", "no-cache");  
response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server  
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance  
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"  
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  
Authorized a=new Authorized(request, response);
if(!a.isValidSession())
    {
    response.sendRedirect("index.jsp");
    return;
}
%>





<!DOCTYPE HTML>
<html lang="en-US">
<head>
<title>Welcome to Golden Crop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="profile.css" media="all" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" /><![endif]-->
<script type="text/javascript" src="style/js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="style/js/scripts.js"></script>
<style type="text/css">
.auto-style1 {
	margin-left: 40px;
}
</style>
<script type="text/javascript" src="city.js"></script>

<script type="text/javascript" src="commodity.js"></script>
<script type="text/javascript" src="commodity_requriment.js"></script>

<link href="table_css.css" rel="stylesheet" type="text/css">



</head>
<body>
<div id="container">
  <!-- Begin Header Wrapper -->
  <div id="page-top">
    <div id="header-wrapper">
      <!-- Begin Header -->
      <div id="header">
        <div id="logo"><a href="civilian_home.jsp"></a></div>
        <!-- Logo -->
        <!-- Begin Menu -->
        <div id="menu-wrapper">
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="civilian_home.jsp">Home</a></li>
              <li><a href="civilian_edit.jsp">Edit</a></li>
              <li><a href="civilian_mail.jsp">Mail Box</a></li>
              <li><a href="civilian_search.jsp">Search</a></li>
              <li><a href="civilian_features.jsp" class="selected">Features</a></li>
              
              <li><a href="logout.jsp">Logout</a></li>
            </ul>
          </div>
        </div>
        <!-- End Menu -->
      </div>
      <!-- End Header -->
    </div>
  </div>
  <!-- End Header Wrapper -->
  <!-- Begin Wrapper -->
  <div id="wrapper">
  
  
  
   <!-- whose profile indicator-->
     <div id="portfolio">
      
      <ul class="gallerynav">
        
        <li>
        <a href="civilian_home.jsp" data-value="web"><font color="red">Welcome <%=a.getname()%> (Civilian)</font><span></span></a>
        </li>
      </ul>
  
  
    <div class="tab-wrapper">
      <ul id="tab-menu">
      
    
    <li class="selected">Post Requirement</li>
    
    <li>Complaint-Suggetion</li>
      </ul>
      <div class="tab-content">
        
        
       
       <div class="tab show">
          <h3 style="color:Green;">Post Requirement</h3>
          <p>  
          <div align="center" style="background-color:#E0E0E0">
          <p>&nbsp;</p>
             <form name="post_requirement" method="post" action="civilianrequirement.jsp" style="width: 516px; height: 319px">
             
          <table border="1" cellpadding="1" cellspacing="1" class="auto-style1" style="width: 460px; height: 321px">
  <tr>
    <td>Select Product:</td>
    <td><select name="select_product" id="commodity1" onChange="setType1();" size="1" style="width: 95px; height: 25px;">
       <option value="vegetable">Vegetable</option>
       <option value="cereal">Cereal</option>
       <option value="fruit">Fruit</option>
    </select> <select name="select_product1" id="type1" size="1" style="width: 97px; height: 25px;">
       <option value="">type1</option>
       <option >type2</option>
       <option >type3</option>
    </select></td>
  </tr>
  <tr>
    <td>Quantity Required:</td>
    <td><input name="quantity" type="text" style="width: 95px; height: 20px;"> <select name="unit" size="1" style="width: 97px; height: 25px;">
       <option value="kg">Kg</option>
       <option value="quintal">Quintal</option>
       <option value="tonnes">Tonnes</option>
    </select></td>
  </tr>
  <tr>
     <td> <input name="post" class="button gray" type="submit" value="Post" style="width: 100px"/></td>
     <td></td>
  </tr>
</table>
 
        </form> 
        <p>&nbsp;</p>
          </div>
          </p>
          
        </div>

      

       
             
      <div class="tab">
          <h3 style="color:Green;">Complaint-Suggestion</h3>
          <p>  
          <div align="center" style="background-color:#E0E0E0">
          <p>&nbsp;</p>
             <form name="feedback" method="post" action="civiliancomplaint.jsp" style="width: 516px; height: 319px">
             
          <table border="1" cellpadding="1" cellspacing="1" class="auto-style1" style="width: 460px; height: 321px">
  
  <tr>
    <td>Subject:</td>
  </tr>
  <tr>  
    <td><input name="subject" type="text" style="width: 195px; height: 25px;"></td>
  </tr>
  <tr>
    <td>Message:</td>
  </tr>
  <tr> 
    <td><textarea name="message" style="width: 424px; height: 142px"></textarea></td>
  </tr>
  <tr>
     <td> <input name="send" class="button gray" type="submit" value="Send" style="width: 100px"/></td>
  </tr>
</table>
 
        </form> 
        <p>&nbsp;</p>
          </div>
          </p>
          
        </div></div>
        
      </div>
    </div>
    <div class="clear"></div>
  </div>
  <!-- End Wrapper -->
  <div class="clearfix"></div>
  <div class="push"></div>
  <!-- Begin Footer -->
  <div id="footer-wrapper">
    <div id="footer">
      <div id="footer-content">
        <!-- Begin Copyright -->
        <div id="copyright">
          <p>Copyright &copy; <a href="#">Domain Name</a> - All Rights Reserved | Design By <a target="_blank" href="http://elemisfreebies.com/">elemis</a></p>
        </div>
        <!-- End Copyright -->
        <!-- Begin Social Icons -->
        <div id="socials">
          <ul>
            <li><a href="#"><img src="style/images/icon-rss.png" alt="" /></a></li>
            <li><a href="#"><img src="style/images/icon-twitter.png" alt="" /></a></li>
            <li><a href="#"><img src="style/images/icon-dribble.png" alt="" /></a></li>
            <li><a href="#"><img src="style/images/icon-tumblr.png" alt="" /></a></li>
            <li><a href="#"><img src="style/images/icon-flickr.png" alt="" /></a></li>
            <li><a href="#"><img src="style/images/icon-facebook.png" alt="" /></a></li>
          </ul>
        </div>
        <!-- End Social Icons -->
      </div>
    </div>
  </div>
  <!-- End Footer -->
</div>
<script type="text/javascript">
$(document).ready(function () {
    //Get all the LI from the #tabMenu UL
    $('#tab-menu > li').click(function () {
        //remove the selected class from all LI    
        $('#tab-menu > li').removeClass('selected');
        //Reassign the LI
        $(this).addClass('selected');
        //Hide all the DIV in .tab-content
        $('.tab-content div.tab').slideUp('slow');
        //Look for the right DIV in boxBody according to the Navigation UL index, therefore, the arrangement is very important.
        $('.tab-content div.tab:eq(' + $('#tab-menu > li').index(this) + ')').slideDown('slow');
    }).mouseover(function () {
        //Add and remove class, Personally I dont think this is the right way to do it, anyone please suggest    
        $(this).addClass('mouseover');
        $(this).removeClass('mouseout');
    }).mouseout(function () {
        //Add and remove class
        $(this).addClass('mouseout');
        $(this).removeClass('mouseover');
    });
});
$(function () {
    var offset = $("#tab-menu").offset();
    var topPadding = 15;
    $(window).scroll(function () {
        if ($(window).scrollTop() > offset.top) {
            $("#tab-menu").stop().animate({
                marginTop: $(window).scrollTop() - offset.top + topPadding
            });
        } else {
            $("#tab-menu").stop().animate({
                marginTop: 0
            });
        };
    });
});
</script>
</body>
</html>