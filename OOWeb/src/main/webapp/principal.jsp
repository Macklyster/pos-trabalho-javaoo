<%@page import="br.com.macklyster.ooweb.Lugar"%>
<jsp:useBean class="br.com.macklyster.ooweb.Jogador" id="jogador" scope="session"/>
<jsp:useBean class="br.com.macklyster.ooweb.Mapa" id="mapa" scope="application"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = request.getParameter("nome");
    String movimento = request.getParameter("movimento");
    String mensagem = request.getParameter("mensagem");
    if (nome != null) {
        jogador.setNome(nome);
        jogador.setLugar(mapa.getLugarInicialJogador());
    }
    Lugar lc = jogador.getLugar();
    if (mensagem != null && mensagem.trim().length() > 0) {
        lc.getMensagens().add(jogador.getNome() + ":" + mensagem);
    }

    if (movimento != null && movimento.trim().length() > 0) {
        int opcao = Integer.parseInt(movimento);
        if (opcao == 1 && lc.getLeste() != null) {
            jogador.setLugar(lc.getLeste());
        } else if (opcao == 2 && lc.getOeste() != null) {
            jogador.setLugar(lc.getOeste());
        } else if (opcao == 3 && lc.getNorte() != null) {
            jogador.setLugar(lc.getNorte());
        } else if (opcao == 4 && lc.getSul() != null) {
            jogador.setLugar(lc.getSul());
        }
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trabalho Java OO - Jogo 2017</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="index.html">MR</a></li>
                        </ul>
                        <ul class="nav navbar-nav" style="float: right">
                            <li><a href="#">Bem Vindo: <%=jogador.getNome()%></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="jumbotron">
                <h2 class="text-primary"><%=jogador.getNome()%>, 
                    <small class="text-danger">você está no(a):
                        <%=jogador.getLugar().getDescricao()%></small>
                </h2>
                <%
                    lc = jogador.getLugar();
                    String imagem = lc.getImagem();
                %>

                <%
                    if (imagem != null) {
                        out.print("<img src='imagens/" + imagem + "' class='thumbnail imgLugar text-center'>");
                    }
                %>

                <h4 class="text-warning">Com:
                    <%=jogador.getLugar().getPersonagens()%></h4>

                <h5 class="text-info">Mensagens
                    <%=jogador.getLugar().getMensagens()%></h5>
            </div>


            <div class="panel panel-primary">
                <div class="panel-heading">Escolha aqui o seu caminho!!!</div>
                <div class="panel-body">
                    <pre class="label label-danger"><%

                        if (lc.getLeste() != null) {
                            out.println("1) Para leste " + lc.getLeste().getDescricao() + "<br>");
                        }
                        if (lc.getOeste() != null) {
                            out.println("2) Para Oeste " + lc.getOeste().getDescricao() + "<br>");
                        }
                        if (lc.getNorte() != null) {
                            out.println("3) Para Norte " + lc.getNorte().getDescricao() + "<br>");
                        }
                        if (lc.getSul() != null) {
                            out.println("4) Para Sul " + lc.getSul().getDescricao() + "<br>");
                        }

                        %>
                    </pre>
                    <br>
                    <form method="POST" action="principal.jsp">
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2">Movimentar para?:</span>
                            <input type="number" class="form-control" 
                                   id="movimento" name="movimento" 
                                   aria-describedby="sizing-addon2">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon" id="sizing-addon2">Enviar mensagem?:</span>
                            <input type="text" class="form-control" 
                                   id="mensagem" name="mensagem" 
                                   aria-describedby="sizing-addon2">
                        </div>
                        <hr class="my-4">
                        <label class="lead">
                            <button type="submit" class="btn btn-lg btn-primary">Enviar/Movimentar</button>
                        </label>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
