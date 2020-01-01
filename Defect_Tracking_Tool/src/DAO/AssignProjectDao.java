package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.AddUserBean;
import Bean.AssignProjectBean;
import DBConnection.DbConnection;

public class AssignProjectDao 

{
	static Connection con=DbConnection.getConnection();
	
	
	
	

	public static List<AssignProjectBean> getUserDetail()
	{
		ArrayList<AssignProjectBean> ls = new ArrayList<AssignProjectBean>();
		PreparedStatement ps;
		try
		{
			ps = DbConnection.getConnection().prepareStatement("SELECT s.Role,u.User_Name,u.Email FROM user_master AS s INNER JOIN user_details AS u ON s.UD_Id=u.UD_Id WHERE (u.Status=1 AND s.Status=1)");
			ResultSet rt = ps.executeQuery();
			while(rt.next())
			{
				AssignProjectBean a = new AssignProjectBean();
				a.setUD_Id(rt.getInt(1));	
				a.setRole(rt.getString(2));
				a.setName(rt.getString(3));
				a.setEmail(rt.getString(4));
			ls.add(a);
			}
		} 
		catch(Exception e) 
		{
		
			e.printStackTrace();
		}
		
		return ls;
		
	}
	
	
	
}
	