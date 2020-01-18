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
String user=a.getuser();
String cid=request.getParameter("cid");
String receiveremailid=request.getParameter("sendto");
Complaint c=new Complaint();
c.setComplaintid(cid);
c.setSubject(request.getParameter("subject"));
c.setName(request.getParameter("name"));
c.setUser(request.getParameter("user"));
c.setEmailid(receiveremailid);
Mail m=new Mail(receiveremailid,emailid,request.getParameter("subject"),request.getParameter("message"),user);
try{
	if(c.updatecomplaint())
	{
		
		if(m.sendmail())
		{
		response.sendRedirect("admin_home.jsp?msg=Your Message Is Send Successfully...");
		}
	}
	else
	{
		response.sendRedirect("admin_home.jsp?msg=There Is Some Error Is Occured Please Try After Some Time...");
	}
}
 catch(Exception e)
 {
	 //out.println("error occured while saving " + e.getMessage());
	 response.sendRedirect("admin_home.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
 }
 %>