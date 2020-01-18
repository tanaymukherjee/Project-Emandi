package mypack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Mail {
	
	private String readstatus,sendto,sendfrom,subject,message,status="no",ddate,usertype;
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection con;

	public Mail()
	{
		
	}

	
	
	
	public Mail(String sendfrom, String subject, String ddate, String usertype) {
		super();
		this.sendfrom = sendfrom;
		this.subject = subject;
		this.ddate = ddate;
		this.usertype = usertype;
	}




	public Mail(String sendto, String sendfrom, String subject, String message,
			String usertype) {
		
		this.sendto = sendto;
		this.sendfrom = sendfrom;
		this.subject = subject;
		this.message = message;
		this.usertype = usertype;
	}

	public void inbox(String sendfrom, String subject, String message,
			String ddate,String usertype)
	{
		this.ddate = ddate;
		this.sendfrom = sendfrom;
		this.subject = subject;
		this.message = message;
		this.usertype = usertype;
	}
	
	
	public Mail(String sendto) {
		this.sendto = sendto;
	}

	public String getSendto() {
		return sendto;
	}

	public void setSendto(String sendto) {
		this.sendto = sendto;
	}

	public String getSendfrom() {
		return sendfrom;
	}

	public void setSendfrom(String sendfrom) {
		this.sendfrom = sendfrom;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDdate() {
		return ddate;
	}

	public void setDdate(String ddate) {
		this.ddate = ddate;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
	
public boolean sendmail() throws Exception {
		
		Calendar currentDate = Calendar.getInstance();
		  SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
		  String dateNow = formatter.format(currentDate.getTime());
		  ddate=dateNow;
		
		
		
		 con = Mycon.getConnection();
         ps = con.prepareStatement("insert into MAILBOX values(?,?,?,?,?,?,?,?)");
         ps.setString(1, this.sendto);
         ps.setString(2, sendfrom);
         ps.setString(3, subject);
         ps.setString(4, message);
         ps.setString(5, status);
         ps.setString(6, ddate);
         ps.setString(7, usertype);
         ps.setString(8, "no");
         int i=ps.executeUpdate();
         if(i>0){
        	 return true;
         }
         return false;
		}
	

                       


	public ResultSet getmail() throws Exception
	{
    con=Mycon.getConnection();
    ps=con.prepareStatement("Select * from (select SENTTO,SENTFROM,SUBJECT,MESSAGE,STATUS,DATE,USERTYPE,READSTATUS,ROW_NUMBER() OVER () AS RN FROM MAILBOX where SENTTO=? and STATUS=?) AS col order by RN desc");
    ps.setString(1,this.sendto);
    ps.setString(2,status);
    rs=ps.executeQuery();
    if(rs==null)return null;
    return rs;
    
	}
	
	public ResultSet getsendmail() throws Exception
	{
    con=Mycon.getConnection();
    ps=con.prepareStatement("Select * from (select SENTTO,SENTFROM,SUBJECT,MESSAGE,STATUS,DATE,USERTYPE,ROW_NUMBER() OVER () AS RN FROM MAILBOX where SENTFROM=?) AS col order by RN desc");
    ps.setString(1,this.sendto);
    rs=ps.executeQuery();
    if(rs==null)return null;
    return rs;
    
	}
	
	public ResultSet showmail() throws Exception
	{
		readstatus="yes";
    con=Mycon.getConnection();
    ps=con.prepareStatement("update MAILBOX  set READSTATUS=? where SENTFROM=? and SUBJECT=? and USERTYPE=? and DATE=?");
    ps.setString(1,this.readstatus);
    ps.setString(2,this.sendfrom);
    ps.setString(3,this.subject);
    ps.setString(4,this.usertype);
    ps.setString(5,this.ddate);
    int i=ps.executeUpdate();
    if(i>0)
    {
    ps=con.prepareStatement("select * from MAILBOX where SENTFROM=? and SUBJECT=? and USERTYPE=? and DATE=?");
    ps.setString(1,this.sendfrom);
    ps.setString(2,this.subject);
    ps.setString(3,this.usertype);
    ps.setString(4,this.ddate);
    rs=ps.executeQuery();
    if(rs==null)return null;
    return rs;
    }
    return null;
	}
	
	public boolean deletemessage() throws Exception
    {
        status="yes";
		con=Mycon.getConnection();
        ps=con.prepareStatement("update MAILBOX  set STATUS=? where SENTFROM=? and SUBJECT=? and DATE=? and USERTYPE=?");
        ps.setString(2,this.sendfrom);
        ps.setString(1, status);
        ps.setString(3,subject);
        ps.setString(4,ddate);
        ps.setString(5,usertype);
        int i=ps.executeUpdate();
        if(i>0) return true;
        return false;
    }
	
	public ResultSet getdeletemail() throws Exception
	{
		status="yes";
    con=Mycon.getConnection();
    ps=con.prepareStatement("Select * from (select SENTTO,SENTFROM,SUBJECT,MESSAGE,STATUS,DATE,USERTYPE,ROW_NUMBER() OVER () AS RN FROM MAILBOX where SENTTO=? and STATUS=?) AS col order by RN desc");
    ps.setString(1,this.sendto);
    ps.setString(2,status);
    rs=ps.executeQuery();
    if(rs==null)return null;
    return rs;
    
	}
	
	
	public boolean restoredeletemail() throws Exception
    {
        status="no";
		con=Mycon.getConnection();
        ps=con.prepareStatement("update MAILBOX  set STATUS=? where SENTFROM=? and SUBJECT=? and DATE=? and USERTYPE=?");
        ps.setString(2,this.sendfrom);
        ps.setString(1, status);
        ps.setString(3,subject);
        ps.setString(4,ddate);
        ps.setString(5,usertype);
        int i=ps.executeUpdate();
        if(i>0) return true;
        return false;
    }
	
}
