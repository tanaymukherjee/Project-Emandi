package mypack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

public class Newsletter {
	
	private String subject,message,date;
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection con;
	
	public Newsletter() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	public Newsletter(String subject, String message) {
		super();
		this.subject = subject;
		this.message = message;
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
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSubject() {
		return subject;
	}
	
	public boolean insertnewsletter() throws IOException,SQLException
	{
		
		Calendar currentDate = Calendar.getInstance();
		  SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
		  String dateNow = formatter.format(currentDate.getTime());
		 date=dateNow;
		
		
		
		con=Mycon.getConnection();
		ps=con.prepareStatement("insert into NEWSLETTERMESSAGE values(?,?,?)");
		ps.setString(1,this.subject);
		ps.setString(2, message);
		ps.setString(3,date);
		int i=ps.executeUpdate();
		if(i>0)
		{
			ps=con.prepareStatement("select * from NEWSLETTER");
			rs=ps.executeQuery();
			while(rs.next())
			{
				try {
					Mymail.GmailSend(rs.getString(1),subject,message);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			//return true;
			}
			return true;
		}
			return false;
	}
	
}
