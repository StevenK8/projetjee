<%-- 
    Document   : admin
    Created on : 5 févr. 2019, 09:55:20
    Author     : skerautr
--%>
<%
    if(session.getAttribute("log") == null || !session.getAttribute("log").equals("admin")){
        response.sendRedirect("index.jsp");
    }
%>
<jsp:include page="header.html" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
        <link rel="stylesheet" href="css.css">
    </head>
    <body class="background">
        <div style="float:right">
            <form name="form1" method="post" action="disconnect.jsp">
                <input class="btn btn-danger" name="submit" type="submit" id="submit" value="Déconnexion">
            </form>
        </div>
        <h1>Bienvenue, <%=session.getAttribute("log")%>!</h1>
        
        <hr>
         <div class="container py-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-dark table-bordered ">
                            <thead class="thead thead-dark">
                                <tr>
                                    <th scope="col">Nombre de coups</th>
                                    <th scope="col">Nombre de parties</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                
                                int nparties=3,i=0,sum=0;
                                int[] ncoups = new int[nparties]; // Nombre de coups pour chaque partie
                                int[][] tableau = new int[20][2];

                                for (i=0; i<nparties; i++){
                                    if(ncoups[i]!=0){
                                        tableau[ncoups[i]][0] = ncoups[i];
                                        tableau[ncoups[i]][1]++;
                                    }
                                }

                                for (i=0; i<nparties; i++){
                                    if(ncoups[i]!=0){
                                        out.print("<tr>");
                                            out.print("<td>"+tableau[i][0]+"</td>");
                                            out.print("<td>"+tableau[i][1]+"</td>");
                                        out.print("</tr>");
                                        sum += ncoups[i];
                                    }
                                }
                                out.print("<tr>");
                                        out.print("<td></td>");
                                        out.print("<td>Moyenne : "+sum/nparties+"</td>");
                                out.print("</tr>");
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
         </div>
    </body>
</html>