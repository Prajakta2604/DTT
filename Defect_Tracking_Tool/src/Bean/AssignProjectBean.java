package Bean;

public class AssignProjectBean
{
	private String Select_Project,Assign_User;
	private int UD_Id;
	private String Role,Email,Name;
	
	
	

	public String getSelect_Project() 
	{
		return Select_Project;
	}

	public void setSelect_Project(String select_Project) 
	{
		Select_Project = select_Project;
	}

	public String getAssign_user()
	{
		return Assign_User;
	}

	public void setAssign_user(String assign_user) 
	{
		Assign_User = assign_user;
	}

	public int getUD_Id() {
		return UD_Id;
	}

	public void setUD_Id(int uD_Id) {
		UD_Id = UD_Id;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}
}
