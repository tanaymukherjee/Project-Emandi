package mypack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Commodity {
	
  private String s1,delete,emailid,name,user,category,subcategory,quantity,price,mobno,weight;
  private Connection con;
  private PreparedStatement ps;
  private ResultSet rs,rs1;
  private int i;
  
  public Commodity()
  {
	  
  }

public Commodity(String emailid, String name, String user, String category,
		String subcategory, String quantity, String price, String mobno,String weight) {

	this.emailid = emailid;
	this.name = name;
	this.user = user;
	this.category = category;
	this.subcategory = subcategory;
	this.quantity = quantity;
	this.price = price;
	this.mobno = mobno;
	this.weight = weight;
}









public Commodity(String emailid, String name, String user, String mobno) {
	super();
	this.emailid = emailid;
	this.name = name;
	this.user = user;
	this.mobno = mobno;
}

public Commodity(String emailid, String name, String user, String subcategory,
		String quantity, String price) {
	super();
	this.emailid = emailid;
	this.name = name;
	this.user = user;
	this.subcategory = subcategory;
	this.quantity = quantity;
	this.price = price;
}


public Commodity(String emailid, String name, String user, String subcategory,
		String quantity, String price, String delete) {
	super();
	this.emailid = emailid;
	this.name = name;
	this.user = user;
	this.subcategory = subcategory;
	this.quantity = quantity;
	this.price = price;
	this.delete=delete;
}




public String getS1() {
	return s1;
}

public void setS1(String s1) {
	this.s1 = s1;
}

public String getEmailid() {
	return emailid;
}

public String getWeight() {
	return weight;
}

public void setWeight(String weight) {
	this.weight = weight;
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

public String sgetString(String s1)
{
	return s1;
}


public void setQuantity(String quantity) {
	this.quantity = quantity;
}

public String getPrice() {
	return price;
}

public void setPrice(String price) {
	this.price = price;
}

public String getMobno() {
	return mobno;
}

public void setMobno(String mobno) {
	this.mobno = mobno;
}
  
public boolean insertcomodity() throws Exception {
		
	
	String minrange,maxrange ,minmaxrange;
	
	
	if(weight.equals("quintal"))
	{
		//System.out.println(quantity);	
		int j=Integer.parseInt(quantity);
		j=j*100;
		quantity=Integer.toString(j);
		//System.out.println(quantity);
		
	}
	if(weight.equals("tonnes"))
	{
		int j=Integer.parseInt(quantity);
		j=j*1000;
		quantity=Integer.toString(j);
	}
	
	con = Mycon.getConnection();
     ps = con.prepareStatement("insert into COMMODITY values(?,?,?,?,?,?,?,?)");
     ps.setString(1, this.emailid);
     ps.setString(2, name);
     ps.setString(3, user);
     ps.setString(4, category);
     ps.setString(5, subcategory);
     ps.setString(6, quantity);
     ps.setString(7, price);
     ps.setString(8, mobno);
     int i=ps.executeUpdate();
     if(i>0)
     {
     	ps=con.prepareStatement("select max(PRICE) as MAX from COMMODITY where USERTYPE=? and SUBCATEGORY=?");
     	ps.setString(1,this.user);
         ps.setString(2,subcategory);
         rs=ps.executeQuery();
         rs.next();
         maxrange=rs.getString(1);
         //System.out.println(maxrange);
         ps=con.prepareStatement("select min(PRICE) as MIN from COMMODITY where USERTYPE=? and SUBCATEGORY=?");
     	ps.setString(1,this.user);
         ps.setString(2,subcategory);
         rs1=ps.executeQuery();
         rs1.next();
         minrange=rs1.getString(1);
        // System.out.println(minrange);
         minmaxrange = minrange+" - "+maxrange;
         //System.out.println(minmaxrange);
         if(user.equals("Farmer"))
         {
         	ps=con.prepareStatement("update VEGETABLE  set FARMERRANGE=? where SUBCATEGORY=?");
         	ps.setString(1, minmaxrange);
             ps.setString(2,subcategory);
              i=ps.executeUpdate();
             if(i>0) return true;
             return false;
         }
         if(user.equals("Retailer"))
         {
         	ps=con.prepareStatement("update VEGETABLE  set RETAILERRANGE=? where SUBCATEGORY=?");
         	ps.setString(1, minmaxrange);
             ps.setString(2,subcategory);
              i=ps.executeUpdate();
             if(i>0) return true;
             return false;
         }
         if(user.equals("WholeSaler"))
         {
         	
         	ps=con.prepareStatement("update VEGETABLE  set WHOLESALERRANGE=? where SUBCATEGORY=?");
         	ps.setString(1, minmaxrange);
             ps.setString(2,subcategory);
              i=ps.executeUpdate();
             if(i>0) return true;
             return false;	
         }
     	
     }
     return false;
	} 


public ResultSet getcommodity() throws Exception
{
con=Mycon.getConnection();
ps=con.prepareStatement("Select * from (select EMAILID,NAME,USERTYPE,CATEGORY,SUBCATEGORY,QUANTITY,PRICE,MOBNO,ROW_NUMBER() OVER () AS RN FROM COMMODITY where EMAILID!=?) AS col order by RN desc");
ps.setString(1,this.emailid);
rs=ps.executeQuery();
if(rs==null)return null;
return rs;

}


public ResultSet getitselfcommodity() throws Exception
{
con=Mycon.getConnection();
ps=con.prepareStatement("Select * from (select EMAILID,NAME,USERTYPE,CATEGORY,SUBCATEGORY,QUANTITY,PRICE,MOBNO,ROW_NUMBER() OVER () AS RN FROM COMMODITY where EMAILID=?) AS col order by RN desc");
ps.setString(1,this.emailid);
rs=ps.executeQuery();
if(rs==null)return null;
return rs;

}


public ResultSet getcommoditycontact() throws Exception
{
	
con=Mycon.getConnection();
ps=con.prepareStatement("select * from COMMODITY where NAME=? and USERTYPE=? and SUBCATEGORY=? and QUANTITY=? and PRICE=?");
ps.setString(1,this.name);
ps.setString(2,user);
ps.setString(3,subcategory);
ps.setString(4,quantity);
ps.setString(5,price);
rs=ps.executeQuery();
if(rs==null)return null;
return rs;

}

public boolean updatecommodity() throws Exception
{
     String minrange,maxrange ,minmaxrange;
  
	if(delete.equals("delete"))
    {
    	
    	con=Mycon.getConnection();
        ps=con.prepareStatement("delete from COMMODITY where EMAILID=? and NAME=? and USERTYPE=? and SUBCATEGORY=?");
        ps.setString(4,this.subcategory);
        ps.setString(1,emailid);
        ps.setString(2,name);
        ps.setString(3,user);
         i=ps.executeUpdate();
        if(i>0)
        {
        	ps=con.prepareStatement("select max(PRICE) from COMMODITY where USERTYPE=? and SUBCATEGORY=?");
        	ps.setString(1,this.user);
            ps.setString(2,subcategory);
            rs=ps.executeQuery();
            maxrange=rs.getString(1);
            //System.out.println(maxrange);
            ps=con.prepareStatement("select min(PRICE) from COMMODITY where USERTYPE=? and SUBCATEGORY=?");
        	ps.setString(1,this.user);
            ps.setString(2,subcategory);
            rs=ps.executeQuery();
            minrange=rs.getString(1);
            //System.out.println(minrange);
            minmaxrange = minrange+" - "+maxrange;
            //System.out.println(minmaxrange);
            if(user.equals("Farmer"))
            {
            	ps=con.prepareStatement("update VEGETABLE  set FARMERRANGE=? where SUBCATEGORY=?");
            	ps.setString(1, minmaxrange);
                ps.setString(2,subcategory);
                 i=ps.executeUpdate();
                if(i>0) return true;
                return false;
            }
            if(user.equals("Retailer"))
            {
            	ps=con.prepareStatement("update VEGETABLE  set RETAILERRANGE=? where SUBCATEGORY=?");
            	ps.setString(1, minmaxrange);
                ps.setString(2,subcategory);
                 i=ps.executeUpdate();
                if(i>0) return true;
                return false;
            }
            if(user.equals("WholeSaler"))
            {
            	
            	ps=con.prepareStatement("update VEGETABLE  set WHOLESALERRANGE=? where SUBCATEGORY=?");
            	ps.setString(1, minmaxrange);
                ps.setString(2,subcategory);
                 i=ps.executeUpdate();
                if(i>0) return true;
                return false;	
            }
        	
        }
        return false;
    
    }
		
	con=Mycon.getConnection();
    ps=con.prepareStatement("update COMMODITY  set QUANTITY=?,PRICE=? where EMAILID=? and NAME=? and USERTYPE=? and SUBCATEGORY=?");
    ps.setString(6,this.subcategory);
    ps.setString(1, quantity);
    ps.setString(2,price);
    ps.setString(3,emailid);
    ps.setString(4,name);
    ps.setString(5,user);
     i=ps.executeUpdate();
     if(i>0)
     {
     	ps=con.prepareStatement("select max(PRICE) from COMMODITY where USERTYPE=? and SUBCATEGORY=?");
     	ps.setString(1,this.user);
         ps.setString(2,subcategory);
         rs=ps.executeQuery();
         rs.next();
         maxrange=rs.getString(1);
         //System.out.println(maxrange);
         ps=con.prepareStatement("select min(PRICE) from COMMODITY where USERTYPE=? and SUBCATEGORY=?");
     	ps.setString(1,this.user);
         ps.setString(2,subcategory);
         rs1=ps.executeQuery();
         rs1.next();
         minrange=rs1.getString(1);
         //System.out.println(minrange);
         minmaxrange = minrange+" - "+maxrange;
         //System.out.println(minmaxrange);
         if(user.equals("Farmer"))
         {
         	ps=con.prepareStatement("update VEGETABLE  set FARMERRANGE=? where SUBCATEGORY=?");
         	ps.setString(1, minmaxrange);
             ps.setString(2,subcategory);
              i=ps.executeUpdate();
             if(i>0) return true;
             return false;
         }
         if(user.equals("Retailer"))
         {
         	ps=con.prepareStatement("update VEGETABLE  set RETAILERRANGE=? where SUBCATEGORY=?");
         	ps.setString(1, minmaxrange);
             ps.setString(2,subcategory);
              i=ps.executeUpdate();
             if(i>0) return true;
             return false;
         }
         if(user.equals("WholeSaler"))
         {
         	
         	ps=con.prepareStatement("update VEGETABLE  set WHOLESALERRANGE=? where SUBCATEGORY=?");
         	ps.setString(1, minmaxrange);
             ps.setString(2,subcategory);
              i=ps.executeUpdate();
             if(i>0) return true;
             return false;	
         }
     	
     }
    return false;
}


 
}
