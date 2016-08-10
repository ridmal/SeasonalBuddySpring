<%-- 
    Document   : signin
    Created on : 18-Nov-2015, 16:56:50
    Author     : ridmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : index
    Created on : Nov 16, 2015, 5:47:18 PM
    Author     : ridmal
--%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SeasonalBuddy</title>
        <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
 <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/SeasonalBuddy.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  	<script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

	<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
	<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

	<!--Font Awesome (added because you use icons in your prepend/append)-->
	<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<script>
		$(document).ready(function(){
			var date_input=$('input[name="bday"]'); 
			var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
				date_input.datepicker({
				format: 'dd/mm',
				container: container,
				todayHighlight: true,
				autoclose: true,
				enableOnReadonly:false,
			
				});

			});
	</script>
	
	
	<script>
	function doCheckName() {  
   var uname = document.getElementById("uname").value;
	    $.ajax({  
	     type : "POST",   
	   	 url : "CheckUserName",   
	     data : "uname = rid",  
	     success : function(response) {  
	    	 var num = response;
	    	
	    		 //document.getElementById("Checkuname").setAttribute("class", "error");
	    		 document.getElementById("Checkuname").innerHTML = num;
	    		 //document.getElementById("submitbtn").setAttribute("type", "button");
	    	
	    	 
	     },  
	     error : function(e) {  
	      alert('Error: ' + e);   
	     }  
	    }); 
	   } 
	</script>
	<script>
function validateForm() {
    var x = document.forms["myForm"]["email"].value;
    var y = document.forms["myForm"]["pass"].value;
    var z = document.forms["myForm"]["cpass"].value;
    if(y!=z){
    	alert("Password confirmation is not valid...please try again");
    }
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
   
}
</script>
</head>

<body>
 <div class = "container">
<div class = "row">
<div class = "col-md-6">

    <div class="brand">Seasonal Buddy</div>
</div>
    <!-- Navigation -->
    <div class = "col-md-6" align="right">
    <nav class="navbar navbar-default text-center" role="navigation">
       

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.jsp">Seasonal Buddy</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" >
                   <li>
                        <a href="index"><b>Home</b></a>
                    </li>
                 <li>
                     <a href="about"><b>About</b></a>
                    </li>
                    <li>
                        <a href="blog"><b>Blog</b></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
     
        <!-- /.container -->
    </nav>
    </div>
    </div>
    </div>

    <div class="container">

       
        <div class="row">
        <div class = "col-md-3"></div>
            <div class="box3 col-md-6">
                <div class="col-md-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Sign In</strong>
                    </h2>
                    <hr>
                    
                    <form:form method ="POST" action ="userinsertdata" commandName="candidate" modelAttribute="user" enctype="multipart/form-data" name="myForm">
                          
                        <div class ="form-group">
                            <label for="name1" class ="sr-only">Name</label>
                            <input type ="text" id ="name1" name ="name" class = "form-control" placeholder="Enter the Name" required="required">
                        </div>
                        <div class ="form-group">
                            <label for ="uname" class ="sr-only">User Name</label>
                            <input type ="text"  id="uname" name ="uname" value="${xuname}" class ="form-control" placeholder="Select a user name" required="required"
                        >
                             <!--  div class="col-md-4">
							 <p id="Checkuname"></p>
							 </div>-->
                        </div>
                        <div class ="form-group">
                            <label for ="pass" class ="sr-only">Password</label>
                            <input type ="password" name ="pass" id ="pass" class = "form-control" placeholder="Enter the password" required="required"
                            onkeypress=" return doCheckName()">
                        </div>
                        
                <div class ="form-group">
                            <label for ="cpass" class ="sr-only">Confirm Password</label>
                            <input type ="password" name ="cpass" id="cpass" class = "form-control" placeholder="Confirm the password">
                        </div>
      <div class="form-group col-md-12">
      <div class="col-md-6">
      	  <div class="input-group">
       	<div class="input-group-addon">
         <i class="fa fa-calendar">
         </i>
        </div>
        	<input class="form-control" id="bday" name="bday" placeholder="Birthday" type="text" value="${xDateOfEntry}">
       </div>
      </div>
      </div> 
         
            <div class ="form-group col-md-6 text-right">
                         <label for ="event_card"></label>
                                 <select class="form-control text-right" name="religious" id ="event_card" placeholder="Select the religious"> 
                  <c:forEach items="${religion}" var="rel">
            <option>${rel}</option>
        </c:forEach>
                            </select>
                        </div>
                           <div class ="form-group" >
                            <label for ="email" class ="sr-only">E-Mail</label>
                            <input type ="text" name ="email" id="email" class = "form-control" placeholder="Enter Your Email" required="required" onchange="return validateForm()">
          </div>  
                        <div class ="text-right">
                            <button type ="submit" class ="btn btn-primary" id ="submitbtn" onclick="return validateForm()">Sign IN </button>
                        </div>
                    </form:form>
                    
            </div>
        </div>
       
    </div>
    <!-- /.container -->

</div>


</body>

</html>
