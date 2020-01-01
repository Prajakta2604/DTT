<%@ page import="Bean.AddProjectBean,java.util.List"%>
<%@ page import="DAO.AddProjectDao" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../required/assets/images/favicon.png">
    <title>Project Details</title>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../required/assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../required/assets/libs/jquery-minicolors/jquery.minicolors.css">
    <link rel="stylesheet" type="text/css" href="../required/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="../required/assets/libs/quill/dist/quill.snow.css">
    <link href="../required/dist/css/style.min.css" rel="stylesheet">
    
      <link href="../required/dist/css/AddProject.css" rel="stylesheet">
        <link href="../required/dist/css/styleborder.css">
        
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->


</head>
<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <%@ include file="Header.jsp" %>
     <%@ include file="LeftNav.jsp" %>
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            
            
         
        
            <div class="container-fluid">
            <div class="row">
            <div class="col-md-12">
            <div class="card" align="center"></div>
            </div>
            </div>
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                        <div class="card-body" style="background: linear-gradient(to bottom left, gray, transparent);" >
                            <form action="../AddProject_Action" method="post"  style="margin-left: 120px; text-align: center">
                             <fieldset class="col-md-10">
										<legend class="legend_border col-sm-3"
											style="padding-right: 5px;">Add Project</legend>
										
                              <div class="form-group row">
                                 <div class="col-sm-2" ><label for="name"></label></div>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="Project_Name" maxlength="50" placeholder="PROJECT NAME" 	onkeypress="return alphaOnly(event);"
													style="text-transform: uppercase;" required >
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-2" ><label for="name"></label></div>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="Soft_Tools" maxlength="100" placeholder="SOFTWARE PACKAGE NAME" 	onkeypress="return alphaOnly(event);"
													style="text-transform: uppercase;" required >
                                        </div>
                                    </div>
                                    
                                     <div class="form-group row">
                                     <div class="col-sm-2" ><label for="name"></label></div>
                                     <div class="col-sm-8">
                                       <input type="text" class="form-control mydatepicker"
													id="Start_DateID" name="Start_Date" placeholder="MM/DD/YYYY">
											</div>	
                                    </div>
                                    
                                    <div class="form-group row">
                                       <div class="col-sm-2" ><label for="name"></label></div>
                                        <div class="col-sm-8">
                                          <div class="input_fields_wrap">
                                            <div><input type="text" class="form-control" name="No_Of_Modules" maxlength="15" placeholder="NO OF MODULES" onkeypress="return isNumberKey(event);" required>
                                            <button class="btn btn -sm btn-primary and_more_button">Add More Fields</button>
                                             </div>
                                           </div>
                                     
                                  </div>
                                                      
                               </div>
                              
                                   
                                <div class="border-top">
                                    <div class="card-body">
                                       <button class="btn btn-success btn-md"
													style="border-radius: 12px" type="submit">Submit</button>
                                        <button class="btn btn-warning btn-md"
													style="border-radius: 12px; margin-left: 30px" type="reset"
													class="btn btn-primary" value="Reset">Cancel</button>
                                    </div>
                                   </div>
                               </fieldset>
                                </form>
                        </div>
                      </div>
                  </div>
                  </div>
                  
                	<div class="card"  >
                            <div class="card-body" style="background: gray;">
                            		<fieldset class="col-md-12">
							<legend class="legend_border col-sm-3"
								style="padding-right: 5px;"> Project Datatable</legend>
                                <div class="table-responsive">
                                    <table  class="table" >
                                        <thead>
                                           <tr class="font-weight-bold">
                                                <th><b>Sr. No</b></th>
                                                <th><b>Project Name</b></th>
                                                <th><b>Software Tool</b></th>
                                                <th ><b>Start_Date</b></th>
                                                <th><b>Actions</b></th>
                                            </tr>
                                            </thead>
                                            <%
                                                int i=0;
                                    		 
                                    		   int pm_id=0;
                                              List<AddProjectBean> projectlist=AddProjectDao.getProjectNames();
                                              for(AddProjectBean beanObj:projectlist)
                                              {
                                            	  
                                            	 pm_id=beanObj.getPM_Id();
                                            System.out.println("id in jsp " +pm_id);
                                            %>
                                            <tbody>
                                            <tr>
                                            <td><%=++i%></td>
                                          
                                            <td><%=beanObj.getProject_Name() %></td>
                                            <td><%=beanObj.getSoft_Tools() %></td>
                                            <td><%=beanObj.getStart_Date() %></td>
                                            <td>
    <button type="button" class="btn btn-danger btn-xs mdi mdi-delete-forever" onclick="getDeleteProjectId(<%=beanObj.getPM_Id() %>);" data-toggle="modal" data-target="#myModal"></button>&nbsp;&nbsp;
    <button type="button" class="btn btn-success btn-xs mdi mdi-grease-pencil"  onclick="getUpdateProjectId(<%=beanObj.getPM_Id() %>);" data-toggle="modal" data-target="#myModal1"></button>
                                            </td>
                                            </tr>
                                            <%
                                            
                                            }%>
                                            </tbody>
                                            
                                    </table>
                                </div>
					</fieldset>
                            </div>
                        </div>
                        
  
  	               <!--********deleteModal view ********* -->
					<div class="modal  displayDeletecontent" id="myModal" role="dialog">
					</div>
					<!--**********update modal view******* -->	
					 <div class="modal displayUpdatecontent" id="myModal1" role="dialog"></div>
		 
                   
                     


					
  
               
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
           
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
      <script src="../required/dist/js/Defecttrackingtool.js"></script>
    <script src="../required/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../required/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="../required/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="../required/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="../required/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="../required/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../required/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../required/dist/js/custom.min.js"></script>
    <!-- This Page JS -->
    <script src="../required/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <script src="../required/dist/js/pages/mask/mask.init.js"></script>
    <script src="../required/assets/libs/select2/dist/js/select2.full.min.js"></script>
    <script src="../required/assets/libs/select2/dist/js/select2.min.js"></script>
    <script src="../required/assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
    <script src="../required/assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
    <script src="../required/assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
    <script src="../required/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
    <script src="../required/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="../required/assets/libs/quill/dist/quill.min.js"></script>
    <script>
        //***********************************//
        // For select 2
        //***********************************//
        $(".select2").select2();

        /*colorpicker*/
        $('.demo').each(function() {
        //
        // Dear reader, it's actually very easy to initialize MiniColors. For example:
        //
        //  $(selector).minicolors();
        //
        // The way I've done it below is just for the demo, so don't get confused
        // by it. Also, data- attributes aren't supported at this time...they're
        // only used for this demo.
        //
        $(this).minicolors({
                control: $(this).attr('data-control') || 'hue',
                position: $(this).attr('data-position') || 'bottom left',

                change: function(value, opacity) {
                    if (!value) return;
                    if (opacity) value += ', ' + opacity;
                    if (typeof console === 'object') {
                        console.log(value);
                    }
                },
                theme: 'bootstrap'
            });

        });
        /*datwpicker*/
        jQuery('.mydatepicker').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        var quill = new Quill('#editor', {
            theme: 'snow'
        });

    </script>
    <script type="text/javascript">
    function getDeleteProjectId(id){
    	//alert("hi" + id);
    	$.ajax({
    		type:"POST",
    		url:"../DeleteProjectByIdServlet",
    		data:{pmid : id},
    		success: function(response){
    			$(".displayDeletecontent").html(response);
    		}
    	});//alert("bye");
    }
    </script>
   
   <script type="text/javascript">
   function getUpdateProjectId(id)
   {
	   $.ajax({
		   type:"POST",
		   url:"../UpdateProjectByIdServlet",
		   data:{uid : id},
		   success: function(response)
		   {
			   $(".displayUpdatecontent").html(response);
		   }
	   });
   }
   </script>
</body>

</html>