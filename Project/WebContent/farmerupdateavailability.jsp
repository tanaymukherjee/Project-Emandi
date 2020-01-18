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
String name=a.getname();
String user=a.getuser();
String delete=request.getParameter("delete");
String d="null";
try
{
if(delete.equals("null"))
{
	d="1";
}
else {
	d=delete;
}
}
catch(Exception e)
{
	e.printStackTrace();
	}
//System.out.println(d);
Commodity cm=new Commodity(emailid,name,user,request.getParameter("subcategory"),request.getParameter("quantity"),request.getParameter("price"),d);
try{
if(cm.updatecommodity())
{
	response.sendRedirect("farmer_home.jsp?msg=Your Avaibility Is Updated Successfully...");
}
}
catch(Exception e)
{
	//out.println("error occured while updating " + e.getMessage());
	response.sendRedirect("farmer_home.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
}


%>