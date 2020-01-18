<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*" session="false"%>

<%
Contactus a1=new Contactus(request.getParameter("name"),request.getParameter("emailid"),request.getParameter("message"));

try{
    if(a1.insertContactus())
    {
    	response.sendRedirect("index.jsp?msg=Your Request Is Sent Successfully To Admin....");
   
    return;
    }      
   }  
 catch (Exception e)
         {
     //out.println("error occured while updating " + e.getMessage());
	 response.sendRedirect("index.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
         }     


%>