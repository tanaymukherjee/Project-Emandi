
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,mypack.*" session="false"%>
<%

            UserRegistration s = new UserRegistration(request.getParameter("emailid"),
                    request.getParameter("username"),
                    request.getParameter("mobileno"));
                                        
                    
                    
                    
            try {
                if (s.suserregistration()) {
                	response.sendRedirect("index.jsp?msg=Registered Successfully.Please Go Through Login And Update Profile...");
                  	System.out.println("registration successfully");
                    return;
                }
                    else
                    {
                    	response.sendRedirect("userregistration.html");
                    	return;
                    }
                
            } catch (Exception e) {
                //out.println("error occured while saving " + e.getMessage());
            	response.sendRedirect("index.jsp?msg=There Is Some Error Is Occured please Try After Some Time....");
            }
%>