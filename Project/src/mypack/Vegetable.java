package mypack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Vegetable {
	
	private String subcategory,minprice,maxprice,str;
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection con;
	
	public Vegetable() {
		// TODO Auto-generated constructor stub
	}

	public Vegetable(String subcategory, String minprice, String maxprice) {
		super();
		this.subcategory = subcategory;
		this.minprice = minprice;
		this.maxprice = maxprice;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public String getMinprice() {
		return minprice;
	}

	public void setMinprice(String minprice) {
		this.minprice = minprice;
	}

	public String getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(String maxprice) {
		this.maxprice = maxprice;
	}

    
	public ResultSet getvegetable() throws Exception
    {
		 str="vegetable";
        con=Mycon.getConnection();
        ps=con.prepareStatement("select * from VEGETABLE where CATEGORY=?");
        ps.setString(1,this.str);
        rs=ps.executeQuery();
        if(rs==null)return null;
        return rs;
        
    }
	
	public ResultSet getcereal() throws Exception
    {
         str="cereal";
		con=Mycon.getConnection();
        ps=con.prepareStatement("select * from VEGETABLE where CATEGORY=?");
        ps.setString(1,this.str);
        rs=ps.executeQuery();
        if(rs==null)return null;
        return rs;
        
    }
	
	public ResultSet getfruit() throws Exception
    {
		 str="fruit";
        con=Mycon.getConnection();
        ps=con.prepareStatement("select * from VEGETABLE where CATEGORY=?");
        ps.setString(1,this.str);
        rs=ps.executeQuery();
        if(rs==null)return null;
        return rs;
        
    }
	
	
	public boolean updatecategoryprice() throws Exception
    {
        con=Mycon.getConnection();
        ps=con.prepareStatement("update VEGETABLE  set MINPRICE=?,MAXPRICE=? where SUBCATEGORY=?");
        ps.setString(3,this.subcategory);
        ps.setString(1, minprice);
        ps.setString(2,maxprice);
        int i=ps.executeUpdate();
        if(i>0) return true;
        return false;
    }

}
