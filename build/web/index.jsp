<%@page import="br.uninove.uniclima.http.Http"%>
<%@page import="br.uninove.uniclima.tempo.Tempo"%>
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
    </head>
    <body>
        
    <!-- barra de navegação-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a href="./" class="navbar-brand">UniClima</a>
            <form class="d-flex" method="POST">
                <input type="search" name="cidade" value="<%=cidade%>" class="form-control me-2" placeholder="Nome da cidade">
                <button class="btn btn-outline-info" type="submit">Buscar</button>
            </form>
        </div>
    </nav>
    
    <%  if(clima != null) { %>
    
    <div class="container  d-flex justify-content-around mt-4">
        <div class="row" style="width: 25rem">
            <div class="tempo-card">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <img src="https://openweathermap.org/img/wn/<%=clima.getWeather().get(0).getIcon()%>@2x.png">
                            <h3>Cidade: <%= clima.getName() + ", " + clima.getSys().getCountry() %></h3>
                        </div>
                        <hr>
                        <div>
                            <p class="text-capitalize"><strong>Agora: </strong><%=clima.getWeather().get(0).getDescription() %></p>
                            <p><strong>Temperatura: </strong><%= clima.getMain().getTemp()%>ºC</p>
                            <p><strong>Max: </strong><%= clima.getMain().getTempMax()%>ºC</p>
                            <p><strong>Min: </strong><%= clima.getMain().getTempMin()%>ºC</p>
                            <p><strong>Umidade: </strong><%= clima.getMain().getHumidity()%>%</p>
                            <p><strong>Sensação térmica: </strong><%= clima.getMain().getFeelsLike() %>ºC</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } else { %>
    <div class="container d-flex justify-content-around" style="margin-top:5rem">
        <div class="row">
            <div class="tempo-card">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <h4> <%= cidade.isEmpty() ? "Digita o nome da cidade" : "Cidade não encontrada" %> </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } %>
    </body>
</html>