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
 <link rel="stylesheet" type="text/css" href="/css/one.css" >
<meta charset="UTF-8">
<title>Title Here</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
   <div class="container"> <!-- Beginning of Container -->
   <h1> Welcome ${user.firstName} check out this plant  </h1>
   
    <a class=" pad btn btn-primary" href="/dashboard">Dashboard</a>
    
   <br/>
      <table class=" main_table table table-dark table-striped table-hover">

      <thead>

        <tr>
          <th class="align-middle">Name</th>
          <th class="align-middle"> Description</th>
           <th class="align-middle">Schedule</th>
        </tr>
        </thead>
       
        <tbody>
            <tr>
            <td>${plant.name}</td>
          	<td>${plant.description}</td>
          	<td>${plant.schedule}</td>
            </tr>
            
        
        
        
        </tbody>


    </table>
 
   
  
    
    
    
        
    </div> <!-- End of Container -->
</body>
</html>