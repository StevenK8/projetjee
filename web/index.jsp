<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
  if(session.getAttribute("log")!=null && session.getAttribute("log").equals("admin")){
    response.sendRedirect("admin.jsp");
  }else if(session.getAttribute("log")!=null && session.getAttribute("log").equals("user")){
    response.sendRedirect("user.jsp");
  }
%>
<jsp:include page="header.html" />

<html>
<head>
  <title>Groupe 5</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css.css">
</head>
  <body class=".background">

    <h1>Groupe 5</h1>
    <hr>
    <div class="container">
      <form action="./action.jsp" method="get">
        <div class="form-group">
          <label for="log">Login :</label>
          <input type="text" class="form-control" id="log" name="log" placeholder="Login">
        </div>
        <div class="form-group">
          <label for="pwd">Password :</label>
          <input type="text" class="form-control" id="pwd" name="pwd" placeholder="Password">
        </div>
        <button class="btn btn-primary" type="submit" value="Submit">Valider</button>
        <button class="btn btn-secondary" type="reset" value="Reset">Annuler</button>
      </form>

      <%
        if(session.getAttribute("error") != null){
          out.print(session.getAttribute("error"));
          session.setAttribute("error", null);
        }
      %>
    </div>
</body>
</html>
