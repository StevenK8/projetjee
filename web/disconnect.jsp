<%-- 
    Document   : disconnect
    Created on : 19 févr. 2019, 09:05:01
    Author     : skerautr
--%>

<%
    session.removeAttribute("log");
    session.removeAttribute("pwd");
    response.sendRedirect("index.jsp");
    %>