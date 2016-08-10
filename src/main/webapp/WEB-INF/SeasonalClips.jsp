<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/SeasonalBuddy.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
       <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/lightbox.min.js"></script>
     <!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
	<script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

	<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
	<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

	<!--Font Awesome (added because you use icons in your prepend/append)-->
	<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
   
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Seasonal Clips</title>


 <script>
		$(document).ready(function(){
			var date_input=$('input[name="date"]'); 
			var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
				date_input.datepicker({
				format: 'dd/mm/yyyy',
				container: container,
				todayHighlight: true,
				autoclose: true,
				enableOnReadonly:false,
			
				})

			})
	</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>

</head>
<body>

   <div class = "container">
<div class = "row">
<div class = "col-md-6">

    <div class="brand">Seasonal Buddy</div>
</div>
    <!-- Navigation -->
    <div class = "col-md-6" align="right">
    <nav class="navbar navbar-default" role="navigation">
     

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
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index"><b>Home</b></a>
                    </li>
                 <li>
                     <a href="about"><b>About</b></a>
                    </li>
                    <li>
                        <a href="blog"><b>Blog</b></a>
                    </li>
                    <li>
                       <a href ="merchants"><b>Merchants</b></a>
                    </li>  
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
       
        <!-- /.container -->
    </nav>
    </div>
    </div>
    </div>
<div class = "container">
<div class = "box"> 
 <div class = "raw">
                    <div class = "text-center"><button type="button" class = "btn btn-primary"
                                                       data-toggle="modal" data-target ="#modal-1">Click Here TO Uplaod new Clips</button>
                    </div>
                    <div class = "modal fade" id = "modal-1">
                        <div class ="modal-dialog">
                            <div class ="modal-content">
                                <div class ="modal-header modal-header-success">
                                    <button type ="button" class ="close" data-dismiss ="modal" style="color:white"> &times;</button>
                                    <h3 class ="modal-title">Upload A New Clip</h3>
                                </div>
                                <div class ="modal-body">
                                     <div class ="row">
                     
                     <div class="box">
                    <form:form class="form-horizontal" commandName="greeting" method="POST" action="submitclip" modelAttribute="clip" enctype="multipart/form-data">
                        
                        <div class ="form-group col-md-12">
                            <label for ="name1">Clip Name</label>
                            <input type ="text" name="name" id="name1" class = "form-control">
                         </div>
       <div class="form-group col-md-12">
      <div class="col-md-6">
        <lable><b>Date</b></lable>
      	  <div class="input-group">
       	<div class="input-group-addon">
         <i class="fa fa-calendar">
         </i>
        </div>
        	<input class="form-control" id="date" name="date" placeholder="DD/MM/YYYY" type="text" value="${xDateOfEntry}">
       </div>
      </div>
      </div>
                          <div class ="form-group col-md-12">
                            <label for ="type1">Clip type</label>
                            <input type ="text" name ="type"  id ="type1" class = "form-control">
                            
                        </div>
                        <div class ="form-group col-md-12">
                        <div class ="col-md-6">
                         <label for ="events">select the Event</label>
                                 <select class="form-control" name="event_name1" id ="event_clip1"> 
                  <c:forEach items="${events}" var="event">
            <option>${event.name}</option>
        </c:forEach>
                            </select>
                        </div>
                        </div>
					<div class = "form-group col-md-12">
					<label for ="fileinput">Select the Image</label>
				<input type="file" id="fileinput" name="clip_image" size="50" accept="image/*" />
			</div>
			<div class = "col-md-6"></div>
                        <div class ="col-md-6 text-right">
                            <button type ="submit" class ="btn btn-primary">Upload Clip</button>
                        </div>
                </form:form> 
                </div>
                </div>
                                </div>
                            </div>     
                        </div>
                        </div>
</div>
</div>
<div class = "box">
   <div class = "raw">  
                          
 <c:forEach var="clips" items="${res}">
 <div class="col-md-2"> 
  
 <a href = "clipdownload/${clips.path}"><img class="img-responsive" style="height:200px;width:150px" src="clips/${clips.path}"alt=""></a>
 <p>${clips.name}</p>

 </div>  
</c:forEach>
 	
</div>                                  
</div>
</div>
</body>
</html>