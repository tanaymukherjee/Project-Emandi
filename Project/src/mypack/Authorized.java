package mypack;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Authorized 
{
    HttpServletRequest request;
    HttpServletResponse response;
    HttpSession session=null;

   
    public Authorized()
    {}
    
    public Authorized(HttpServletRequest req,HttpServletResponse res)
    {
        request=req;
        response=res;
        session=request.getSession(false);
    }
    
    
    public String getemailid() throws Exception
    {
        return session.getAttribute("level").toString();
    }
    
    public String getuser() throws Exception
    {
        return session.getAttribute("user").toString();
    }
    
    public String getname() throws Exception
    {
        return session.getAttribute("name").toString();
    }
    
    public String getmobno() throws Exception
    {
        return session.getAttribute("mobno").toString();
    }
    
    public boolean isValidSession()
    {
        if(session!=null)
            return true;
        return false;
    }

public void logout() throws IOException
{
	session.invalidate();
    
    session=null;
    
    response.sendRedirect("index.jsp");
    
}

  

}
