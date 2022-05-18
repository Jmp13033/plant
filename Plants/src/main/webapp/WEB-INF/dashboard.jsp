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
<body class="body_dashboard">

<h1> Welcome to the Plants  ${user.firstName} </h1>

<a class="create mg10 none" href="/newPlant"> Make An Plant </a>

    <table class=" main_table table table-dark table-striped table-hover">

      <thead>

        <tr>
          <th class="align-middle">Description</th>
          <th class="align-middle"> Schedule </th>
           <th class="align-middle">First Name</th>
            <th class="align-middle">Last Name</th>
             <th class="align-middle">Actions</th>
           
           
        </tr>
        </thead>
       
        <tbody>
            <c:forEach var="i" items="${allplants}">
            <tr>
            <td><c:out value="${i.description}"></c:out></td>
            <td><c:out value="${i.schedule}"></c:out></td>
            <td><c:out value="${i.user.firstName}"></c:out></td>
            <td><c:out value="${i.user.lastName}"></c:out></td>
          <td><a class="mg10 btn btn-primary"href="/editPlant/${i.id}">Edit-Plant</a><a class=" mg10 btn btn-primary" href="/delete/${i.id}">Delete-Plant</a><a class=" mg10 btn btn-danger" href="/onePlant/${i.id}">Show-One-Plant</a> </td>
            </tr>
            
            </c:forEach>
        
        
        
        </tbody>


    </table>
    



   
</body>
</html>