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
        <div id="logo"><a href="civilian_home.jsp"><img src="style/images/logo.png" alt="" /></a></div>
        <!-- Logo -->
        <!-- Begin Menu -->
        <div id="menu-wrapper">
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="civilian_home.jsp" class="selected">Home</a></li>
              <li><a href="civilian_edit.jsp" >Edit</a></li>
              <li><a href="civilian_mail.jsp" >Mail Box</a></li>
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
  
  
   <%
Mail a1=new Mail();
a1.setSendfrom(request.getParameter("sentfrom"));
a1.setDdate(request.getParameter("date"));
a1.setSubject(request.getParameter("subject"));
a1.setUsertype(request.getParameter("status"));
ResultSet rs=a1.showmail();

if(rs.next())
{
       
       a1.inbox(rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(6),rs.getString(7));
%> 
  
  
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
    
   <div class="content" align="center">
      <h2 style="color:Green;" align="left">Message</h2>
    <form action="deletecivilianmessage.jsp" method="post">
     <table border="1">
                                    
                    <tr>
                    	<td><font color="red">Sent From:</font></td>
                        <td><INPUT type=text name="sentfrom" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a1.getSendfrom()%>"></td>
                    	<tr><td><br></td></tr>
                    </tr>
                    <tr>
                    	<td><font color="red">User:</font></td>
                        <td><INPUT type=text name="status" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a1.getUsertype()%>"></td>
 						<tr><td><br></td></tr>                  
                    </tr>
                    <tr> 
                    	<td><font color="red">Subject:</font></td>
                       <td><input type="text" name="subject" readonly="readonly" value="<%=a1.getSubject()%>" style="background:none;border:0;color:" /></td>
 						<tr><td><br></td></tr>                   
                    </tr>
                    
                    <tr>
                    	<td><font color="red">Date:</font></td>
                        <td><INPUT type=text name="date" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a1.getDdate()%>"></td>
                    	<tr><td><br></td></tr>
                    </tr>
                    <tr>
                    	<td><font color="red">Message:</font></td>
                        <td><%=a1.getMessage()%></td>
                        <tr><td><br></td></tr>
                    </tr>                         
                </table>
   
   <table align="left">
   <tr>
   
   <td colspan="2" align="left"><a href="civilian_mail.jsp"><font color="red">Back To Inbox &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </font></a></td>
   <td colspan="2" align="right"><input type="submit" name="subject" value="Delete Message" style="background:none;border:0;color:#ff0000" /></td>
   </form>
   </tr>
   </table>
   <br><br>

   
    
   

 
     
    </div>
    
    <%
}
    %>
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