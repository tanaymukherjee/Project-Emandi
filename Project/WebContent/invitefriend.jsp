<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*" session="false"%>
<%

invitefriend in =new invitefriend(request.getParameter("name"),request.getParameter("id"),request.getParameter("name1"),request.getParameter("id1"),request.getParameter("name2"),request.getParameter("id2"),request.getParameter("name3"),request.getParameter("id3"),request.getParameter("name4"),request.getParameter("id4"));


try{
    if(in.invitefriend1())
    {
    //JOptionPane.showMessageDialog(null,"Invitation Is Send On Your Friend Id");
    response.sendRedirect("index.jsp?msg=Your Invitation Is Send Successfully...");
    return;
    }      
   }  
 catch (Exception e)
         {
     //out.println("error occured while updating " + e.getMessage());
     
	 response.sendRedirect("index.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
         } 

%>