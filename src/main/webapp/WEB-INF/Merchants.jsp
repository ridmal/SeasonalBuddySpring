<%-- 
    Document   : contact
    Created on : 16-Nov-2015, 17:49:16
    Author     : ridmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Contact - Business Casual - Start Bootstrap Theme</title>

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
        <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    	<script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

	<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
	<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

	<!--Font Awesome (added because you use icons in your prepend/append)-->
	<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
   
     <script>
		$(document).ready(function(){
			var date_input=$('input[name="date"]'); 
			var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
				date_input.datepicker({
				format: 'dd/mm',
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
                        <a href="merchants"><b>Merchants</b></a>
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
            <div class="box col-md-5">
                <div class="col-md-12">
                    <hr>
                    <h2 class="intro-text text-center"><strong>Advertisements</strong>
                   
                    </h2>
                    <hr>
                    <p></p>
                     <form:form commandName="command" method="POST" action="submitAdd" modelAttribute="advertisement" enctype="multipart/form-data">
                        <div class="row">
                         <div class="form-group col-md-12">
                                <label>Merchant UserName</label>
                                <input type="text" class="form-control" name="muname">
                            </div>
                            <div class="form-group col-md-12">
                                <label>Advertisement name</label>
                                <input type="text" class="form-control" name="addname">
                            </div>
                                
                          		<div class = "form-group col-lg-12">
					<label for ="fileinput">Upload Advertisement</label>
				<input type="file" id="fileinput" name="add_image" size="50" accept=".jpg" />
			</div>
			          <div class ="form-group col-md-12">
                         <label for ="events">select the size of Advertisement</label>
                                 <select class="form-control " name="addsize" id ="addsize"> 
                  <c:forEach items="${addsizes}" var="size">
            <option>${size}</option>
        </c:forEach>
                      </select>
                        </div>
                         <div class ="form-group col-md-6">
                         <label for ="events">Select the Event</label>
                                 <select class="form-control" name="addevent" id ="addevent"> 
                  <c:forEach items="${events}" var="event">
            <option>${event.name}</option>
        </c:forEach>
                      </select>
                      </div>
                      <div class = "col-md-1"></div>
                       <div class ="form-group col-md-6">
                         <label for ="events">Select the Category</label>
                                 <select class="form-control" name="addcategory" id ="addcategory"> 
                  <c:forEach items="${addcategory}" var="category">
            <option>${category}</option>
        </c:forEach>
                      </select>
                      </div>
                            <div class="clearfix"></div>
                            <div class="form-group col-md-12">
                                <label>Message</label>
                                <textarea class="form-control" rows="6" name="message"></textarea>
                            </div>
                            <div class = "col-md-12"></div>
                                         <div class ="form-group col-md-6">
                         <label for ="events">Payment Type</label>
                                 <select class="form-control" name="payment" id ="event_card"> 
                  <c:forEach items="" var="event">
            <option></option>
        </c:forEach>
                      </select>
                      </div>
                            <div class="form-group col-md-12">
                                <input type="hidden" name="save" value="contact">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
                    </form:form>
                    <div><p style="color:red">${message}</div>
                </div>
            </div>
            <div class = "col-md-2"></div>
            <div class="box col-md-5">
                <div class="col-md-12">
                    <hr>
                    <h2 class="intro-text text-center"><strong>Send Greeting cards</strong>
                   
                    </h2>
                    <hr>
                    <p></p>
                    <form:form commandName="command" method="POST" action="sendcardtousers" enctype="multipart/form-data">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>Card Name</label>
                                <input type="text" class="form-control" name="c_name">
                            </div>
                            <div class = "col-md-12">
                                  <div class ="form-group col-md-6">
                         <label for ="events">select the Event</label>
                                 <select class="form-control" name="event" id ="event"> 
                  <c:forEach items="${events}" var="event">
            <option>${event.name}</option>
        </c:forEach>
                      </select>
                        </div>
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
                          		<div class = "form-group col-md-12">
					<label for ="fileinput">Select the Card</label>
				<input type="file" id="fileinput" name="card_image" size="50" accept=".jpg" />
			</div>
                            <div class="form-group col-md-12">
                                <label>Amount of Users</label>
                                <input type="number" class="form-control" name="numofusers">
                            </div>
                            
                            
                            <div class="form-group col-md-12">
                                <label>Additional Message</label>
                                <textarea class="form-control" rows="6" name ="amsg"></textarea>
                            </div>
                            <div class = "col-md-12">
                                         <div class ="form-group col-md-6">
                         <label for ="events">Payment Type</label>
                                 <select class="form-control" name="event_name" id ="event_card"> 
                  <c:forEach items="" var="event">
            <option></option>
        </c:forEach>
                      </select>
                      </div>
                      </div>
                            <div class="form-group col-md-12">
                                <input type="hidden" name="save" value="contact">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container -->

    


</body>

</html>
