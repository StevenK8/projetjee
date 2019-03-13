<%-- 
    Document   : user
    Created on : 12 mars 2019, 08:56:12
    Author     : skerautr
--%>
<%
    if(session.getAttribute("log") == null || !session.getAttribute("log").equals("user")){
        response.sendRedirect("index.jsp");
    }
%>
<jsp:include page="header.html" />
<%@page import="projet.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link rel="stylesheet" href="css.css">
    </head>
    <body>
        <div style="float:right">
            <form name="form1" method="post" action="disconnect.jsp">
              <input class="btn btn-danger" name="submit" type="submit" id="submit" value="Déconnexion">
            </form>
        </div>

        <h1>Bienvenue, user</h1>

        <hr>
        <div class="container">
            <img src="./images/carreABCD.png" alt="carre ABCD" role="presentation" class="img-responsive atto_image_button_text-bottom" width="134" height="121">

            <%

            int i=0,j=0;
            boolean[][] carre = new boolean[2][2];
            carre[0][1]=false;
            carre[1][1]=false;
            carre[1][0]=false;
            carre[i][j] = true;
            Data test = new Data(carre, i, j);
            session.setAttribute("test", test);

            %>


            <form action="affichage_jeu.jsp" method="post">
                <input class="form-control" type="number" name="nbparties" value="5" min="5" max="10" required/>
                <input type="submit" value="Lancer dé" class="btn btn-primary"/>
            </form>

            <hr>
            <div class="table-responsive">
                <table class="table table-dark table-bordered ">
                    <thead class="thead thead-dark">
                        <tr>
                            <th scope="col">partie</th>
                            <th scope="col">nb de coups<br></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        //SQL

                        int nparties=0;//temp
                        int[] val = new int[nparties];

                        for (i=0; i<nparties; i++){
                            out.print("<tr>");
                                out.print("<td>"+i+"</td>");
                                out.print("<td>"+val[i]+"</td>");
                            out.print("</tr>");
                        }
                        %>
                        <tr>
                            <td>1</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>12</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
