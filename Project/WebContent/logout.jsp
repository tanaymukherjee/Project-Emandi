<%@page import="java.awt.Window"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*"%>
<%
Authorized a=new Authorized(request, response);
if(!a.isValidSession())
{
    response.sendRedirect("index.jsp");
  
    return;
}

a.logout();
%>