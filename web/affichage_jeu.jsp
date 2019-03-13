<%-- 
    Document   : affichage_jeu
    Created on : 12 mars 2019, 10:20:01
    Author     : skerautr
--%>
<%
    if(session.getAttribute("log") == null || !session.getAttribute("log").equals("user")){
        response.sendRedirect("index.jsp");
    }
%>
<jsp:include page="header.html" />
<%!
public Data deplacement(Data data, int randnum){
    // Récupération
    boolean [][] carre = data.getCarre();
    int i = data.getI();
    int j = data.getJ();
    
    // Traitement
    carre[i][j] = false;
    if(randnum%2!=0){// Si impair
        if(i==0)
            i++;
        else
            i--;
    }else{ // Si pair
        if(j==0)
            j++;
        else
            j--;
    }
    carre[i][j] = true;
    
    // Assignation
    data.setCarre(carre);
    data.setI(i);
    data.setJ(j);
    
    return data; 
}

public char lettreCorrespondante(boolean[][] carre){
    char c = 'A';
    
    if(carre[0][1]){
        c = 'B';
    }
    else if (carre[1][0]){
        c = 'D';
    }
    else if (carre[1][1]){
        c = 'C';
    }
    
    return c;
}

%>

<%@page import="projet.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css.css">
    </head>
    <body class="background">
    <div class="container">
        <img src="./images/carreABCD.png" alt="carre ABCD" role="presentation" class="img-responsive atto_image_button_text-bottom" width="134" height="121">

        <%
            /*
            Data data=(Data)session.getAttribute("test");
            out.print(session);
            
            boolean [][] carre = data.getCarre();
            int i = data.getI();
            int j = data.getJ();*/
            int nbcoups = 0;
            int nbparties = Integer.parseInt(request.getParameter("nbparties"));
            
            //sans session
            int i=0,j=0;
            boolean[][] carre = new boolean[2][2];
            carre[0][1]=false;
            carre[1][1]=false;
            carre[1][0]=false;
            carre[i][j] = true;
            Data data = new Data(carre, i, j);
        
            if(nbparties>10)
                nbparties=10;
            else if(nbparties<5)
                nbparties = 5;
            
            int[] de = new int[20];

            char[] pos = new char[20];
            
            int randnum = 0;
            
            while(nbparties>0){
                while(!carre[1][1] && nbcoups<20){ // Chaque partie
                    randnum = (int)(Math.random()*6)+1;
                    de[nbcoups] = randnum;
                    data = deplacement(data, randnum);
                    pos[nbcoups] = lettreCorrespondante(data.getCarre());
                    nbcoups++;
                }
                out.print("<table class=\"table table-dark table-sm table-bordered table-hover\">");
                    out.print("<tbody>");
                        out.print("<tr>");
                            out.print("<th rowspan='2' scope='row' style=\"max-width: 8px;\">"+(Integer.parseInt(request.getParameter("nbparties"))-nbparties+1)+"</td>");
                            out.print("<th scope='row' >dé</th>");
                            for(int y=0; y<nbcoups; y++){
                                out.print("<td>"+de[y]+"</td>");
                            }
                        out.print("</tr>");
                        out.print("<tr>");
                            out.print("<th scope='row'>sommet</th>");
                            for(int y=0; y<nbcoups; y++){
                                out.print("<td>"+pos[y]+"</td>");
                            }
                        out.print("</tr>");
                    out.print("</tbody>");
                out.print("</table>");
                
                // Fin partie
                nbparties--;
                nbcoups=0;
                carre[1][1]=false;
                carre[0][0]=true;
            }
            
        %>

        <h4>Nombre de parties : <%=Integer.parseInt(request.getParameter("nbparties"))%></h4>
    </div>
    </body>
</html>
