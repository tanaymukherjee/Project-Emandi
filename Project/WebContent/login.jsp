<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,mypack.*" %>
  
  <% 
  response.addHeader("cache-control","no-cache");
  response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance  
  response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"  
  response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
  try
        {
      String st=login.checkLogin1(request.getParameter("username1"),request.getParameter("password1"));     
      ResultSet rs=login.checkLogin();
      String name1=rs.getString(2); 
      String mobno1=rs.getString(3);
      String status=rs.getString(4);
        
      //System.out.println(name1+mobno1+status);
           if(status==null) {
        	   response.sendRedirect("index.jsp?msg=Sorry...You Entered Wrong Emailid Or Password...");
                  return;
                        }
            
           if(status.equals("usertype")) {
               response.sendRedirect("registration_continue.jsp");
               session=request.getSession(false);
               session.setAttribute("level", st);
               session.setAttribute("name", name1);
               session.setAttribute("mobno", mobno1);
               
               return;
       } 
           if(status.equals("Admin")) {
                    response.sendRedirect("admin_home.jsp");
                    session=request.getSession(false);
                    session.setAttribute("level", st);
                    session.setAttribute("name", name1);
                    session.setAttribute("mobno", mobno1);
                    session.setAttribute("user", "Admin");
                    return;
            }
            if(status.equals("Farmer")) {
                    response.sendRedirect("farmer_home.jsp");
                        session=request.getSession(false);
                        session.setAttribute("level", st);
                        session.setAttribute("name", name1);
                        session.setAttribute("mobno", mobno1);
                        session.setAttribute("user", "Farmer");
                    return;
                               }
            
            if(status.equals("Wholesaler")) {
                    response.sendRedirect("wholesaler_home.jsp");
                        session=request.getSession(false);
                        session.setAttribute("level", st);
                        session.setAttribute("name", name1);
                        session.setAttribute("mobno", mobno1);
                        session.setAttribute("user", "WholeSaler");
                    return;
                        } 
       
  			if(status.equals("Civilian")) {
      			response.sendRedirect("civilian_home.jsp");
          			session=request.getSession(false);
          			session.setAttribute("level", st);
          			session.setAttribute("name", name1);
                    session.setAttribute("mobno", mobno1);
                    session.setAttribute("user", "Civilian");
      				return;
          } 
			if(status.equals("Computer Administrator")) {
    			response.sendRedirect("Computeradministrator_home.jsp");
       			 session=request.getSession(false);
       			 session.setAttribute("level", st);
       			session.setAttribute("name", name1);
                session.setAttribute("mobno", mobno1);
                session.setAttribute("user", "Computer Administrator");
    			return;
        }
			
			if(status.equals("Retailer")) {
    			response.sendRedirect("retailer_home.jsp");
       			 session=request.getSession(false);
       			 session.setAttribute("level", st);
       			session.setAttribute("name", name1);
                session.setAttribute("mobno", mobno1);
                session.setAttribute("user", "Retailer");
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