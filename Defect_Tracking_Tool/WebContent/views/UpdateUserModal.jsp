 <style>
.f{
background-color:#d1e0e0;
font-family: "Times New Roman";
text-align:center;
background-position:center;
}
.a{
margin-bottom: 15px;
    margin-left: auto;
    padding-right: 100px;
    
    }
</style>
 <%@ page import="DAO.*"%>
<%@ page import="Bean.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List.*"%>
<form action="../UpdateAddUSer" method="post">
	<%
		Object obj = session.getAttribute("id");
		int uid = Integer.parseInt(obj.toString());
		
		List<AddUserBean> list1 = AddUserDao.getUserById(uid);
		
		for (AddUserBean beanobj : list1) {
			System.out.println("in jsp"+beanobj.getRole());
	%>
	<div class="modal-dialog ">
		<div class="modal-content ">
			<div class="modal-header f">
				<h4 class="modal-title">Updating Your User</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body ">
			 <input type="hidden" name="uid" value="<%=beanobj.getUD_Id()%>">
			 <div class="from-group row">
     <label for="name" class="col-md-4 text-right control-label col-from-label">Full Name</label>
     <input type="text" class="from-control" id="name" value="<%=beanobj.getName()%>"  name="name" placeholder="Name here">
     </div><br>
     <div class="from-group row">
     <label for="contact" class="col-md-4 text-right control-label col-from-label">Phone No</label>
     <input type="text" class="from-control" id="contact" value="<%=beanobj.getContact()%>"  name="contact" placeholder="Contact no here">
     </div><br>
     <div class="from-group row">
     <label for="email" class="col-md-4 text-right control-label col-from-label">Email</label>
     <input type="email" class="from-control" id="email" value="<%=beanobj.getEmail()%>"  name="email" placeholder="Email Id here">
     </div><br>
     <div class="from-group row">
     <label for="aliesname" class="col-md-4 text-right control-label col-from-label">Alies Name</label>
     <input type="text" class="from-control" id="aliesname" value="<%=beanobj.getAliesname()%>"  name="aliesname" placeholder="Aliesname here">
     </div><br>
    									 <div class="from-group row">
    									 <label for="role" class="col-md-4 text-right control-label col-from-label">Role</label>
                                         
                                          <select class="abc"name="role"> 
                                          <option><%=beanobj.getRole()%></option>
                                              <option value="TeamLeader">Team Leader</option>
                                              <option value="Developer">Developer</option>
                                              <option value="Tester">Tester</option>
                                          </select>
                                          </div>
                                          </div>
									<div class="modal-footer f">
				<button type="submit" class="btn btn-success btn-md">Update</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
</div>
	<%
		}
	%>
	</div>
</form>