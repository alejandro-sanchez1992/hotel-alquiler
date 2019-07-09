<%-- 
	Document   : index
	Created on : 15-nov-2017, 23:17:07
	Author     : Usuario
--%>

<%@page import="Daos.Consultar"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Alquiler"%>
<%
        int cedula = 0, i = 0;
        Alquiler alq = new Alquiler();
%>
<%
        if(request.getParameter("enviar")!= null){
                cedula = Integer.parseInt(request.getParameter("cedula"));

                DecimalFormat formatea = new DecimalFormat("###,###.##");
                alq.setCedula(cedula);
                alq.Consultar();
                //mensaje = String.valueOf(formatea.format(alq.getTotal()));
        }
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" >
		<title>JSP Page</title>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-center">CONSULTAR RESERVAS HOTEL ONLINE</h1>
					<form action="?" method="post" class="form-horizontal">
						<fieldset>

						<!-- Form Name -->
						<a href="index.jsp" class="btn btn-primary" style="display: inline-block;">Reservas Hotel</a>
						<br />
						<br />
						<a href="consultar.jsp" class="btn btn-info" style="display: inline-block;">Consultar Reservas Hotel</a>

						<!-- Text input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="cedula">Cédula:</label>  
						  <div class="col-md-6">
							  <input id="cedula" name="cedula" type="text" placeholder="Ingrese Número Cédula" class="form-control input-md" required="" value="<% out.print(cedula); %>">

						  </div>
						</div>

						<!-- Button -->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="enviar"></label>
						  <div class="col-md-4">
							<button id="enviar" name="enviar" class="btn btn-success">CONSULTAR REGISTRO</button>
						  </div>
						</div>

						</fieldset>
					</form>

					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Cédula</th>
									<th>Nombre</th>
									<th>Tipo de Habitación</th>
									<th>Días de Reserva</th>
									<th>Tipo de pago</th>
									<th>Total pagado</th>
								</tr>
							</thead>
							<tbody>
                                                            <% if(alq.getCedula() != 0) { %>
                                                            <% LinkedList<Alquiler> list = Consultar.ConsultarDatos(cedula); %>
                                                                <% for (i = 0; i < list.size(); i++) { %>
                                                                    <tr>
                                                                            <th scope="row">1</th>
                                                                            <td><% out.print(list.get(i).getCedula()); %></td>
                                                                            <td><% out.print(list.get(i).getNombre()); %></td>
                                                                            <td><% out.print(list.get(i).getTipoHabitacion()); %></td>
                                                                            <td><% out.print(list.get(i).getDiasReserva()); %></td>
                                                                            <td><% out.print(list.get(i).getTipoPago()); %></td>
                                                                            <td><% out.print(list.get(i).getTotal()); %></td>
                                                                    </tr>
                                                                <% } %>
                                                            <% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script src="js/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
	</body>
</html>
