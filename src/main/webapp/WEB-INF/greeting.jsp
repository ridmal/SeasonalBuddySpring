<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Getting Started: Handling Form Submission</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    

    <!-- Custom CSS -->
    <link href="css/SeasonalBuddy.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<form:form class="form-horizontal" commandName="candidate" method="POST" action="submitgreeting" modelAttribute="greeting" enctype="multipart/form-data">
        
       				<div class="form-group">
							<label for="id1" class="col-sm-4 control-label">ID<span class="asteriskField">*</span></label>
        					<div class="col-sm-4">
            				<input type="text" class="form-control" id="id1" placeholder="Name with Initials" name="id"/>
							 </div>
							 <div class="col-sm-4">
  		
					</div>
					</div>
					
					<div class="form-group">
							<label for="fullNameId" class="col-sm-4 control-label">Content<span class="asteriskField">*</span></label>
        					<div class="col-sm-4">
            				<input type="text" class="form-control" id="fullNameId" placeholder="Full Name" name="content"/>
							 </div>
							 <div class="col-sm-4">
							 
					</div></div>
					<div class="form-group">
							<label for="addressid" class="col-sm-4 control-label">Address<span class="asteriskField">*</span></label>
        					<div class="col-sm-4">
            				<input type="text" class="form-control" id="addressid" placeholder="Address" name="address"/>
							 </div>
							 <div class="col-sm-4">
							 
					</div></div>
				
  		
			<div>
					<div>
					<p>Pick file </p>
				<input type="file" id="fileinput" name="file" size="50" accept=".jpg" />
			</div>
				
				</div>
				
	
		
		    <div class="form-group">
		        <div class="col-sm-offset-4 col-sm-2">
		            <button type="submit" class="btn btn-warning" id="submitbutton">Submit</button>
		        </div>
		    </div>
		</form:form>
</body>
</html>
