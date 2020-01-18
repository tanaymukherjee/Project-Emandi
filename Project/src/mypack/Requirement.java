package mypack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Requirement {
	
	
	 private String emailid,name,user,mobno,category,subcategory,quantity,unit;
	  private Connection con;
	  private PreparedStatement ps;
	  private ResultSet rs;

	  
	  
	  
	public Requirement() {
		// TODO Auto-generated constructor stub
	}




	public Requirement(String emailid, String name, String user, String mobno,
			String category, String subcategory, String quantity, String unit) {
		super();
		this.emailid = emailid;
		this.name = name;
		this.user = user;
		this.mobno = mobno;
		this.category = category;
		this.subcategory = subcategory;
		this.quantity = quantity;
		this.unit = unit;
	}




	
	
	
	public Requirement(String emailid, String name, String user,
			String subcategory, String quantity, String unit) {
		super();
		this.emailid = emailid;
		this.name = name;
		this.user = user;
		this.subcategory = subcategory;
		this.quantity = quantity;
		this.unit = unit;
	}



	
	
	
	

	public Requirement(String emailid, String name, String user, String mobno) {
		super();
		this.emailid = emailid;
		this.name = name;
		this.user = user;
		this.mobno = mobno;
	}




	public String getEmailid() {
		return emailid;
	}




	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getUser() {
		return user;
	}




	public void setUser(String user) {
		this.user = user;
	}




	public String getMobno() {
		return mobno;
	}




	public void setMobno(String mobno) {
		this.mobno = mobno;
	}




	public String getCategory() {
		return category;
	}




	public void setCategory(String category) {
		this.category = category;
	}




	public String getSubcategory() {
		return subcategory;
	}




	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}




	public String getQuantity() {
		return quantity;
	}




	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}




	public String getUnit() {
		return unit;
	}




	public void setUnit(String unit) {
		this.unit = unit;
	} 
	
	
	
	public boolean insertrequirement() throws Exception {
		
				
		con = Mycon.getConnection();
	     ps = con.prepareStatement("insert into REQUIREMENT values(?,?,?,?,?,?,?,?)");
	     ps.setString(1, this.emailid);
	     ps.setString(2, name);
	     ps.setString(3, user);
	     ps.setString(4, mobno);
	     ps.setString(5, category);
	     ps.setString(6, subcategory);
	     ps.setString(7, quantity);
	     ps.setString(8, unit);
	     int i=ps.executeUpdate();
	     if(i>0){
	    	 return true;
	     }
	     return false;
		} 
	
	
	public ResultSet getrequirement() throws Exception
	{
	con=Mycon.getConnection();
	ps=con.prepareStatement("Select * from (select EMAILID,NAME,USERTYPE,MOBNO,CATEGORY,SUBCATEGORY,QUANTITY,UNIT,ROW_NUMBER() OVER () AS RN FROM REQUIREMENT where EMAILID!=?) AS col order by RN desc");
	ps.setString(1,this.emailid);
	rs=ps.executeQuery();
	if(rs==null)return null;
	return rs;

	}
	
	public ResultSet getrequirementcontact() throws Exception
	{
		
	if(quantity.contains("kg"))
	{
		quantity=quantity.replace("kg","");
	}
	
	if(quantity.contains("quintal"))
	{
		quantity=quantity.replace("quintal","");
	}
	if(quantity.contains("tonnes"))
	{
		quantity=quantity.replace("tonnes","");
	}
	con=Mycon.getConnection();
	ps=con.prepareStatement("select * from REQUIREMENT where NAME=? and USERTYPE=? and SUBCATEGORY=? and QUANTITY=?");
	ps.setString(1,this.name);
	ps.setString(2,user);
	ps.setString(3,subcategory);
	ps.setString(4,quantity);
	rs=ps.executeQuery();
	if(rs==null)return null;
	return rs;

	}
	
}


