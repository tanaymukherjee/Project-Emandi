<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*" session="false"%>
<%

forgotpassword f1=new forgotpassword();
try{
if(!f1.forgotpassword1(request.getParameter("username")))
{
	response.sendRedirect("index.jsp?msg=Please Check Your Emailid" );	
	return; 
	
}
response.sendRedirect("index.jsp?msg=Your Password Is sent On Your Emailid....");


return;

}
catch (Exception e)
{
//out.println("error occured while updating " + e.getMessage());
	response.sendRedirect("index.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
} 

%>