package mypack;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.sql.*;

import java.util.Random;

public class forgotpassword {
	

	private static final Random RANDOM = new SecureRandom();
	    public static final int PASSWORD_LENGTH = 8;
	    String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@@#()*&%_-";	
	private String password,emailid;
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;
	String pw = "";
	
	public forgotpassword()
	{
		
	}
	
	
	public boolean forgotpassword1(String emailid) throws Exception
    {
		
	this.emailid=emailid;
    		
          
           for (int j=0; j<PASSWORD_LENGTH; j++)
	      {
	          int index = (int)(RANDOM.nextDouble()*letters.length());
	          pw += letters.substring(index, index+1);
	       }
		password=pw;

		
		
		
		
		
		
		
		
		String algorithm = "SHA";

  	    byte[] plainText = password.getBytes();

  	    MessageDigest md = MessageDigest.getInstance(algorithm);

  	    md.reset();
  	    md.update(plainText);
  	    byte[] encodedPassword = md.digest();

  	    StringBuilder sb = new StringBuilder();
  	    for (int i = 0; i < encodedPassword.length; i++) {
  	      if ((encodedPassword[i] & 0xff) < 0x10) {
  	        sb.append("0");
  	      }
  	      sb.append(Long.toString(encodedPassword[i] & 0xff, 16));
  	    }
		
		
		
		System.out.println(sb.toString());

          System.out.println(password);
           con=Mycon.getConnection();

           ps=con.prepareStatement("select * from USERLOGIN where EMAILID=?");

           ps.setString(1,this.emailid);

       		rs=ps.executeQuery();

       		if(rs.next()){

           ps=con.prepareStatement("update USERLOGIN set PASSWORD=? where EMAILID=?");

       		ps.setString(2,this.emailid);

       		ps.setString(1,sb.toString());

       		int i=ps.executeUpdate();

       		if(i>0){ 
       			Mymail.GmailSend(emailid,"Changed Password","<p>Dear friend</p><br><br><br><p><font color=#FF0000>Your new auto-generated password is here:</font></p><br><br><p><font color=#FF0000>"+password+"</font></p><br><br><p>NOTE: You better change the password as soon as you login first time.</p><br><br><hr><p><strong>With Warm Regards,</strong></p><p><strong>Team Quark Returns</strong></p><p><strong>(Let there be light)</strong></p>");
       			return true;
       		}
       		return false;
       		}
       	
       		
       		return false;
       

    }

}
