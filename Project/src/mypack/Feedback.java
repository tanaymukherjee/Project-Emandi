package mypack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Feedback {
	
	private String name,emailid,message,status="null",date;
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection con;
	
	
	
	public Feedback() {
		// TODO Auto-generated constructor stub
	}
	
	public Feedback(String name, String emailid, String message) {
		super();
		this.name = name;
		this.emailid = emailid;
		this.message = message;
	}
	
	
	
	public Feedback(String name, String emailid, String message, String date) {
		super();
		this.name = name;
		this.emailid = emailid;
		this.message = message;
		this.date = date;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmailid() {
		return emailid;
	}



	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	
	public boolean sfeedback() throws Exception {
        
        
       
		Calendar currentDate = Calendar.getInstance();
		  SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
		  String dateNow = formatter.format(currentDate.getTime());
		 date=dateNow;
		
			con = Mycon.getConnection();
            ps = con.prepareStatement("insert into FEEDBACK values(?,?,?,?,?)");
              ps.setString(1, this.name);
              ps.setString(2, emailid);
              ps.setString(3, message);
              ps.setString(4, status);
              ps.setString(5, date);
            int i = ps.executeUpdate();
            if (i > 0) {
            	return true;
            	}
            return false;

}
	
	
	public ResultSet getallfeedack() throws Exception
	{
		
    con=Mycon.getConnection();
    ps=con.prepareStatement("Select * from (select NAME,EMAILID,MESSAGE,STATUS,DATE,ROW_NUMBER() OVER () AS RN FROM FEEDBACK where STATUS=?) AS col order by RN desc");
    ps.setString(1,"null");
    rs=ps.executeQuery();
    if(rs==null)return null;
    return rs;
    
	}

	
	public boolean updatefeedback() throws Exception
    {
		
//		System.out.println(date);
//		System.out.println(message);
//		System.out.println(name);
//		System.out.println(status);
        con=Mycon.getConnection();
        ps=con.prepareStatement("update FEEDBACK  set STATUS=? where NAME=? and MESSAGE=? and DATE=?");
        ps.setString(4,this.date);
        ps.setString(3,message);
        ps.setString(2,name);
        ps.setString(1,status);
        int i=ps.executeUpdate();
        System.out.println(i);
        if(i>0) return true;
        return false;
    }
	
	
}
