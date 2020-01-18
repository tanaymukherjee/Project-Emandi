package mypack;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class registration_continue {
	
	private String name,emailid,password,gender,dob,mobno,llno,address,state,city,pincode,newsletter,usertype,registrationno="null";
	 private Connection con;
	    private PreparedStatement ps;
	   private ResultSet rs;
	
	   
	   
	   
	   
	   public registration_continue()
	   {
		   
	   }
	   
	   
	   public registration_continue(String password, String gender, String dob,
			String llno, String address, String state, String city,
			String pincode, String newsletter, String usertype,
			String registrationno) {
		
		this.password = password;
		this.gender = gender;
		this.dob = dob;
		this.llno = llno;
		this.address = address;
		this.state = state;
		this.city = city;
		this.pincode = pincode;
		this.newsletter = newsletter;
		this.usertype = usertype;
		this.registrationno = registrationno;
	}


	   
	   
	   
	   
	   
	   
	   

	public registration_continue(String name, String emailid, String password,
			String gender, String dob, String mobno, String llno,
			String address, String state, String city, String pincode,
			String newsletter, String usertype, String registrationno) {
		super();
		this.name = name;
		this.emailid = emailid;
		this.password = password;
		this.gender = gender;
		this.dob = dob;
		this.mobno = mobno;
		this.llno = llno;
		this.address = address;
		this.state = state;
		this.city = city;
		this.pincode = pincode;
		this.newsletter = newsletter;
		this.usertype = usertype;
		this.registrationno = registrationno;
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



	public String getDob() {
		return dob;
	}



	public void setDob(String dob) {
		this.dob = dob;
	}



	public String getLlno() {
		return llno;
	}



	public void setLlno(String llno) {
		this.llno = llno;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
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



	public String getPincode() {
		return pincode;
	}



	public void setPincode(String pincode) {
		this.pincode = pincode;
	}



	public String getNewsletter() {
		return newsletter;
	}



	public void setNewsletter(String newsletter) {
		this.newsletter = newsletter;
	}



	public String getUsertype() {
		return usertype;
	}



	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}



	public String getRegistrationno() {
		return registrationno;
	}



	public void setRegistrationno(String registrationno) {
		this.registrationno = registrationno;
	}
	   
	   
	  
public boolean updateregistration() throws Exception {
		int i,j,k;			
		
		
		
		
		
		
		
		 String algorithm = "SHA";

	  	    byte[] plainText = password.getBytes();

	  	    MessageDigest md = MessageDigest.getInstance(algorithm);

	  	    md.reset();
	  	    md.update(plainText);
	  	    byte[] encodedPassword = md.digest();

	  	    StringBuilder sb = new StringBuilder();
	  	    for (int m = 0; m < encodedPassword.length; m++) {
	  	      if ((encodedPassword[m] & 0xff) < 0x10) {
	  	        sb.append("0");
	  	      }
	  	      sb.append(Long.toString(encodedPassword[m] & 0xff, 16));
	  	    }
			
		
		System.out.println(password);
		
		
		
		 con = Mycon.getConnection();
		 ps = con.prepareStatement("update USERLOGIN set PASSWORD=?,USERTYPE=? where EMAILID=?");
         ps.setString(3, this.emailid);
         ps.setString(1, sb.toString());
         ps.setString(2, usertype);
         i=ps.executeUpdate();
         if(i>0){
        	 ps = con.prepareStatement("insert into UPDATEPROFILE values(?,?,?,?,?,?,?,?,?,?,?)");
             ps.setString(1, this.emailid);
             ps.setString(2, name);
             ps.setString(3, mobno);
             ps.setString(4, llno);
             ps.setString(5, address);
             ps.setString(6, state);
             ps.setString(7, city);
             ps.setString(8, dob);
             ps.setString(9, gender);
             ps.setString(10, pincode);
             ps.setString(11, registrationno);
             j=ps.executeUpdate();
             if(j>0)
             {
            	 if(newsletter.equals("Yes"))
            	 {
            	 ps = con.prepareStatement("insert into NEWSLETTER values(?)");
                 ps.setString(1, this.emailid);
                 j=ps.executeUpdate();
                 if(j>0)
                 {
                	 return true;
                 }
            	 }
            	 return true;
             }
        	 return false;
         }
         return false;
		}
	   
	   
}
