<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*" session="false"%>
<%
//response.addHeader("cache-control", "no-cache");  

try{
Authorized a=new Authorized(request, response);
if(a.isValidSession())
    {
	if(a.getuser().equals("Farmer"))
	{
    response.sendRedirect("farmer_home.jsp");
    return;
    }
	if(a.getuser().equals("Retailer"))
	{
    response.sendRedirect("retailer_home.jsp");
    return;
    }
	if(a.getuser().equals("WholeSaler"))
	{
    response.sendRedirect("wholesaler_home.jsp");
    return;
    }
	if(a.getuser().equals("Civilian"))
	{
    response.sendRedirect("civilian_home.jsp");
    return;
    }
	if(a.getuser().equals("Admin"))
	{
    response.sendRedirect("admin_home.jsp");
    return;
    }
	if(a.getuser().equals("Computer Administrator"))
	{
    response.sendRedirect("Computeradministrator_home.jsp");
    return;
    }
}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>


<!DOCTYPE HTML>
<html lang="en-US">

<head>
<title>Welcome to Golden Crop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css"  />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" /><![endif]-->
<script type="text/javascript" src="style/js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="style/js/scripts.js"></script>
<script type="text/javascript" src="scripts/swfobject/swfobject.js"></script>
<link href="table_css.css" rel="stylesheet" type="text/css">

</head>






<body>
<div id="container">
  <!-- Begin Header Wrapper -->
  <div id="page-top">
    <div id="header-wrapper">
      <!-- Begin Header -->
      <div id="header">
        <div id="logo"><a href="index.jsp"><img src="style/images/goldencrop_logo.jpg" alt="" /></a></div>
        <!-- Logo -->
        <!-- Begin Menu -->
        <div id="menu-wrapper">
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="index.jsp">Home</a></li>
			  <li><a href="login.html">Login</a></li>
			  <li><a href="services.html">Services</a></li>
              <li><a href="faqs.html">FAQs</a></li>
              <li><a href="gallery.html">Gallery</a></li>
              <li><a href="feedback.html">Feedback</a></li> 
              <li><a href="aboutus.html">About Us</a></li>
              <li><a href="contactus.html">Contact Us</a></li>
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
    <div class="content">
      <h2 style="color:Green;">Search</h2>
      <br>
      <p>
      <%
      String s1=request.getParameter("emandi1");
      String s2=request.getParameter("emandi");
      System.out.println(s1);
      System.out.println(s2);
      Connection con;
      PreparedStatement ps1,ps2;
      ResultSet rs1,rs2;
      con=Mycon.getConnection();
      ps1=con.prepareStatement("select * from VEGETABLE where SUBCATEGORY=?");
      ps1.setString(1,s2);
      rs1=ps1.executeQuery();
      
      ps2=con.prepareStatement("select * from COMMODITY where SUBCATEGORY=? and USERTYPE=?");
      ps2.setString(1,s2);
      ps2.setString(2,s1);
      rs2=ps2.executeQuery();
      rs1.next();
      %>
     
      <p>
      <font color="red"> Farmer Price=Price Per Quintal<br>
      Wholesaler Price=Price Per Quintal<br>
      Retailer Price=Price Per Kg
                      </font> 
    <table style="width: 815px; height: 190px"> 
             <tr>
             <td style="width: 341px">   
                         
               <div class="table_css" style="width: 92%" >
                <table style="width: 100%"> 
                    <tr>
                        <td style="width: 133px">
                            Actor
                        </td>
                        <td style="width: 153px">
                            Price Range
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 133px" >Mandi Price</td>
                        <td style="width: 153px"><%=rs1.getString(3)%>-<%=rs1.getString(4)%></td>
                    </tr>
                    <tr>
                        <td style="width: 133px" >Farmer Range</td>
                        <td style="width: 153px"><%=rs1.getString(5)%></td>
                    </tr>
                    <tr>
                        <td style="width: 133px" >WholeSaler Range</td>
                        <td style="width: 153px"><%=rs1.getString(6)%></td>
                    </tr>    
                      <tr>
                        <td style="width: 133px" >Retailer Range</td>
                        <td style="width: 153px"><%=rs1.getString(7)%></td>
                    </tr>     
                </table>
            </div>
            
           
        
        </td>
             
          <td>
        <br>
               
               <div class="table_css" style="width: 110%; height: 182px" >
                <table style="width: 100%" class="style2"> 
                    <tr>
                        <td style="width: 130px">
                           Actor Name
                        </td>
                        <td style="width: 166px">
                            Category
                        </td>
                     
                        <td>
                          Price
                        </td>
                    </tr>
                    <%
                    while(rs2.next())
                    	{
                    	%>
                    <tr>
                        <td style="width: 130px" ><%=rs2.getString(2)%></td>
                         <td style="width: 166px" ><%=rs2.getString(4)%></td>
                        <td><%=rs2.getString(7)%></td>
                    </tr>
                    <%
                    }
                    %>
                </table>
            </div>
            
           
       </td>
             </tr>
             </table>
       
</p>



<div class="clearfix"></div>
  <!-- Begin Footer -->
  <div id="footer-wrapper">
    <div id="footer">
      <div id="footer-content">
        <!-- Begin Copyright -->
        <div id="copyright">
          <p>Copyright Â© Team Quark Returns 2013. All Rights Reserved | <a href="privacypolicy.html">Privacy Policy</a></p>
        </div>
        <!-- End Copyright -->
        <!-- Begin Social Icons -->
        <div id="socials">
          <ul>
            
            <li><a href="https://twitter.com/TeamGoldenCrop" target="_blank"><img src="style/images/icon-twitter.png" alt="" /></a></li>
            <li><a href="http://www.linkedin.com/profile/view?id=241184443&trk=tab_pro0" target="_blank"><img src="style/images/linkedin.png" alt="" /></a></li>
            <li><a href="#" target="_blank"><img src="style/images/google+.jpg" alt="" /></a></li>
            <li><a href="http://www.facebook.com/pages/Golden-Crop/158136257679840" target="_blank"><img src="style/images/icon-facebook.png" alt="" /></a></li>
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