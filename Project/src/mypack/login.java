

package mypack;
import java.security.MessageDigest;
import java.sql.*;





public class login {
    
   public static String username,password;
    
   public static String checkLogin1(String userName,String password){
   
       login.username=userName;
       login.password=password;
        
       return username;
   }
    
   
    
    public static ResultSet checkLogin() throws Exception
    { 
        
    	
    	
    	Connection con=Mycon.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        
        
        
        
        
        
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
        
        
        
        
        
        
        ps=con.prepareStatement("select * from USERLOGIN where EMAILID=? and PASSWORD=?");
        ps.setString(1,login.username);
        ps.setString(2, sb.toString());
        rs=ps.executeQuery();
        if(!rs.next())return null;
        return rs;
                
      /*  byte b[] = password.getBytes();
        byte b1[] = new byte[b.length];
       for(int i=0;i<b.length;i++)                //for password Encryption
            b1[i]=(byte) ~b[i];
        String str = new String(b1,0);*/
   
          
        

 }
}
