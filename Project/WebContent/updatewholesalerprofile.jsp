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

String emailid=a.getemailid();
WholeSaler a1=new WholeSaler(emailid);
a1.setLlno(request.getParameter("llno"));
a1.setAddress(request.getParameter("address"));
a1.setState(request.getParameter("state"));
a1.setCity(request.getParameter("city"));
a1.setPincode(request.getParameter("pincode"));
try{
    if(a1.updatewholesalerprofile())
    {
    	response.sendRedirect("wholesaler_home.jsp?msg=Your Profile Is Updated Successfully...");
   
    return;
    }      
   }  
 catch (Exception e)
         {
     //out.println("error occured while updating " + e.getMessage());
	 response.sendRedirect("wholesaler_home.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
         }     


%>