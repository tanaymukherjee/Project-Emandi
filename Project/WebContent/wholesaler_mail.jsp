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
<script src="SpryAssets/SpryAccordion.js" type="text/javascript"></script>
<style type="text/css">
.auto-style1 {
	margin-left: 40px;
}
</style>
<link href="SpryAssets/SpryAccordion.css" rel="stylesheet" type="text/css">
<link href="table_css.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="container">
  <!-- Begin Header Wrapper -->
  <div id="page-top">
    <div id="header-wrapper">
      <!-- Begin Header -->
      <div id="header">
        <div id="logo"><a href="wholesaler_home.jsp"><img src="style/images/goldencrop_logo.jpg" alt="" /></a></div>
        <!-- Logo -->
        <!-- Begin Menu -->
        <div id="menu-wrapper">
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="wholesaler_home.jsp">Home</a></li>
              <li><a href="wholesaler_edit.jsp" >Edit</a></li>
              <li><a href="wholesaler_mail.jsp" class="selected">Mail Box</a></li>
              <li><a href="wholesaler_features.jsp">Features</a></li>
              
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
        <a href="wholesaler_home.jsp" data-value="web"><font color="red">Welcome <%=a.getname()%> (Wholesaler)</font><span></span></a>
        </li>
      </ul>
  
  
  
  
    <div class="tab-wrapper">
      <ul id="tab-menu">
    <li class="selected">Inbox</li>    
    <li>Compose Message</li>
    <li>Delete Messages</li>
    <li>Sent Messages</li>
   
      </ul>
      <div class="tab-content">
        <div class="tab show">
          <h3 style="color:Green;">Inbox</h3>
          <p>          
         
                    
               <div class="table_css" >
                <table >
                    <tr>
                        <td>
                            Sent From 
      
                        </td>
                        <td>
                             Status
                                   
                        </td>
                        <td>
                            Subject        
                             
                        </td>
                        <td>
                            Date
                                   
                        </td>
                    </tr>
                   
  <% 
  //Connection con=Mycon.getConnection();
 String emailid=a.getemailid();
Mail a1=new Mail(emailid);
ResultSet rs=a1.getmail();
//DatabaseMetaData dbmd=con.getMetaData();
//boolean db=dbmd.deletesAreDetected(rs.TYPE_SCROLL_SENSITIVE);
//rs.afterLast();

while(rs.next())
{
       
       a1 = new Mail(rs.getString(2),rs.getString(3),rs.getString(6),rs.getString(7));        
 
%>       



<tr>
                    <form action="wholesalermessageshow.jsp" method="post" name="inbox">
                        <td><INPUT type=text name="sentfrom" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a1.getSendfrom()%>" size="15px"></td>
                        <td><INPUT type=text name="status" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a1.getUsertype()%>" size="10px"></td>
                        <%if(rs.getString(8).equals("no")) 
                        {
                        %>
                        <td><input type="submit" name="subject" value="<%=a1.getSubject()%>" style="background:none;border:0;color:#FF0000"  size="11px"/></td>
                        <%
                        }
                        else
                        {
                        %>
                        <td><input type="submit" name="subject" value="<%=a1.getSubject()%>" style="background:none;border:0;color:#000000"  size="11px"/></td>
                        <%
                        }
                        %>
                        <td><INPUT type=text name="date" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a1.getDdate()%>"  size="11px"></td>
                    </form>
                    </tr>
                   
                 <%}%>                      
                   
                   
                               
                </table>
            </div>
          </p>
        </div>
        <div class="tab">
          <h3 style="color:Green;">Contact Wholesaler,Farmers and Retailers</h3>
          <p>  
          <div align="left" style="background-color:#E0E0E0">   
                        
            <div id="Accordion1" class="Accordion" tabindex="0">
                 <div class="AccordionPanel">
                   <div class="AccordionPanelTab" style="height:30px"><strong><h4>Contact Wholesaler,Farmers and Retailers</h4></strong></div>
                   <div class="AccordionPanelContent" style="height:400px">
            <p>&nbsp;</p>       
          <form name="contact_farmer" method="post" action="mail1.jsp" style="width: 516px; height: 319px">
          <table border="1" cellpadding="1" cellspacing="1" class="auto-style1" style="width: 460px; height: 321px">
  <tr>
    <td>To:</td>
  </tr>
  <tr>
    <td><input name="sendto" type="text" style="width: 195px; height: 25px;"></td>
  </tr>
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
                 </div>
                 
            </div>
          </div>
              
           </p>
          
        </div>
         
        <div class="tab">
          <h3 style="color:Green;">Delete Messages</h3>
          <p>  
          <div align="left" style="background-color:#E0E0E0">   
             
               
               
               <div class="table_css" >
                <table >
                    <tr>
                        <td>
                            Sent From 
      
                        </td>
                        <td>
                             Status
                                   
                        </td>
                        <td>
                            Subject        
                             
                        </td>
                        <td>
                            Date
                                   
                        </td>
                        <td>
                            Restore
                                   
                        </td>
                    </tr>
                    
   <%     
String emailid3=a.getemailid();
Mail a3=new Mail(emailid3);
ResultSet rs3=a3.getdeletemail();
//rs3.afterLast();
while(rs3.next())
{
       
       a3 = new Mail(rs3.getString(2),rs3.getString(3),rs3.getString(6),rs3.getString(7));        
 
%>          
						<form action="wholesalerrestoredeletemail.jsp" method="post" name="delete_messages">
						<tr>
                        <td><INPUT type=text name="sentfrom" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a3.getSendfrom()%>" size="15px"></td>
                        <td><INPUT type=text name="status" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a3.getUsertype()%>" size="10px"></td>
                        <td><input type="text" name="subject" value="<%=a3.getSubject()%>" style="background:none;border:0;color:#ff0000"  size="11px"/></td>
                       
                        <td><INPUT type=text name="date" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a3.getDdate()%>" size="10px"></td>
                        <td><input type="submit" name="restore" value="Restore" style="background:none;border:0;color:#ff0000"  size="11px"/></td>
                    </tr></form>
                    
<%
}
%>
			
			</table>
            </div>
            
           
        </form>
             
          </div>
              
           </p>
          
        </div>
        
        <div class="tab">
          <h3 style="color:Green;">Sent Message</h3>
          <p>  
          <div class="table_css" >
               
                <table>
                    <tr>
                        <td style="width:60px">
                            Sent To
                        </td>
                        <td style="width:60px">
                             Status
                        </td>
                        <td style="width:130px">
                            Subject
                        </td>
                        <td style="width:130px">
                            Date
                        </td>
                    </tr>
                    
                    
   <%     

String emailid1=a.getemailid();
Mail a2=new Mail(emailid1);
ResultSet rs1=a2.getsendmail();
//rs1.afterLast();
while(rs1.next())
{
       
       a2 = new Mail(rs1.getString(1),rs1.getString(3),rs1.getString(6),rs1.getString(7));        

%>     


<tr>
                    <form action="" method="post" name="inbox">
                        <td><INPUT type=text name="sentfrom" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a2.getSendfrom()%>" size="15px"></td>
                        <td><INPUT type=text name="status" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a2.getUsertype()%>"  size="11px"></td>
                        <td><input type="submit" name="subject" value="<%=a2.getSubject()%>" style="background:none;border:0;color:#ff0000"  size="11px"/></td>
                        <td><INPUT type=text name="date" readonly="readonly" style="background:none;border:0;color:" VALUE="<%=a2.getDdate()%>"  size="11px"></td>
                   </form>
                    </tr>
       <%
}
%>                                              
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
var Accordion1 = new Spry.Widget.Accordion("Accordion1");
</script>
</body>
</html>