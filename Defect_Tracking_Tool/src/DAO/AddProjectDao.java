package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Bean.AddProjectBean;
import DBConnection.DbConnection;

public class AddProjectDao {
	
   static Connection con = DbConnection.getConnection(); 
   
	 public static int save(AddProjectBean beanObj){  
	        int status=0;  
	        System.out.println(" values in dao " + beanObj.getNo_Of_Modules() + beanObj.getProject_Name()+beanObj.getSoft_Tools()+ beanObj.getStart_Date() );
	          try {
	        	  
	        	  PreparedStatement ps = con.prepareStatement("insert into project_master(Project_Name,Soft_Tools,No_Of_Modules, Start_Date) values(?,?,?,?)");
	        	  ps.setString(1, beanObj.getProject_Name());
	        	  ps.setString(2, beanObj.getSoft_Tools());
	        	  ps.setInt(3, beanObj.getNo_Of_Modules());
	        	  ps.setDate(4,beanObj.getStart_Date());
						  		  
				status=ps.executeUpdate();
					
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select max(PM_Id) from project_master");
				int i=0;
				while(rs.next())
				{
					i=rs.getInt(1);
				}
				
				ps=con.prepareStatement("insert into project_details(PM_Id,Module_No) values(?,?)");
				
				ps.setInt(1, i);
				ps.setInt(2, beanObj.getNo_Of_Modules());
				
				ps.executeUpdate();
				
				if(status != 0)
					System.out.println("Success");
				else
					System.out.println("Unsuccess");
				
			
				} catch (SQLException e) {
				e.printStackTrace();
			}
			return status;
}

	 
	 public static List<AddProjectBean> getProjectNames()
	 {
		 List<AddProjectBean> list=new ArrayList<AddProjectBean>();
		 try
		 {
			 con=DbConnection.getConnection();
			 PreparedStatement ps = con.prepareStatement("select * from project_master where Status=1");
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 AddProjectBean beanObj=new AddProjectBean();
				 beanObj.setPM_Id(rs.getInt(1));
				 beanObj.setProject_Name(rs.getString(2));
				 beanObj.setSoft_Tools(rs.getString(3));
			     beanObj.setNo_Of_Modules(rs.getInt(4));
			     beanObj.setStart_Date(rs.getDate(5));
			     list.add(beanObj);
			 }
		 }
		 catch(Exception e)
			{
				e.printStackTrace();
			}
			return list;
	 }
	 public static List<AddProjectBean>ProjectDetails(int uid)
	 {
		 List<AddProjectBean> list=new ArrayList<AddProjectBean>();
		 try
		 {
			 con=DbConnection.getConnection();
			PreparedStatement ps1 =con.prepareStatement("select PM_Id,Project_Name,Soft_Tools,No_Of_Modules,Start_Date from project_master where Status=1 and PM_Id="+uid);
			
				
				ResultSet rs1=ps1.executeQuery(); 
				while(rs1.next())
				{
					AddProjectBean beanObj1=new AddProjectBean();
					beanObj1.setPM_Id(rs1.getInt(1));
					beanObj1.setProject_Name(rs1.getString(2));
					beanObj1.setSoft_Tools(rs1.getString(3));
					beanObj1.setNo_Of_Modules(rs1.getInt(4));
					beanObj1.setStart_Date(rs1.getDate(5));
					list.add(beanObj1);
				}
				
			
		 }
		 catch(Exception e)
			{
				e.printStackTrace();
			}
			return list;
	 }
	 
	 public static int Delete_Project(int id)
	 {
		 int status=0;
		 try
		 {
			 con=DbConnection.getConnection();

			 PreparedStatement ps=con.prepareStatement("update project_details set Status=0 where PM_Id=?");
			 ps.setInt(1,id);
			 status=ps.executeUpdate();
			 
			 PreparedStatement ps1=con.prepareStatement("update project_master set Status=0 where PM_Id=?");
			 ps1.setInt(1,id);
			 status=ps1.executeUpdate();
			 
			 }
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return status;
	 }

	  public static int Update_Project(AddProjectBean beanObj)
	    {
		  int id= beanObj.getPM_Id();
		 
	    	int status=0;
	    	try
	    	{
	    		
	    		con=DbConnection.getConnection();
	    		PreparedStatement ps=con.prepareStatement("update project_master set Project_Name=?,Soft_Tools=?,No_Of_Modules=?,PM_Id=? where PM_Id="+id);
	    		ps.setString(1, beanObj.getProject_Name());
	    		ps.setString(2, beanObj.getSoft_Tools());
	    		ps.setInt(3, beanObj.getNo_Of_Modules());
	    		ps.setInt(4, beanObj.getPM_Id());
	    		ps.executeUpdate();
	  
	    		PreparedStatement ps1=con.prepareStatement("update project_details set PM_Id=?,Module_No=? where PM_Id="+id);
	    		ps1.setInt(1,beanObj.getPM_Id());
	    		ps1.setInt(2, beanObj.getNo_Of_Modules());
	    		ps1.executeUpdate();
	    	}
	    	catch(Exception e)
			{
				e.printStackTrace();
			}
			return status;
	    }
	          
	  public static List<AddProjectBean>SelectPname(int id)
		 {
			 List<AddProjectBean> list=new ArrayList<AddProjectBean>();
			 try
			 {
				 con=DbConnection.getConnection();
				PreparedStatement ps1 =con.prepareStatement("select Project_Name from project_master where Status=1 and PM_Id="+id);
				
					
					ResultSet rs1=ps1.executeQuery(); 
					while(rs1.next())
					{
						AddProjectBean beanObj1=new AddProjectBean();
						beanObj1.setProject_Name(rs1.getString(1));
						list.add(beanObj1);
					}
			 }
			 catch(Exception e)
				{
					e.printStackTrace();
				}
				return list;
		 }

	 
	  }
	 
	
