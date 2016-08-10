<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
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
<div class = "box"> 
 <div class = "raw">
                    <div class = "text-center"><button type="button" class = "btn btn-primary"
                                                       data-toggle="modal" data-target ="#modal-1">Click Here TO Uplaod new Card Templates</button>
                    </div>
                    <div class = "modal fade" id = "modal-1">
                        <div class ="modal-dialog">
                            <div class ="modal-content">
                                <div class ="modal-header modal-header-success">
                                    <button type ="button" class ="close" data-dismiss ="modal" style="color:white"> &times;</button>
                                    <h3 class ="modal-title">Upload A New Card Template</h3>
                                </div>
                                <div class ="modal-body">
                                     <div class ="row">
                     
                     <div class="box">
                    <form:form class="form-horizontal" commandName="greeting" method="POST" action="submittemplate" modelAttribute="Template" enctype="multipart/form-data">
                        
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
                        <div class ="form-group col-md-6">
                         <label for ="events">select the Event</label>
                                 <select class="form-control" name="event_name1" id ="event_clip1"> 
                  <c:forEach items="${events}" var="event">
            <option>${event.name}</option>
        </c:forEach>
                            </select>
                        </div>
					<div class = "form-group col-md-12">
					<label for ="fileinput">Select the Image</label>
				<input type="file" id="fileinput" name="temp_image" size="50" accept=".jpg" />
			</div>
			<div class ="col-lg-6"></div>
                        <div class ="col-md-6 text-right">
                            <button type ="submit" class ="btn btn-primary">Upload Card Template</button>
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
 <div class="col-md-3"> 
  
 <a href = "tempdownload/${clips.path}"><img class="img-responsive" style="height:225px;width:150px" src="ctemplate/${clips.path}"alt=""></a>
 <p>${clips.path}</p>

 </div>  
</c:forEach>
 	
</div>                                  
</div>
</div>
</body>
</html>