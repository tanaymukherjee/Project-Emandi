package mypack;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class WholeSaler {
	
	private String regno,name,emailid,renewpassword,newpassword,oldpassword,gender,dob,mobno,llno,address,state,city,pincode,newsletter,usertype,registrationno="null";
	 private Connection con;
	    private PreparedStatement ps;
	   private ResultSet rs;
	
	   
	   
	   
	   
	   public WholeSaler()
	   {
		   
	   }
	   
	   
	   
	   
	    public WholeSaler(String emailid) {
		this.emailid = emailid;
	}



        
	    
	    
		public WholeSaler(String emailid,String name,String mobno,String llno,
				String address,String state, String city,String dob,String gender,
				    String pincode,String regno) {
			
			this.name = name;
			this.emailid = emailid;
			this.gender = gender;
			this.dob = dob;
			this.mobno = mobno;
			this.llno = llno;
			this.address = address;
			this.state = state;
			this.city = city;
			this.pincode = pincode;
			this.regno=regno;
		}




		public WholeSaler(String llno, String address, String state, String city,
			String pincode) {
		
		this.llno = llno;
		this.address = address;
		this.state = state;
		this.city = city;
		this.pincode = pincode;
		
	}


		public WholeSaler(String renewpassword,String newpassword, String oldpassword) {
			
			this.renewpassword = renewpassword;
			this.newpassword = newpassword;
			this.oldpassword = oldpassword;
		}


		public String getRenewpassword() {
			return renewpassword;
		}

		public String getRegno() {
			return regno;
		}


		public void setRego(String regno) {
			this.regno=regno;
		}
		
		
		public void setRenewpassword(String renewpassword) {
			this.renewpassword = renewpassword;
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


		public String getNewpassword() {
			return newpassword;
		}


		public void setNewpassword(String newpassword) {
			this.newpassword = newpassword;
		}


		public String getOldpassword() {
			return oldpassword;
		}


		public void setOldpassword(String oldpassword) {
			this.oldpassword = oldpassword;
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


		public String getMobno() {
			return mobno;
		}


		public void setMobno(String mobno) {
			this.mobno = mobno;
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

	    
	
		public boolean changepassword() throws Exception
	    {
	       if(renewpassword.equals(newpassword))
	       {
	    
	    	   
	    	   String algorithm = "SHA";

		  	    byte[] plainText = newpassword.getBytes();

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
				
			
			System.out.println(newpassword);
	    	   
	    	   
	        con=Mycon.getConnection();
	        ps=con.prepareStatement("update USERLOGIN set PASSWORD=? where EMAILID=?");
	        ps.setString(2,this.emailid);
	        ps.setString(1,sb.toString());
	        int i=ps.executeUpdate();
	        if(i>0) return true;
	        return false;
	       }
	       return false;
	    }
		
		
		public ResultSet getwholesalerprofile() throws Exception
	    {
	        con=Mycon.getConnection();
	        ps=con.prepareStatement("select * from UPDATEPROFILE where EMAILID=?");
	        ps.setString(1,this.emailid);
	        rs=ps.executeQuery();
	        if(rs==null)return null;
	        return rs;
	        
	    }
		
		public boolean updatewholesalerprofile() throws Exception
	    {
	        con=Mycon.getConnection();
	        ps=con.prepareStatement("update UPDATEPROFILE  set LANDLINENO=?,ADDRESS=?,STATE=?,CITY=?,PINCODE=? where EMAILID=?");
	        ps.setString(6,this.emailid);
	        ps.setString(1, llno);
	        ps.setString(2,address);
	        ps.setString(3,state);
	        ps.setString(4,city);
	        ps.setString(5,pincode);
	        int i=ps.executeUpdate();
	        if(i>0) return true;
	        return false;
	    }
		
	    
}
