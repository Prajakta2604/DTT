package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AddProjectBean;
import DAO.AddProjectDao;


/**
 * Servlet implementation class UpdateProjectAction
 */
@WebServlet("/UpdateProjectAction")
public class UpdateProjectAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProjectAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	  //	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);

	   
	   int PM_Id=Integer.parseInt(request.getParameter("uid"));
	  //  System.out.println(PM_Id);
	    String pname=request.getParameter("Project_Name");
	   System.out.println(pname);
	    String stool=request.getParameter("Soft_Tools");
	   System.out.println(stool);
	   int module=Integer.parseInt(request.getParameter("No_Of_Modules"));
	   System.out.println(module);
	  	    
	   AddProjectBean pb=new AddProjectBean();
	   pb.setPM_Id(PM_Id);
	   pb.setProject_Name(pname);
	   pb.setSoft_Tools(stool);
	   pb.setNo_Of_Modules(module);
	
	   int status=AddProjectDao.Update_Project(pb);
	   if(status>0)
	   {
		   System.out.println("update succesfully");
			
			response.sendRedirect("views/AddProject.jsp");
		   
	   }
	  else
	   {
		   System.out.println("update not successfully");
		   response.sendRedirect("views/AddProject.jsp");
		   
	   }
	
	}

}
