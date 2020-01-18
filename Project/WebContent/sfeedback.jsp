<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,mypack.*"%>
<%

            Feedback f = new Feedback(request.getParameter("name"),request.getParameter("email"),request.getParameter("message"));   
             try {
                if (f.sfeedback()) {
                	response.sendRedirect("index.jsp?msg=Your Feedback Is Posted Successfully...");
                    return;
                }
                response.sendRedirect("index.jsp?msg=There Is Some Error Is Occured....");
                return;
            } catch (Exception e) {
                out.println("error occured while saving " + e.getMessage());
            }
%>