<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*" session="false"%>

<%!
ResultSet rs;
Statement st,st1;
Connection con;
int rowEnd,rowStart;
int pageNum,maxRecords,totalPages,next,previous;
 %>
<%
rs=null;
st=null;
con=null;
String strPageNum=request.getParameter("pageno");
pageNum=1;
next=2;
if(strPageNum!=null)
{
    pageNum=Integer.parseInt(request.getParameter("pageno"));
    next=pageNum+1;
    previous=pageNum-1;
}

int rowEnd=pageNum*2;//*maxRowsPerPage;
int rowStart=(rowEnd-2)+1;
con=Mycon.getConnection();
st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
st1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String sql="Select * from (SELECT name,emailid,date,message,ROW_NUMBER() OVER () AS RN FROM FEEDBACK where STATUS='Post') AS col where RN between "+rowStart+" and "+rowEnd+" order by RN desc" ;
rs=st.executeQuery(sql);
ResultSet rs1=st1.executeQuery("SELECT count( * ) as total_record FROM FEEDBACK where STATUS='Post' ");
rs1.next();
maxRecords=rs1.getInt(1);
totalPages=maxRecords/2;
int remain = maxRecords % 2;
if(remain!=0) totalPages++;
%>


<!DOCTYPE HTML>
<html lang="en-US">

<head>
<title>Welcome to Golden Crop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="profile.css"  media="all"/>
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" /><![endif]-->
<script type="text/javascript" src="style/js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="style/js/scripts.js"></script>
<script type="text/javascript" src="scripts/swfobject/swfobject.js"></script>


</head>






<body>
<div id="container">
  <!-- Begin Header Wrapper -->
  <div id="page-top">
    <div id="header-wrapper">
      <!-- Begin Header -->
      <div id="header">
        <div id="logo"><a href="index.html"><img src="style/images/goldencrop_logo.jpg" alt="" /></a></div>
        <!-- Logo -->
        <!-- Begin Menu -->
        <div id="menu-wrapper">
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="index.jsp" >Home</a></li>
			  <li><a href="login.html">Login</a></li>
			  <li><a href="services.html" class="selected">Services</a></li>
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
    <div class="tab-wrapper">
      <ul id="tab-menu">
        
        <li class="selected"><a href="services.html">Invite Your Friends</a></li>    
   	 	<li><a href="testimonials.jsp">Testimonials</a></li>
        <li><a href="othersites.html">Other Sites</a></li>
    	      </ul>
      
      
      <div class="tab-content">
        <div class="tab show">
          <h2 style="color:Green;">Testimonials</h2>
          <br>
          <h3 style="color:Red;">What people said; the way they said.</style></h3>
<br>
<p>Here you can read some of the experiences of peole who were directly or indirectly benefited by this initiative by goldencrop.com in accordance to Team - Quark Returns.</p>
<br>   
<p>The way they post their story, the same we share with you. We don't believe in moulding their words or their experiences. Read it and understand. What people said; the way they said.</p>

<hr>
        
    <%
                   
                while(rs.next())
                    {
                         
                %>
	<TR>
        <TD><strong><font color="orange">Full Name: </font></strong><%=rs.getString(1)%></TD>
	</tr>
        <tr>
<br>
        <TD> <strong><font color="orange">Emailid: </font></strong><%=rs.getString(2)%></TD></tr>

	<br>
   <tr>
       <TD><strong><font color="orange">Date:</strong></font>
	<%=rs.getString(3)%></TD></tr>
   
    <br>
    <tr><p><TD><strong> <font color="orange">Story:</font></strong><%=rs.getString(4)%></TD></p></tr>

	
    



<HR>

<br>
                              <%
                        }
              
            rs.close();           
            rs=null;
%>
 </table></td> 
 
 <div class="pagination" align="center">
             <%
                        if(previous==0)
                            {
             %>
          &nbsp;&nbsp;&nbsp;&nbsp;<span class="disabled">Prev</span>&nbsp;&nbsp;&nbsp;&nbsp;
          <%
          }
            else
                {
          %>
           <a href="testimonials.jsp?pageno=<%=previous%>">Prev</a>
       <%
}
                  for(int i=pageNum;i<pageNum+3;i++)
           {
                        if(i<=totalPages)
                       {
                               if(i==pageNum)
                               {
        %>
                                                          &nbsp;&nbsp;&nbsp;&nbsp; <span class="current"><%=pageNum%></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <%                 }
                                else
                                {
        %>               
                                 <a href="testimonials.jsp?pageno=<%=i%>"><%=i%></a>
       <%
                                }
                        }
                  }
                        if(next>=totalPages)
                            {
                            
      %>                         &nbsp;&nbsp;&nbsp;&nbsp;<span class="disabled">Next</span>&nbsp;&nbsp;&nbsp;&nbsp;
     <%                 }
                            else
                            {
     %>                             <a href="testimonials.jsp?pageno=<%=next%>">Next</a>      
    <%
                             }
    %>     
        
        
   
   
   
   
   
   
   
   
   
   
   
   
   
   </div>
   </div>
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


