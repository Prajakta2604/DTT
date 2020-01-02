package Action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.AssignProjectBean;
import DAO.AddUserDao;
import DAO.AssignProjectDao;

/**
 * Servlet implementation class AssignProject_Action
 */
@WebServlet("/AssignProject_Action")
public class AssignProject_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignProject_Action() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String UD_Id=request.getParameter("UD_id");
		int id=Integer.parseInt(UD_Id);
		String Select_Project=request.getParameter("project");
		String Assign_User=request.getParameter("user");
		System.out.println("printed");
		
		AssignProjectBean BeanObj=new AssignProjectBean();
		BeanObj.setSelect_Project(Select_Project);
		BeanObj.setAssign_user(Assign_User);
		
		

		AssignProjectBean s=AssignProjectDao.getEmployeeById();
		if(s>0)
		response.sendRedirect("views/AssginProject1.jsp");
		

	}

}
