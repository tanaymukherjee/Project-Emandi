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
        <div id="logo"><a href="retailer_home.jsp"><img src="style/images/goldencrop_logo.jpg" alt="" /></a></div>
        <!-- Logo -->
        <!-- Begin Menu -->
        <div id="menu-wrapper">
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="retailer_home.jsp">Home</a></li>
              <li><a href="retailer_edit.jsp" class="selected">Edit</a></li>
              <li><a href="retailer_mail.jsp">Mail Box</a></li>
              <li><a href="retailer_features.jsp">Features</a></li>
              
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
        <a href="retailer_home.jsp" data-value="web"><font color="red">Welcome <%=a.getname()%> (Retailer)</font><span></span></a>
        </li>
      </ul>
  
  
    <div class="tab-wrapper">
      <ul id="tab-menu">
    <li class="selected">Change Password</li>    
    <li>Edit Profile</li>
    <li>Update Availability</li>
      </ul>
      <div class="tab-content">
        <div class="tab show">
          <h3 style="color:Green;">Change Password</h3>
          <p>
               
        
        
        <div align="center" style="background-color:#E0E0E0">   
        <p>&nbsp;</p>
        <form name="retailer_change_pass" method="post" action="retailerchangepassword.jsp" style="width: 516px; height: 319px">
          
           <table width="471" height="283" border="1" align="center" cellpadding="1" cellspacing="1" style="height: 282px; width: 555px">
  <tr>
    <td width="212" style="width: 159px">Old Password</td>
    <td width="322">
	<input name="oldpass" class="required inpt" type="password" style="width: 195px; height: 28px"></td>
  </tr>
  <tr>
    <td style="width: 159px">New Password</td>
    <td>
	<input name="newpass" type="password" style="width: 195px; height: 28px"></td>
  </tr>
  <tr>
    <td style="width: 159px">Retype New Pasaword</td>
    <td>
	<input name="renewpass" type="password" style="width:195px; height: 28px"></td>
  </tr>
  <tr>
    <td colspan="2">
	<input name="changepass" class="button gray" type="submit" value="Change Password" style="width: 139px"></a></td>
    <td width="3">&nbsp;</td>
  </tr>
</table>

      
      </form>
      </div>
          </p>
        </div>
        
  <%       
String emailid=a.getemailid();
Retailer a1=new Retailer(emailid);
ResultSet rs=a1.getretailerprofile();

if(rs.next())
{
       
       a1 = new Retailer(emailid,rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11));        
 
%>       
        
        <div class="tab">
          <h3 style="color:Green;">Edit Profile</h3>
          <p>  <div align="center" style="background-color:#E0E0E0">
          <p></p> 
          <form name="form1" action="updateretailerprofile.jsp" method="post" style="width: 516px; height: 319px">
      
      <table width="471" height="283" border="1" align="center" cellpadding="1" cellspacing="1" style="height: 282px; width: 555px">
      <tr>
      	<td><b>WholeSaler id</b>&nbsp;&nbsp;&nbsp;&nbsp;<b></td>
      	<td><INPUT type=text name="farmerid" readonly="readonly" VALUE="<%=a1.getEmailid()%>"></td>
      </tr>
      <tr><td><b>WholeSaler Name</b>&nbsp;&nbsp;&nbsp;&nbsp;<b></td>
      	<td><INPUT type=text name="farmername" readonly="readonly" VALUE="<%=a1.getName()%>"></td>
      	</tr>
      <tr><td><b>Mobile No.</b>&nbsp;&nbsp;&nbsp;&nbsp;<b></td>
      	<td><INPUT type=text name="mobno" readonly="readonly" VALUE="<%=a1.getMobno()%>"></td>
      	</tr>
      <tr><td><b>Landline No&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
      	<td><INPUT type=text name="llno"  VALUE="<%=a1.getLlno()%>"></td>
      	</tr>
      <tr><td><b>Address&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
      	<td><INPUT type=text name="address"  VALUE="<%=a1.getAddress()%>"></td>
      	</tr>
      <tr><td><b>State&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
      	<td><INPUT type=text name="state"  VALUE="<%=a1.getState()%>"></td>
      	</tr>
      <tr><td><b>City&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
      	<td><INPUT type=text name="city"  VALUE="<%=a1.getCity()%>"></td>
      	</tr>
      	<tr><td><b>Date Of Birth&nbsp;&nbsp;&nbsp;</b></td>
      	<td><INPUT type=text name="dob" readonly="readonly" VALUE="<%=a1.getDob()%>"></td>
      	</tr>
      	<tr><td><b>Gender&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
      	<td><INPUT type=text name="gender"  readonly="readonly" VALUE="<%=a1.getGender()%>"></td>
      	</tr>
      	<tr><td><b>Pincode&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
      	<td><INPUT type=text name="pincode"  VALUE="<%=a1.getPincode()%>"></td>
      	</tr>
      	<tr><td><b>Registration No.&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
      	<td><INPUT type=text name="regno" readonly="readonly" VALUE="<%=a1.getRegno()%>"></td>
      	</tr>
      	<tr>
      	<td colspan="2" align="center"><br /><br /><input type="submit" name="submit" id="submit" value="UPDATE" /> </td>
      	</tr>
      	     </table> <br></br>	</form>

  <%
  }
  %>  </p>
          
        </div>
        
      </div>
      
      
      
      <div class="tab">
          <h3 style="color:Green;">View/Update Availability</h3>
          <p> 
        <font color="red"> Price=Price Per Quintal<br>
           Quantity In Kg</font>   
        <div class="table_css" >
                <table >
                    <tr>
 							 <td>
                        Delete
                        </td>                   
                        <td>
                            Category
                        </td>
                        <td>
                            Quantity
                        </td>
                        <td>
                            Price
                        </td>
                        <td>
                            Update
                        </td>
                       
                        
                    </tr>
  <% 
  //Connection con=Mycon.getConnection();
 String emailid1=a.getemailid();
Commodity c1=new Commodity();
c1.setEmailid(emailid1);
ResultSet rs1=c1.getitselfcommodity();

//DatabaseMetaData dbmd=con.getMetaData();
//boolean db=dbmd.deletesAreDetected(rs.TYPE_SCROLL_SENSITIVE);
//rs.afterLast();

while(rs1.next())
{
       
       c1 = new Commodity(rs1.getString(1),rs1.getString(2),rs1.getString(3),rs1.getString(5),rs1.getString(6),rs1.getString(7));        
 
%>       


<form action="retailerupdateavailability.jsp" method="post" name="myform" onsubmit="return onsubmitform();">
   <tr>
                    
                                         
                        <td><input type="checkbox" name="delete" value="delete" /></td>
                        <td><INPUT type=text name="subcategory" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=c1.getSubcategory()%>" size="5px"></td>
                        <td><INPUT type=text name="quantity"  style="background:none;border:0;color:" VALUE="<%=c1.getQuantity()%>" size="5px"></td>
                        <td><INPUT type=text name="price"  style="background:none;border:0;color:" VALUE="<%=c1.getPrice()%>" size="5px" ></td>
                        <td><input type="submit" name="Update" value="Update" style="background:none;border:0;color:#ff0000"  size="5px" ></td>
                        
                        
                    
                    </tr></form>
                   
   <%}%>        
                </table>
            </div>
       </p>
          
      </div>
      
      </div>
      
      
      
      
    </div>
    <div class="clear"></div>
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