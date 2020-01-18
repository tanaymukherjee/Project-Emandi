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

Mail m=new Mail();
m.setSendfrom(request.getParameter("sentfrom"));
m.setUsertype(request.getParameter("status"));
m.setSubject(request.getParameter("subject"));
m.setDdate(request.getParameter("date"));


try 
{
	if(m.deletemessage())
{
		response.sendRedirect("wholesaler_home.jsp?msg=Your Message Has Been Deleted Successfully...");
}
else
{
	response.sendRedirect("wholesaler_home.jsp?msg=There Some Error Is Occured During Deletion of This Message....  ");
	}
}
catch(Exception e)
{
	//out.println("error occured while updating " + e.getMessage());
	response.sendRedirect("wholesaler_home.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
	}
%>