<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


		<script>
		
	function checkFilesize(){
		var input = document.getElementById("fileinput");
		var file = input.files[0];
		
		
		if(file.size > 1024000){
			document.getElementById("errorText").innerHTML = "File size exceeds the limit";
			document.getElementById("submitbutton").type = "button";

		}
		
		else{
			document.getElementById("submitbutton").type = "submit";
			document.getElementById("submitbutton").submit();
		}
		
	}
		
		</script>
<h1>Spring MVC File Upload Demo</h1>
		<form:form method="post" action="uploadFile" enctype="multipart/form-data" >
			<table border="0">
						<tr>
					<td>Pick file </td>
					<td><input type="file" id="fileinput" name="file" size="50" accept=".jpg" /></td>
				</tr>
				
				<tr>
					<td>
					<input type="button" value="upload" id="submitbutton" onClick="checkFilesize()"/>
					</td>
				</tr>
				
				
				
			</table>
		</form:form>
		<h3 id="errorText"></h3>
		
		<img src = "img/slide-15.jpg"/>
	
</body>
</html>