package mypack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Contactus {
	
	private String name,emailid,message,date;
	private PreparedStatement ps;
	private Connection con;
	private ResultSet rs;
	
	
	public Contactus() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	
	
	
	public Contactus(String name, String emailid, String message, String date) {
		super();
		this.name = name;
		this.emailid = emailid;
		this.message = message;
		this.date = date;
	}







	public Contactus(String name,String emailid, String message) {
		super();
		this.name = name;
		this.message = message;
		this.emailid=emailid;
	}




	public String getDate() {
		return date;
	}
	public String getMessage() {
		return message;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	
	
	
	
	
	public String getEmailid() {
		return emailid;
	}




	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}




	public boolean insertContactus() throws IOException,SQLException
	{
		
		Calendar currentDate = Calendar.getInstance();
		  SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
		  String dateNow = formatter.format(currentDate.getTime());
		 date=dateNow;
		
		
		
		con=Mycon.getConnection();
		ps=con.prepareStatement("insert into CONTACTUS values(?,?,?,?,?)");
		ps.setString(1,this.name);
		ps.setString(2,emailid);
		ps.setString(3, message);
		ps.setString(4,date);
		ps.setString(5,"no");
		int i=ps.executeUpdate();
		if(i>0)
		{
			return true;
		}
			return false;
	}
	
	public ResultSet showcontact()throws IOException,SQLException
	{
		con=Mycon.getConnection();
		ps=con.prepareStatement("Select * from (select NAME,EMAILID,MESSAGE,DATE,STATUS,ROW_NUMBER() OVER () AS RN FROM CONTACTUS where STATUS=?) AS col order by RN desc");
		ps.setString(1,"no");
		rs=ps.executeQuery();
		if(rs==null)return null;
		return rs;
	}
	
	
	public boolean updatecontactus() throws Exception
    {
		
//		System.out.println(date);
//		System.out.println(message);
//		System.out.println(name);
//		System.out.println(status);
        con=Mycon.getConnection();
        ps=con.prepareStatement("update CONTACTUS  set STATUS=? where EMAILID=? and DATE=?");
        ps.setString(3,this.date);
        ps.setString(2,emailid);
        ps.setString(1,"yes");
        int i=ps.executeUpdate();
        System.out.println(i);
        if(i>0) return true;
        return false;
    }
	
}
