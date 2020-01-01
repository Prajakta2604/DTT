<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<style>
.navbar-right{
  margin-left:5px;
  width:100%;
}
.header{
background-color:black;

}
.rightNav{
list-style-type: none;

}
ul.rightNav li{
  display: inline-block;
}
.logo-text{
font-family: times, serif;
font-style: italic;
font-size: 25px;
margin-left: 200px;
}
</style>
<script src="../required/assets/libs/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
function DynamicTime() {
	 var today = new Date();
	  var h = today.getHours();
	  var m = today.getMinutes();
	  var s = today.getSeconds();
	  var ampm = h >= 12 ? 'PM' : 'AM';
	  h = h % 12;
	  h = h ? h : 12;
	  m = checkTime(m);
	  s = checkTime(s);
	  document.getElementById('ct').innerHTML = today.toDateString() + " " +
	  h + ":" + m + ":" + s+ ' ' + ampm;
	  var t = setTimeout(DynamicTime, 500);
	}
	function checkTime(i) {
	  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
	  return i;
	}
</script>
</head>
<body onload="DynamicTime()">

<header class="topbar"data-navbarbg="skin2" >
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<div class="navbar-header" data-logobg="skin5">
				<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a> <a class="navbar-brand" href="index.html"> <b
					class="logo-icon p-l-10"> <i class="wi wi-sunset"></i> <img
						src="../required/assets/images/.jpeg" alt="Defect Tracking Tool"
						class="light-logo" />

				</b> <span class="logo-text"style="color: black; font-family: times, serif; font-style: italic;" ></span>


				</a>
				
			</div>
				
				<div class="navbar-right" class="navbar navbar-expand-sm bg-dark navbar-dark">
					<ul class="float-right rightNav">
					<li style="color:white"><h4><span id='ct'></span></h4></li>
					<li><a href="../Login.jsp" class="btn btn-danger btn-sm"><span class="fa fa-power-off"></span>Logout</a></li>
					</ul>
				</div>

			
			</nav>
		</header>
</body>
</html>