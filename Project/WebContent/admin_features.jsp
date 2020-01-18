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
<link href="table_css.css" rel="stylesheet" type="text/css">


<script src="tooltip1/jquery.js" type="text/javascript"></script>
<script src=" tooltip1/main.js" type="text/javascript"></script>


</head>
<body>
<div id="container">
  <!-- Begin Header Wrapper -->
  <div id="page-top">
    <div id="header-wrapper">
      <!-- Begin Header -->
      <div id="header">
        <div id="logo"><a href="admin_home.jsp"><img src="style/images/goldencrop_logo.jpg" alt="" /></a></div>
        <!-- Logo -->
        <!-- Begin Menu -->
        <div id="menu-wrapper">
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="admin_home.jsp">Home</a></li>
              <li><a href="admin_edit.jsp">Edit</a></li>
              <li><a href="admin_mail.jsp">Mail Box</a></li>
              <li><a href="admin_update.jsp">Update</a></li>
              <li><a href="admin_features.jsp" class="selected">Features</a></li>
              
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
        <a href="admin_home.jsp" data-value="web"><font color="red">Welcome <%=a.getname()%> (Admin)</font><span></span></a>
        </li>
      </ul>
  
  
  
    <div class="tab-wrapper">
      <ul id="tab-menu">
    <li class="selected">Newsletter </li>    
    <li> View Feedback</li>
    <li>View Complaints</li>
    <li>View Contact Us</li>
    <li>View Opinion Poll</li>
      </ul>
      <div class="tab-content">
        <div class="tab show">
          <h3 style="color:Green;">Newsletter.....</h3>
          <p>
             
        <div align="left" style="background-color:#E0E0E0">   
                        
            
                 
                   
                   
            <p>&nbsp;</p>       
          <form name="newsletter" method="post" action="newsletter.jsp" style="width: 516px; height: 319px">
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
                   
                 
            
          </div>
          </p>
        </div>
      
      
       <div class="tab">
          <h3 style="color:Green;"> View Feedback.....</h3>
          <p>  
          <div class="table_css" >
                 <table >
                    <tr>
                        <td>
                            Name
      
                        </td>
                        <td>
                             Date
                                   
                        </td>
                        <td>
                            Message        
                             
                        </td>
                        <td>
                            Post/Delete
                                   
                        </td>
                    </tr>
  
  <% 
  
Feedback a2=new Feedback();
ResultSet rs1=a2.getallfeedack();


while(rs1.next())
{
       
       a2 = new Feedback(rs1.getString(1),rs1.getString(2),rs1.getString(3),rs1.getString(5));        
 
%>         
	
            
                    <tr>
                    <form action="updatefeedback.jsp" method="post" name="inbox">
                        <td><INPUT type=text name="name" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a2.getName()%>" size="7px"></td>
                        <td><INPUT type=text name="date" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a2.getDate()%>" size="15px"></td>
                        <td><class="tooltip" title="<%=a2.getMessage()%>"><INPUT type=text name="message" readonly="readonly" style="background:none;border:0;color:#ff0000" VALUE="<%=a2.getMessage()%>" size="15px"></td>
                        <td><select name="status" id="status" onchange="submit()">
                        <option>SELECT</option>
                        <option value="Post">POST</option>
                        <option value="Delete">DELETE</option>
                        </select></td>
                     </form> 
                    </tr>
                   
                 <%} %>                                
                </table>
            </div>
              
           </p>
          
        </div>
        
        
        
        
        
        
        
        
     
        
        
        
       
      <div class="tab">
          <h3 style="color:Green;">View Complaints.....</h3>
          <p>  
          <div class="table_css" >
                 <table >
                    <tr>
                        <td>
                            Complaint Id
      
                        </td>
                        <td>
                             Name
                                   
                        </td>
                        <td>
                            User        
                             
                        </td>
                        <td>
                            Subject
                                   
                        </td>
                        <td>
                            Reply
                                   
                        </td>
 						 <td>
                            
                                   
                        </td>	                   
                    </tr>
  
  <% 
  //Connection con=Mycon.getConnection();

Complaint a1=new Complaint();
ResultSet rs=a1.getallcomplaint();
//DatabaseMetaData dbmd=con.getMetaData();
//boolean db=dbmd.deletesAreDetected(rs.TYPE_SCROLL_SENSITIVE);
//rs.afterLast();

while(rs.next())
{
       
       a1 = new Complaint(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));        
 
%>         
	
            
                    <tr>
                    <form action="admincomplaintreplymail.jsp" method="post" name="inbox">
 							                   
                        <td><INPUT type=text name="cid" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a1.getComplaintid()%>" size="5px"></td>
                        <td><INPUT type=text name="name" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a1.getName()%>" size="11px"></td>
                        <td><INPUT type=text name="user" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a1.getUser()%>" size="7px"></td>
                        <td><class="tooltip" title="<%=a1.getMessage()%>"><INPUT type=text name="subject" readonly="readonly" style="background:none;border:0;color:#ff0000" VALUE="<%=a1.getSubject()%>" size="7px"></td>
 						<td><INPUT type="submit" name="reply" readonly="readonly" style="background:none;border:0;color:#0000FF" VALUE="Reply"></td>	                   
                     <td><input type="hidden" name="emailid" value="<%=a1.getEmailid()%>" size="0px">
                     
                     </form> 
                    </tr>
                   
                 <%} %>                                
                </table>
            </div>
              
           </p>
          
        </div>

             
      <div class="tab">
          <h3 style="color:Green;"> View Contact Us.....</h3>
          <p>  
          <div align="center" style="background-color:#E0E0E0">                 
          <div class="table_css" >
                <table >
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                            Emailid
                        </td>
                        <td>
                            Message
                        </td>
                        <td>
                            Date
                        </td>
                        <td>
                           Reply
                        </td>
                    </tr>
                    
  <% 
  //Connection con=Mycon.getConnection();
 
Contactus c11=new Contactus();
ResultSet rs2=c11.showcontact();
//DatabaseMetaData dbmd=con.getMetaData();
//boolean db=dbmd.deletesAreDetected(rs.TYPE_SCROLL_SENSITIVE);
//rs.afterLast();

while(rs2.next())
{
       
       c11 = new Contactus(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getString(4));        
 
%>       



<tr>
                    <form action="adminreplycoontactus.jsp" method="post" name="inbox">
                       
                       <td><INPUT type=text name="name" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=c11.getName()%>" size="5px"></td>
                        <td><INPUT type=text name="emailid" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=c11.getEmailid()%>" size="15px"></td>
                        <td><class="tooltip" title="<%=c11.getMessage()%>"><INPUT type=text name="message" readonly="readonly" style="background:none;border:0;color:#ff0000" VALUE="<%=c11.getMessage()%>" size="7px"></td>
                        <td><INPUT type=text name="date" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=c11.getDate()%>"></td>
                        <td><INPUT type="submit" name="reply" readonly="readonly" style="background:none;border:0;color:#0000FF" VALUE="Reply"></td>
                       
                       
                        
                    </form>
                    </tr>
                   
   <%}%>                   
                                    
                                    
                   
                          
                </table>
            </div>
       </div>
              
           </p>
          
        </div>
        
     <div class="tab">
          <h3 style="color:Green;"> View Opinion Poll.....</h3>
          <p>  
          <div align="left" style="background-color:#E0E0E0">   
             <p>&nbsp;</p>
             content goes here....
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
          <p>Copyright © Team Quark Returns 2013. All Rights Reserved | <a href="privacypolicy.html">Privacy Policy</a></p>
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