package Bean;

import java.sql.Date;

public class AddProjectBean {
	private String Project_Name,Soft_Tools;
	private int No_Of_Modules;
	private Date Start_Date;
	private int PM_Id;
	
	public String getProject_Name() {
		return Project_Name;
	}
	public void setProject_Name(String project_Name) {
		Project_Name = project_Name;
	}
	public String getSoft_Tools() {
		return Soft_Tools;
	}
	public void setSoft_Tools(String soft_Tools) {
		Soft_Tools = soft_Tools;
	}
	public int getNo_Of_Modules() {
		return No_Of_Modules;
	}
	public void setNo_Of_Modules(int no_Of_Modules) {
		No_Of_Modules = no_Of_Modules;
	}
	public Date getStart_Date() {
		return Start_Date;
	}
	public void setStart_Date(Date start_Date) {
		Start_Date = start_Date;
	}
	public int getPM_Id() {
		return PM_Id;
	}
	public void setPM_Id(int pM_Id) {
		PM_Id = pM_Id;
	}

	
	

}
