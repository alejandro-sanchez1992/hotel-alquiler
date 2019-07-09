<%-- 
	Document   : index
	Created on : 15-nov-2017, 23:17:07
	Author     : Usuario
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Alquiler"%>
<%
	String cedula="",nombre="",tipo="", dias="", tipoPago="", total="", mensaje="", text="";
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
					<h1 class="text-center">RESERVAS HOTEL ONLINE</h1>
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

						<!-- Text input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="nombre">Nombre:</label>  
						  <div class="col-md-6">
						  <input id="nombre" name="nombre" type="text" placeholder="Ingrese Nombre" class="form-control input-md" required="" value="<% out.print(nombre); %>">

						  </div>
						</div>

						<!-- Select Basic -->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="tipo-habitacion">Tipo de Habitacion:</label>
						  <div class="col-md-6">
							<select id="tipo-habitacion" name="tipo-habitacion" class="form-control">
							  <option value="Doble">Doble</option>
							  <option value="Sencilla">Sencilla</option>
							</select>
						  </div>
						</div>

						<!-- Text input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="dias">Días Reserva</label>  
						  <div class="col-md-6">
						  <input id="dias" name="dias" type="text" placeholder="Ingrese días a reservar" class="form-control input-md" required="" value="<% out.print(dias); %>">

						  </div>
						</div>

						<!-- Multiple Radios -->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="metodo-pago">Metodo de Pago:</label>
						  <div class="col-md-4">
						  <div class="radio">
							<label for="metodo-pago-0">
							  <input type="radio" name="metodo-pago" id="metodo-pago-0" value="Contado" checked="checked">
							  Contado
							</label>
								</div>
						  <div class="radio">
							<label for="metodo-pago-1">
							  <input type="radio" name="metodo-pago" id="metodo-pago-1" value="Crédito">
							  Crédito
							</label>
								</div>
						  </div>
						</div>

						<!-- Text input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="total">Total a Pagar:</label>  
						  <div class="col-md-6">
                                                    <h2 style="display: inline-block; margin: 0;">$</h2><h2 class="total" style="display: inline-block; margin: 0;"><% out.print(mensaje); %></h2>
                                                    <h3 class="texto"></h3>
						  </div>
						</div>

						<!-- Button -->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="enviar"></label>
						  <div class="col-md-4">
							<button id="enviar" name="enviar" class="btn btn-success">PROCESAR PAGO</button>
						  </div>
						</div>

						</fieldset>
					</form>
					<%
						if(request.getParameter("enviar")!= null){
							cedula = request.getParameter("cedula");
							nombre = request.getParameter("nombre");
							tipo = request.getParameter("tipo-habitacion");
							dias = request.getParameter("dias");
							tipoPago = request.getParameter("metodo-pago");

							Alquiler alq = new Alquiler();
							DecimalFormat formatea = new DecimalFormat("###,###.##");
							alq.setCedula(Integer.parseInt(cedula));
							alq.setNombre(nombre);
							alq.setTipoHabitacion(tipo);
							alq.setDiasReserva(Integer.parseInt(dias));
							alq.setTipoPago(tipoPago);

							alq.CalcularPago();
							alq.Insertar();
							mensaje = String.valueOf(formatea.format(alq.getTotal()));
                                                        text = "Gracias por Su compra";
						}
					%>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script src="js/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
	</body>
</html>
