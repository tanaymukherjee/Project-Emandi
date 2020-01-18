package mypack;
import java.sql.*;

public class invitefriend {
	private int i;
	private String yname,yemail,f1name,f1email,f2name,f2email,f3name,f3email,f4name,f4email;
	private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
	
	public invitefriend()
	{
		
	}

	public invitefriend(String yname, String yemail, String f1name,String f1email, String f2name, String f2email, String f3name,String f3email, String f4name, String f4email) {
		super();
		this.yname = yname;
		this.yemail = yemail;
		this.f1name = f1name;
		this.f1email = f1email;
		this.f2name = f2name;
		this.f2email = f2email;
		this.f3name = f3name;
		this.f3email = f3email;
		this.f4name = f4name;
		this.f4email = f4email;
	}

	
	public boolean invitefriend1() throws Exception {
        
	      
  	
                  con = Mycon.getConnection();
                  ps = con.prepareStatement("select * from UPDATEPROFILE where EMAILID=?");
                  ps.setString(1, this.yemail);
                  rs=ps.executeQuery();
                  if(rs.next())
                  {
                  ps = con.prepareStatement("insert into INVITE_FRIEND values(?,?,?)");
                  ps.setString(1, this.yemail);
                  ps.setString(2, f1name);
                  ps.setString(3, f1email);        
                  i = ps.executeUpdate();
                  if (i > 0) {
                	  Mymail.GmailSend(f1email,"Your Friend Wants You To Join Us For Emandi","<p>Your Friend "+yname+"</p><br><br><br><p>He visited our site and found it very useful. He wishes you too to be a member of this site.</p><br><br><p>This is a concept where we are trying to bring transparency between farmers to wholsalers to retailers civilians. To maintain any possible price hike under control.<br><br><p> You can actually see the price difference between different mandis and in different cities. What are th price range going in the market.<br><br><p>You know the price that is floating on the market. Exploitation of farmers will be minimized.</p><br><br><p>If you still have doubts or clarifications visit our website.</p><p><strong>With Warm Regards,</strong></p><p><strong>Team Quark Returns</strong></p><p><strong>(Let there be light)</strong></p>");
                	  
                  }
                  
                  if(f2name!=null)
                  {
                	  ps = con.prepareStatement("insert into INVITE_FRIEND values(?,?,?)");
                      ps.setString(1, this.yemail);
                      ps.setString(2, f2name);
                      ps.setString(3, f2email);        
                      i = ps.executeUpdate();
                      if (i > 0) {
                    	  Mymail.GmailSend(f2email,"Your Friend Wants You To Join Us For Emandi","<p>Your Friend "+yname+"</p><br><br><br><p>He visited our site and found it very useful. He wishes you too to be a member of this site.</p><br><br><p>This is a concept where we are trying to bring transparency between farmers to wholsalers to retailers civilians. To maintain any possible price hike under control.<br><br><p> You can actually see the price difference between different mandis and in different cities. What are th price range going in the market.<br><br><p>You know the price that is floating on the market. Exploitation of farmers will be minimized.</p><br><br><p>If you still have doubts or clarifications visit our website.</p><p><strong>With Warm Regards,</strong></p><p><strong>Team Quark Returns</strong></p><p><strong>(Let there be light)</strong></p>");
                    	  
                      }
                  }
                  
                  if(f3name!=null)
                  {
                	  ps = con.prepareStatement("insert into INVITE_FRIEND values(?,?,?)");
                      ps.setString(1, this.yemail);
                      ps.setString(2, f3name);
                      ps.setString(3, f3email);        
                      i = ps.executeUpdate();
                      if (i > 0) {
                    	  Mymail.GmailSend(f3email,"Your Friend Wants You To Join Us For Emandi","<p>Your Friend "+yname+"</p><br><br><br><p>He visited our site and found it very useful. He wishes you too to be a member of this site.</p><br><br><p>This is a concept where we are trying to bring transparency between farmers to wholsalers to retailers civilians. To maintain any possible price hike under control.<br><br><p> You can actually see the price difference between different mandis and in different cities. What are th price range going in the market.<br><br><p>You know the price that is floating on the market. Exploitation of farmers will be minimized.</p><br><br><p>If you still have doubts or clarifications visit our website.</p><p><strong>With Warm Regards,</strong></p><p><strong>Team Quark Returns</strong></p><p><strong>(Let there be light)</strong></p>");
                    	  
                      }
                  }
                  
                  
                  if(f4name!=null)
                  {
                	  ps = con.prepareStatement("insert into INVITE_FRIEND values(?,?,?)");
                      ps.setString(1, this.yemail);
                      ps.setString(2, f4name);
                      ps.setString(3, f4email);        
                      i = ps.executeUpdate();
                      if (i > 0) {
                    	  Mymail.GmailSend(f4email,"Your Friend Wants You To Join Us For Emandi","<p>Your Friend "+yname+"</p><br><br><br><p>He visited our site and found it very useful. He wishes you too to be a member of this site.</p><br><br><p>This is a concept where we are trying to bring transparency between farmers to wholsalers to retailers civilians. To maintain any possible price hike under control.<br><br><p> You can actually see the price difference between different mandis and in different cities. What are th price range going in the market.<br><br><p>You know the price that is floating on the market. Exploitation of farmers will be minimized.</p><br><br><p>If you still have doubts or clarifications visit our website.</p><p><strong>With Warm Regards,</strong></p><p><strong>Team Quark Returns</strong></p><p><strong>(Let there be light)</strong></p>");
                    	  
                      }
                  }
                  
                  
                  if(i>0)
                  {
                	  return true;
                  }
                  
                  }

                  return false;
	}
	
	
}
