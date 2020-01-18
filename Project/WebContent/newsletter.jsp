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


Newsletter a1=new Newsletter(request.getParameter("subject"),request.getParameter("message"));

try{
    if(a1.insertnewsletter())
    {
    	response.sendRedirect("admin_home.jsp?msg=Newsletter Is Sent Successfully...");
   
    return;
    }      
   }  
 catch (Exception e)
         {
    // out.println("error occured while updating " + e.getMessage());
	 response.sendRedirect("admin_home.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
         }     


%>