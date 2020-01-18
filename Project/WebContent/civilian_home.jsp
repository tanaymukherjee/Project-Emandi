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
              <li><a href="civilian_home.jsp" class="selected">Home</a></li>
              <li><a href="civilian_edit.jsp" >Edit</a></li>
              <li><a href="civilian_mail.jsp" >Mail Box</a></li>
              <li><a href="civilian_search.jsp" >Search</a></li>
              <li><a href="civilian_features.jsp">Features</a></li>
              
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
    <!-- Begin Content -->
    
    
    <!-- whose profile indicator-->
     <div id="portfolio">
      
      <ul class="gallerynav">
        
        <li>
        <a href="civilian_home.jsp" data-value="web"><font color="red">Welcome <%=a.getname()%> (Civilian)</font><span></span></a>
        </li>
      </ul>
    
    <div class="content">
      <h2 style="color:Green;">Home</h2>
      <br>
      <p>Hello friend this is your home page. We know your importance in building the nation. Our economy is so much dependent on you. Thanks for your regular participation. </p>

      <br>
   <p>Through this profile of yours you can regularly maintain your database. What you grow, what you sell. Not only this, here you can put the stock of any commodity you have. We will show this to the respective wholesalers and will try you to give the maximum benefit. Relationship is build on trust, and we hope that we togethere can make a healthy atmosphere and make agriculture a more passionable profession. Thank you.</p>
   
   <br>
   <p>This portal is to perform a critical role in healthcare by providing a safe, secure and cost effective supply of quality food products, essential services and leading edge research to meet the needs of faremrs, wholesalers, retailers and civilians. The vision of the "Team-Quark" is to be a prominant brand for Consumer Services through Internet and Mobile in India thereby providing a common platform for those who have a zeal to worl for betterment of ethe society.</p>
   <br>
   <HR>
    <font size="5"><%String msg=request.getParameter("msg");
					if(msg!=null){
    				%>
			<label><font color="red">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=msg%></font></label> 
				<%
}
    %>                         </font><HR>
<br>
 
     </div>
    <!-- End Content -->
  </div></div>
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
            <li><a href="#"></a><img src="style/images/icon-rss.png" alt="" /></li>
            <li><a href="#"></a><img src="style/images/icon-twitter.png" alt="" /></li>
            <li><a href="#"></a><img src="style/images/icon-dribble.png" alt="" /></li>
            <li><a href="#"></a><img src="style/images/icon-tumblr.png" alt="" /></li>
            <li><a href="#"></a><img src="style/images/icon-flickr.png" alt="" /></li>
            <li><a href="#"></a><img src="style/images/icon-facebook.png" alt="" /></li>
          </ul>
        </div>
        <!-- End Social Icons -->
      </div>
    </div>
  </div>
  <!-- End Footer -->
</div>
</body>
</html>