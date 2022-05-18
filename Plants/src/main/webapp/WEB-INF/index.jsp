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
 <link rel="stylesheet" type="text/css" href="/css/style.css" >
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
    <div class="container"> <!-- Beginning of Container -->

     
    
    <div class="login-reg">
    
    
    
    
     	<div class="logBox">
  		<form:form class="login form " action="/register" method="post" modelAttribute="newUser">
  				<h1> Login </h1>
  			
  			<label> First Name</label>
		    <div>
		        <form:errors path="firstName"/>
		        <form:input path="firstName"/>
		   </div>
		   
		    
		     <label>Last Name </label>
		    <p>
		       
		        <form:errors path="lastName"/>
		        <form:input path="lastName"/>
		    </p>
		    
		    <label>Email</label>
		    <p>
		       
		        <form:errors path="email"/>
		        <form:input path="email"/>
		    </p>
		     <label>Password</label>
		    <p>
		   
		        <form:errors path="password"/>
		        <form:password path="password"/>
		    </p>
		    
		     <label>Confirm</label>
		    <p>
		       
		        <form:errors path="confirm"/>     
		        <form:password path="confirm"/>
		    </p>  
		   
			    <input type="submit" value="Register"/>
			</form:form> 
		
		</div>     
  
  
  
  
  <form:form class="form-reg" action="login" method="post" modelAttribute="newLogin">
  
  				<div>
  				<h1>  Reg</h1>
  
  					</div>			
				<label>Email</label>	    
		    <p>
		        <form:errors path="email"/>
		        <form:input path="email"/>
		    </p>
		     
		     
		     <label>Password</label>
		    <p>
		        <form:errors path="password"/>
		        <form:password path="password"/>
		    </p>
		   
		   
			    <input type="submit" value="Login"/>
		</form:form> 
		
		</div>
    
    
        
    </div> <!-- End of Container -->
</body>
</html>