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

<html class="background">
    <head>
      <title>Groupe 5</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css.css">
    </head>
    <body class="bg-transparent">

        <div class="container py-5">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center text-dark mb-4">Groupe 5</h2>
                    <div class="row">
                        <div class="col-md-6 mx-auto">

                            <!-- form card login -->
                            <div class="card rounded bg-dark text-white">
                                <div class="card-header">
                                    <h3 class="mb-0">Connexion</h3>
                                </div>
                                <div class="card-body">
                                  <form class="form" autocomplete="off" action="./action.jsp" method="post">
                                      <%
                                          if(session.getAttribute("error") != null){
                                              out.print(session.getAttribute("error"));
                                              session.setAttribute("error", null);
                                          }
                                      %>
                                    <div class="form-group">
                                      <label for="log">Login :</label>
                                      <input type="text" class="form-control form-control-lg rounded" id="log" name="log" placeholder="Login" required autofocus>
                                    </div>
                                    <div class="form-group">
                                      <label for="pwd">Password :</label>
                                      <input type="password" class="form-control form-control-lg rounded" id="pwd" name="pwd" placeholder="Password" required>
                                    </div>
                                    <button class="btn buttonGradient" type="submit" value="Submit">Valider</button>
                                    <button class="btn btn-secondary" type="reset" value="Reset">Annuler</button>
                                  </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
