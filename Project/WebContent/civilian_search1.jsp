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
      <h2 style="color:Green;">Search</h2>
      <br>
   <%
      
      String s2=request.getParameter("select_product");
      
      Connection con;
      PreparedStatement ps1,ps2,ps3;
      ResultSet rs1,rs2,rs3;
      con=Mycon.getConnection();
      ps1=con.prepareStatement("select * from COMMODITY where SUBCATEGORY=? and USERTYPE=?");
      ps1.setString(1,s2);
      ps1.setString(2,"Farmer");
      rs1=ps1.executeQuery();
      
      ps2=con.prepareStatement("select * from COMMODITY where SUBCATEGORY=? and USERTYPE=?");
      ps2.setString(1,s2);
      ps2.setString(2,"WholeSaler");
      rs2=ps2.executeQuery();
     
      
      ps3=con.prepareStatement("select * from COMMODITY where SUBCATEGORY=? and USERTYPE=?");
      ps3.setString(1,s2);
      ps3.setString(2,"Retailer");
      rs3=ps3.executeQuery();
      
      %>
     
      <p>
      <font color="red"> Farmer Price=Price Per Quintal<br>
      Wholesaler Price=Price Per Quintal<br>
      Retailer Price=Price Per Kg
                      </font> 
                 <div class="table_css" style="width: 92%" >
                
                
                <p><font color="orange"><h4>Farmer Price</h4></font></p>
                <table style="width: 100%"> 
               
                
                
                    <tr>
                        <td >
                           Name
                        </td>
                        <td >
                            Emailid
                        </td>
                        <td >
                            Mobile No.
                        </td>
                        <td >
                            Price
                        </td>
                    </tr>
                   
                     <%
                     while(rs1.next())
                     {
                     %><tr>  
                        <td ><%=rs1.getString(2)%></td>
						<td ><%=rs1.getString(1)%></td>
                        <td ><%=rs1.getString(8)%></td>
                        <td ><%=rs1.getString(7)%></td>
                    </tr> 
                    <%
                     }
                    %>    
                </table>
                <p>&nbsp</p>
                <p><font color="orange"><h4>WholeSaler Price</h4></font></p>
                <table style="width: 100%"> 
               
                
                
                    <tr>
                        <td >
                           Name
                        </td>
                        <td >
                            Emailid
                        </td>
                        <td >
                            Mobile No.
                        </td>
                        <td >
                            Price
                        </td>
                    </tr>
                   
                     <%
                     while(rs2.next())
                     {
                     %><tr>  
                        <td ><%=rs2.getString(2)%></td>
						<td ><%=rs2.getString(1)%></td>
                        <td ><%=rs2.getString(8)%></td>
                        <td ><%=rs2.getString(7)%></td>
                    </tr> 
                    <%
                     }
                    %>    
                </table>
                <p>&nbsp</p>
                <p><font color="orange"><h4>Retailer Price</h4></font></p>
                <table style="width: 100%"> 
                 </td>
                
                    <tr>
                        <td >
                           Name
                        </td>
                        <td >
                            Emailid
                        </td>
                        <td >
                            Mobile No.
                        </td>
                        <td >
                            Price
                        </td>
                    </tr>
                   
                     <%
                     while(rs3.next())
                     {
                     %><tr>  
                        <td ><%=rs3.getString(2)%></td>
						<td ><%=rs3.getString(1)%></td>
                        <td ><%=rs3.getString(8)%></td>
                        <td ><%=rs3.getString(7)%></td>
                    </tr> 
                    <%
                     }
                    %>    
                </table>
                
            </div>
                      
                      
                      
 
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