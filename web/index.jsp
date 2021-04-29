<%@page import="br.uninove.uniclima.tempo.Tempo"%>
<%@page import="br.uninove.uniclima.http.Http"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    Tempo clima = null;
    String cidade = "";
    
    if(request.getParameter("cidade") != null) {
        cidade = request.getParameter("cidade");
        clima = Http.getTempo(cidade);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniClima</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

        <style>
        .tempo-card {
        padding-top: 120px;
        width: 400px;
        margin: 0 auto !important;
        }
        </style>
    </head>
    <body>
        
        
        <nav
            <div class ="container-fluid">
                <a href="index.jsp" class="navbar-brand">UniClima</a>
                
            </div>
            
    </nav>
        
        
    </body>
</html>
