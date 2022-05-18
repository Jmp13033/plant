<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title Here</title>
 <link rel="stylesheet" type="text/css" href="/css/edit.css" >
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
    
    
    <div class="container"> <!-- Beginning of Container -->
   <h1 class="edit"> Edit </h1>
   
   
    
    
    
    
    <div class="form_container">
	     <form:form action="/editingPlant/${plant.id}" method="post" modelAttribute="plant">
			   <input type="hidden" name="user" value="${plant.user.id}">
			    <input type="hidden" name="_method" value="Put">
			   

			 <div class="area">
			 
				 	<label> name </label>
				    <p>
				     
				        
				        <form:errors path="name"/>
				        <form:input path="name"/>
				     </p>
				        	
			    </div>
				
				<div class="area">

					<label>Last description </label>	 
				    <p>
				       
				        <form:errors path="description"/>
				        <form:input path="description"/>
				    </p>
			    </div>
			    
			    
			    <div class="area">
			    
				      <label>Watering Schedule </label>
				    <p>
				     
				        <form:errors path="schedule"/>
				        <form:input path="schedule"/>
				    </p>
			    </div>
			    
			    <div class="button_container">
			   
				 	<input type="submit" value="edit plant"/>
				    
				  </div>
			</form:form>  
		
		</div>
    
    
    
  
    
    
        
    </div> <!-- End of Container -->
</body>
</html>