<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>Getting Started: Handling Form Submission</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>	


 <div class="panel-heading">  <h2 class="panel-title text-center" style ="color:white"><b> Search Results </b></h2></div>
                      <div class="panel-body">
                			<div class="tablehieghtlimt">
                               <div class="table-responsive">
                                    <table class="table table-bordered" style = "color:white">
                                        <thead>
                                            <tr>
                                             
                                                <th>User Name</th>
                                                <th>User emai Address</th>
                                                <th>Card name</th>
                                                <th>Message</th>
                                                <th>Card</th>
                                                <th>Event</th>
                                              
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            
                                            <c:forEach var="user" items="${users}">
										        	<tr>
										        		
														<td>${user.name}</td>
														<td>${user.email}</td>
														<td>${cname}</td>
														<td>${msg}</td>
													<td><img style="height:100px;width:100px" src="SendingCards/${path}"></td>
													<td>${event}</td>
														
	
										        	</tr>
											</c:forEach>	 
                                                
                                        
                                          
                                        </tbody>
                                    </table>
                                </div> 
                              </div>    
                	
                    
                    </div>
  </body>
</html>