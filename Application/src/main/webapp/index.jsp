<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <title>Web App</title>
</head>
<body>
   <div class="container h-100 d-flex justify-content-center">
      <div class="jumbotron my-auto">
         <h3 class="display-3">Hello World</h3>
         <div class="alert alert-success" role="alert">
           <b>Server Time   :</b> <%= new java.util.Date() %><br>
         </div>
      </div>
   </div>
</body>
</html>
