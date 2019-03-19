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
        
        <table cellspacing="3" cellpadding="3" border="1">
            <thead>
                <tr>
                    <th scope="col">nb de coups<br></th>
                    <th scope="col">nb de parties<br></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2</td>
                    <td>8</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>12</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>6</td>
                </tr>
                <tr>
                    <td>...</td>
                    <td>...</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>