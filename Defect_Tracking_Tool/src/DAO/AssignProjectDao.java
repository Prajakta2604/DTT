package DAO;
import java.sql.*;
import java.util.*;
import Bean.AssignProjectBean;
public class AssignProjectDao 
{
	public static AssignProjectBean getEmployeeById(int id)
	 {  
	   AssignProjectBean as=new AssignProjectBean();    
	        try{  
	            Connection con=AssignProjectDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("select * from user_master where id=?");  
	            ps.setInt(1,id);  
	            ResultSet rs=ps.executeQuery();  
	            if(rs.next())
	            {  
	                as.setUD_Id(rs.getInt(1));  
	                as.setRole(rs.getString(2)); 
	                as.setName(rs.getString(3));
	                as.setEmail(rs.getString(4));
	            }  
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}   
	        return as;  
	    }
	private static Connection getConnection() 
	{
		return null;	
	}
	
}