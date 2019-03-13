<%-- 
    Document   : action
    Created on : 5 févr. 2019, 09:47:32
    Author     : skerautr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Action</title>
    </head>
    <body>

        <% 
        if(request.getParameter("log").toLowerCase().trim().equals("admin") && request.getParameter("pwd").toLowerCase().trim().equals("admin")){
            session.setAttribute("log", request.getParameter( "log" )) ;
            session.setAttribute("pwd", request.getParameter( "pwd" )) ;
            response.sendRedirect("admin.jsp");
        }else if(request.getParameter("log").toLowerCase().trim().equals("user") && request.getParameter("pwd").toLowerCase().trim().equals("user")){
            session.setAttribute("log", request.getParameter( "log" )) ;
            session.setAttribute("pwd", request.getParameter( "pwd" )) ;
            response.sendRedirect("user.jsp");
        }else{
            session.setAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Login ou password incorrect\n" +
                    "</div>") ;
            response.sendRedirect("index.jsp");
        }
        %>      
                
    </body>
</html>
