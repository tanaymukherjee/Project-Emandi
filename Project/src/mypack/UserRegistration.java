package mypack;
import java.security.MessageDigest; 
import java.sql.*;  
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import  java.security.SecureRandom;
import java.util.Random;

public class UserRegistration {
	  
		private static final Random RANDOM = new SecureRandom();
	    public static final int PASSWORD_LENGTH = 8;
	    String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@@#()*&%_-";
	    String pw = "";
	    private String ddate;
		int i;
	    private  String mobno,landlineno="Null",pincode; 
	    private String user="usertype",name,emailid,password,gender,state,city,address;
	    private Connection con;
	    private PreparedStatement ps;
	   private ResultSet rs;
	
	   
	   
	   
	   public UserRegistration() {
		
	}
	public UserRegistration(String ddate, String landlineno, String pincode,
			String user, String password, String gender, String state,
			String city, String address) {
		
		this.ddate = ddate;
		this.landlineno = landlineno;
		this.pincode = pincode;
		this.user = user;
		this.password = password;
		this.gender = gender;
		this.state = state;
		this.city = city;
		this.address = address;
	}
	public UserRegistration(String emailid,  String name,
			String mobno) {
		
		this.mobno = mobno;
		this.name = name;
		this.emailid = emailid;
		
	}
	public String getDate() {
		return ddate;
	}
	public void setDate(String ddate) {
		this.ddate = ddate;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getLandlineno() {
		return landlineno;
	}
	public void setLandlineno(String landlineno) {
		this.landlineno = landlineno;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public boolean suserregistration() throws Exception {
		
		Calendar currentDate = Calendar.getInstance();
		  SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
		  String dateNow = formatter.format(currentDate.getTime());
		  ddate=dateNow;
		
		for (int j=0; j<PASSWORD_LENGTH; j++)
	      {
	          int index = (int)(RANDOM.nextDouble()*letters.length());
	          pw += letters.substring(index, index+1);
	       }
		password=pw;
		System.out.println("password=    "+pw);
		
		
		
		
		
		
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
		
		 con = Mycon.getConnection();
         ps = con.prepareStatement("insert into USERLOGIN values(?,?,?,?,?,?)");
         ps.setString(1, this.emailid);
         ps.setString(2, name);
         ps.setString(3, mobno);
         ps.setString(4, user);
         ps.setString(5, sb.toString());
         ps.setString(6, ddate);
         i=ps.executeUpdate();
         if(i>0){
        	 Mymail.GmailSend(emailid,"Welcome to Golden Crop.com","<p>Dear friend "+name+"</p><br><br><br><p>Thank you for registering at goldencrop.com.</p><br><br><p>This is a concept where we are trying to bring transparency between farmers to wholsalers to retailers civilians. To maintain any possible price hike under control.<br><br><p> You can actually see the price difference between different mandis and in different cities. What are th price range going in the market.<br><br><p>You know the price that is floating on the market. Exploitation of farmers will be minimized.</p><br><br><p>You can further explore the site for informations.</p><br><br><hr><p><font color=#FF0000>Your auto-generated password is here:</font></p><br><br><p><font color=#FF0000>"+password+"</font></p><br><br><p>NOTE: You will have to change the password as soon as you login first time</p><br><br><hr><p><strong>With Warm Regards,</strong></p><p><strong>Team Quark Returns</strong></p><p><strong>(Let there be light)</strong></p>");
        	 return true;
         }
         return false;
		}


}
