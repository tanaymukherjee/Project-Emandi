package mypack;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import java.math.BigInteger;


public class Complaint {
	
		
	  private String emailid,name,user,subject,message,complaintid;
	  private Connection con;
	  private PreparedStatement ps;
	  private ResultSet rs;
	  
	  public Complaint() {
		
	}

	  
	  
	  
	  
	
	  
	public String getEmailid() {
		return emailid;
	}







	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}







	public String getName() {
		return name;
	}







	public void setName(String name) {
		this.name = name;
	}







	public String getUser() {
		return user;
	}







	public void setUser(String user) {
		this.user = user;
	}







	public String getSubject() {
		return subject;
	}







	public void setSubject(String subject) {
		this.subject = subject;
	}







	public String getMessage() {
		return message;
	}







	public void setMessage(String message) {
		this.message = message;
	}







	public String getComplaintid() {
		return complaintid;
	}







	public void setComplaintid(String complaintid) {
		this.complaintid = complaintid;
	}







	public Complaint(String emailid, String name, String user, String subject,
			String message) {
		
		this.emailid = emailid;
		this.name = name;
		this.user = user;
		this.subject = subject;
		this.message = message;
	}







	public Complaint(String emailid, String name, String user, String subject,
			String message, String complaintid) {
		super();
		this.emailid = emailid;
		this.name = name;
		this.user = user;
		this.subject = subject;
		this.message = message;
		this.complaintid = complaintid;
	}







	public boolean insertcomplaint() throws Exception {
			
		 SecureRandom random = new SecureRandom();  
		   complaintid = new BigInteger(5, random).toString(2);
		
		con = Mycon.getConnection();
	     ps = con.prepareStatement("insert into COMPLAINT values(?,?,?,?,?,?,?)");
	     ps.setString(1, this.emailid);
	     ps.setString(2, name);
	     ps.setString(3, user);
	     ps.setString(4, subject);
	     ps.setString(5, message);
	     ps.setString(6, complaintid);
	     ps.setString(7, "no");
	     
	     int i=ps.executeUpdate();
	     if(i>0){
	    	 return true;
	     }
	     return false;
		} 
	
	
	
	public ResultSet getallcomplaint() throws Exception
	{
		
    con=Mycon.getConnection();
    ps=con.prepareStatement("Select * from (select EMAILID,NAME,USERTYPE,SUBJECT,MESSAGE,COMPLAINTID,ROW_NUMBER() OVER () AS RN FROM COMPLAINT where COMPLAINTSTATUS=?) AS col order by RN desc");
    ps.setString(1,"no");
    rs=ps.executeQuery();
    if(rs==null)return null;
    return rs;
    
	}
	
	
	
	public boolean updatecomplaint() throws Exception
    {
		String status="yes";
		System.out.println(complaintid);
		System.out.println(subject);
		System.out.println(name);
		System.out.println(user);
        con=Mycon.getConnection();
        ps=con.prepareStatement("update COMPLAINT  set COMPLAINTSTATUS=? where COMPLAINTID=? and NAME=? and USERTYPE=? and SUBJECT=?");
        ps.setString(5,this.subject);
        ps.setString(1,status);
        ps.setString(2,complaintid);
        ps.setString(3,name);
        ps.setString(4,user);
        
        int i=ps.executeUpdate();
        System.out.println(i);
        if(i>0) return true;
        return false;
    }
	
	 
}



