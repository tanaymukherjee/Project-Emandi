
<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*"%>
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

String status=request.getParameter("updates");


registration_continue rc=new registration_continue(request.getParameter("username1"),
		request.getParameter("email1"),
		request.getParameter("password1"),
		request.getParameter("gender1"),
		request.getParameter("SelectedDate"),
		request.getParameter("phone"),
		request.getParameter("llno"),
		request.getParameter("cardnumber"),
		request.getParameter("state1"),
		request.getParameter("city1"),
		request.getParameter("namecard"),
		request.getParameter("newsletter"),
		request.getParameter("updates"),
		request.getParameter("tagname"));

try{	
 if(rc.updateregistration())
 {
	 
	 	if(status.equals("Admin")) {
         response.sendRedirect("admin_home.jsp");
         session.setAttribute("user", "Admin");
         
         return;
					 }
	 else if(status.equals("Farmer")) {
         response.sendRedirect("farmer_home.jsp");
         session.setAttribute("user", "Farmer");
          
         return;
                    }
 
	 else if(status.equals("Wholesaler")) {
         response.sendRedirect("wholesaler_home.jsp");
         session.setAttribute("user", "Wholesaler");
             
         return;
             } 

	 else if(status.equals("Civilian")) {
		response.sendRedirect("civilian_home.jsp");
		session.setAttribute("user", "Civilian");
			
			return;
			} 
	 else if(status.equals("Computer Administrator")) {
		response.sendRedirect("Computeradministrator_home.jsp");
		session.setAttribute("user", "Computer Administrator");
	
		return;
			}
	
	 else if(status.equals("Retailer")) {
		response.sendRedirect("retailer_home.jsp");
		session.setAttribute("user", "Retailer");
		
		return;
			}
 
 }
 else
 {
	 a.logout();
	 response.sendRedirect("index.jsp");
	 return;
 }
}
catch(Exception e)
{
	//out.println("error occured while saving " + e.getMessage());
	 response.sendRedirect("index.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
	
    return;
}


%>